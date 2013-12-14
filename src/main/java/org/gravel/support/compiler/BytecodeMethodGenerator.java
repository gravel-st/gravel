package org.gravel.support.compiler;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaType;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.jvm.ArrayExtensions;
import org.gravel.support.jvm.Block1;
import org.gravel.support.jvm.NonLocalReturn;
import org.gravel.support.jvm.Predicate1;
import org.gravel.support.jvm.runtime.MethodTools;
import org.gravel.support.parser.ArrayAtNode;
import org.gravel.support.parser.ArrayAtPutNode;
import org.gravel.support.parser.ArrayLiteralNode;
import org.gravel.support.parser.ArraySizeNode;
import org.gravel.support.parser.AssignmentNode;
import org.gravel.support.parser.BinaryMessageNode;
import org.gravel.support.parser.BlockNode;
import org.gravel.support.parser.BooleanAndNode;
import org.gravel.support.parser.BooleanLiteralNode;
import org.gravel.support.parser.BooleanOrNode;
import org.gravel.support.parser.ByteArrayLiteralNode;
import org.gravel.support.parser.CascadeNode;
import org.gravel.support.parser.CharacterLiteralNode;
import org.gravel.support.parser.CreateHolderNode;
import org.gravel.support.parser.Expression;
import org.gravel.support.parser.FieldReadNode;
import org.gravel.support.parser.FieldWriteNode;
import org.gravel.support.parser.FixedPointLiteralNode;
import org.gravel.support.parser.FloatLiteralNode;
import org.gravel.support.parser.GlobalReadNode;
import org.gravel.support.parser.GlobalWriteNode;
import org.gravel.support.parser.IdentityComparisonNode;
import org.gravel.support.parser.IfTrueIfFalseNode;
import org.gravel.support.parser.InlineExpressionCollection;
import org.gravel.support.parser.InstanceCreationNode;
import org.gravel.support.parser.IntegerLiteralNode;
import org.gravel.support.parser.IsNilNode;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.LocalReadNode;
import org.gravel.support.parser.LocalWriteNode;
import org.gravel.support.parser.MessageNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.NamespacedVariableNode;
import org.gravel.support.parser.NilLiteralNode;
import org.gravel.support.parser.Node;
import org.gravel.support.parser.NonLocalReturnNode;
import org.gravel.support.parser.NonLocalVariableFinder;
import org.gravel.support.parser.ReadHolderNode;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.ReferenceLiteralNode;
import org.gravel.support.parser.ReturnNode;
import org.gravel.support.parser.SelectorConverter;
import org.gravel.support.parser.SelfNode;
import org.gravel.support.parser.SequenceNode;
import org.gravel.support.parser.SourcePosition;
import org.gravel.support.parser.Statement;
import org.gravel.support.parser.StringLiteralNode;
import org.gravel.support.parser.SuperNode;
import org.gravel.support.parser.SymbolLiteralNode;
import org.gravel.support.parser.ToDoNode;
import org.gravel.support.parser.TypeCast;
import org.gravel.support.parser.VariableDeclarationNode;
import org.gravel.support.parser.VariableNode;
import org.gravel.support.parser.WhileFalseNode;
import org.gravel.support.parser.WhileTrueNode;
import org.gravel.support.parser.WriteHolderNode;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

public class BytecodeMethodGenerator extends BytecodeInstructionGenerator {
	private static final JavaType NON_LOCAL_RETURN = JavaType
			.getType(NonLocalReturn.class);

	public static final SelectorConverter selectorConverter = SelectorConverter.factory
			.basicNew();

	static String getDesc(final int numArgs) {
		return getDesc("Ljava/lang/Object;", numArgs, "Ljava/lang/Object;");
	}

	static String getDesc(String receiverType, final int numArgs,
			String returnDesc) {
		StringBuilder str = new StringBuilder();
		str.append('(');
		for (int i = 0; i < numArgs; i++)
			str.append(i == 0 ? receiverType : "Ljava/lang/Object;");
		str.append(')');
		str.append(returnDesc);
		return str.toString();
	}

	static String getDesc(Symbol selector) {
		return getDesc("Ljava/lang/Object;", selector.numArgs(),
				"Ljava/lang/Object;");
	}

	static String getDescWithReceiver(Symbol selector) {
		return getDesc(selector.numArgs() + 1);
	}

	public static String referenceAsClassName_(Reference reference) {
		if (reference.isMeta()) {
			return reference.nonmeta().toString() + "$Factory";
		}
		return reference.toString();
	}

	private ClassWriter cw;

	private String owner;

	private JavaVarDecl[] localVariables;

	private int tempIndex = 0;

	private boolean isStatic;

	private List<InnerClassDefinition> innerclasses;

	private String methodName;

	private String methodDesc;

	private boolean isBlock = false;

	private JavaVarDecl[] localCopiedVariables;

	private JavaType localCopiedVariablesOwner;

	private HashMap<LiteralNode, String> constantMap;

	private JavaType identityType;

	private SourceIndex sourceIndex;

	private Symbol selector;

	private Reference reference;

	private ASTConstants astConstants;

	private LiteralBlockInlinePrecondition lbiPrecondition;
	private boolean insertDebugPrintStatements = false;

	private CompilerSettings settings = CompilerSettings.getDefault();

	public BytecodeMethodGenerator(Reference reference, ClassWriter cw,
			String owner, JavaType identityType, boolean isStatic,
			List<InnerClassDefinition> innerclasses, JavaType localCopyOwner,
			JavaVarDecl[] localCopiedVariables,
			HashMap<LiteralNode, String> constantMap, SourceIndex sourceIndex,
			ASTConstants astConstants) {
		this.reference = reference;
		this.cw = cw;
		this.owner = owner;
		this.identityType = identityType;
		this.isStatic = isStatic;
		this.innerclasses = innerclasses;
		this.localCopiedVariablesOwner = localCopyOwner;
		this.localCopiedVariables = localCopiedVariables;
		this.astConstants = astConstants;
		this.constantMap = constantMap;
		this.sourceIndex = sourceIndex;
	}

	private int addLocalVariable(final String varName) {
		return addLocalVariable(varName, JavaType.getType(Object.class));
	}

	private int addLocalVariable(final String varName, final JavaType decl) {
		if (indexOfVarDecl(localVariables, varName) != -1)
			throw new RuntimeException("Variable already added");
		if (indexOfVarDecl(localCopiedVariables, varName) != -1)
			throw new RuntimeException("Variable already exists as instVar");
		localVariables = ArrayExtensions.copyWith_(localVariables,
				new JavaVarDecl(varName, decl, null));
		return localVariables.length - 1;
	}

	public boolean attemptProduceExtractedConstant(LiteralNode literalNode) {
		String constantLabel = constantMap.get(literalNode);
		if (constantLabel == null)
			return false;
		mv.visitFieldInsn(GETSTATIC, owner, constantLabel, "Ljava/lang/Object;");
		return true;
	}

	private void castFromObject(JavaType receiver) {
		if (insertDebugPrintStatements) {
			printNodePosition("CheckCast: " + receiver.getDescriptor());
			mv.visitInsn(DUP);
			mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
					"Ljava/io/PrintStream;");
			mv.visitInsn(SWAP);
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println",
					"(Ljava/lang/Object;)V");
		}

		switch (receiver.type().getSort()) {
		case Type.OBJECT: {
			mv.visitTypeInsn(CHECKCAST, receiver.getInternalName());
			return;
		}
		case Type.INT: {
			mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
					"()I");
			return;
		}
		case Type.CHAR: {
			mv.visitTypeInsn(CHECKCAST, "java/lang/Character");
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Character",
					"charValue", "()C");
			return;
		}
		case Type.BOOLEAN: {
			mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "valueOf",
					"()Z");
			return;
		}
		case Type.ARRAY:
			mv.visitTypeInsn(CHECKCAST, receiver.getInternalName());
			return;
		}
		throw new RuntimeException("NIY:" + receiver);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	private InnerClassDefinition createBlockInnerClass(BlockNode blockNode,
			JavaVarDecl[] copiedVariables) {
		final InnerClassDefinition innerClassDefinition = newInnerClassDefinition();
		final ASTConstants blockAstConstants = new ASTConstants();
		innerClassDefinition.setBytes(new BytecodeBlockGenerator(
				reference, blockNode, owner, innerClassDefinition
						.innerclassName(), methodName, methodDesc,
				innerclasses, copiedVariables, constantMap, sourceIndex,
				selector, blockAstConstants, lbiPrecondition).generate());
		innerClassDefinition.setAstConstants(blockAstConstants);
		return innerClassDefinition;
	}

	public void emitSourcePositionEnd(Node node) {
		if (insertDebugPrintStatements) {
			mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
					"Ljava/io/PrintStream;");
			mv.visitLdcInsn("DONE: " + node.sourceString());
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println",
					"(Ljava/lang/String;)V");
		}
	}

	public void emitSourcePositionStart(Node node) {
		if (insertDebugPrintStatements) {
			mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
					"Ljava/io/PrintStream;");
			mv.visitLdcInsn(node.sourceString());
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println",
					"(Ljava/lang/String;)V");
		}
		if (node.sourcePosition() != null && sourceIndex != null) {
			Label l1 = new Label();
			mv.visitLabel(l1);
			mv.visitLineNumber(lineNumberOf(node.sourcePosition()), l1);
		}
	}

	private JavaVarDecl findVarDecl(final JavaVarDecl[] varDecls,
			final String varName) {

		final int index = ArrayExtensions.indexWhere_(varDecls,
				new Predicate1<JavaVarDecl>() {
					@Override
					public boolean value_(JavaVarDecl varDecl) {
						return varDecl.name().equals(varName)
								&& varDecl.isInScope();
					}
				}) - 1;
		if (index == -1)
			return null;

		return varDecls[index];
	}

	private JavaVarDecl findVarDecl(final String varName) {
		JavaVarDecl localCopy = findVarDecl(localCopiedVariables, varName);
		if (localCopy != null) {
			return localCopy;
		}

		int index = indexOfVarDecl(localVariables, varName);
		if (index != -1) {
			return localVariables[index];
		}
		throw new RuntimeException("Can't find JavaVarDecl: " + varName);
	}

	public void generate(MethodNode methodNode) {
		lbiPrecondition = LiteralBlockInlinePrecondition.getDefault().denySelector(methodNode.selector());

		selector = Symbol.value(methodNode.selector());
		methodName = selectorConverter.selectorAsFunctionName_(selector);
		// System.out.println(owner + ">>" + methodName);

		if (isStatic) {
			// methodDesc = getDesc(identityType.getDescriptor(),
			// selector.numArgs() + 1, "Ljava/lang/Object;");
			methodDesc = getDesc("Ljava/lang/Object;", selector.numArgs() + 1,
					"Ljava/lang/Object;");
			mv = cw.visitMethod(ACC_PUBLIC | ACC_STATIC, methodName,
					methodDesc, null, null);

		} else {
			methodDesc = getDesc(selector);
			mv = cw.visitMethod(ACC_PUBLIC, methodName, methodDesc, null, null);
		}
		mv.visitCode();
		Label startLabel = new Label();
		mv.visitLabel(startLabel);

		emitSourcePositionStart(methodNode);

		localVariables = new JavaVarDecl[methodNode.arguments().length + 1];
		localVariables[0] = newSelfVarDecl();
		for (int i = 0; i < methodNode.arguments().length; i++) {
			final VariableDeclarationNode argDeclNode = methodNode.arguments()[i];

			localVariables[i + 1] = new JavaVarDecl(argDeclNode.name(),
					JavaType.getType(Object.class).asHolder(
							argDeclNode.isHolderDeclarationNode()), null);
		}

		final String[] primitive = methodNode.primitiveIn_(identityType
				.getClassName());
		if (primitive == null) {
			generateNonPrimitive(methodNode);
		} else {
			try {
				generatePrimitive(selector, methodNode,
						JavaType.getType(Class.forName(primitive[0])),
						primitive[1]);
			} catch (ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
		}

		produceLocalVariableInfo(startLabel);
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}

	public void generateBlockBody(BlockNode blockNode,
			MethodVisitor methodVisitor, Symbol sel, LiteralBlockInlinePrecondition lbiPrecondition) {
		this.lbiPrecondition = lbiPrecondition;
		selector = sel;
		isBlock = true;
		mv = methodVisitor;
		Label startLabel = new Label();
		mv.visitLabel(startLabel);
		localVariables = new JavaVarDecl[blockNode.arguments().length + 1];
		localVariables[0] = new JavaVarDecl(newTempName(),
				localCopiedVariablesOwner, null);
		for (int i = 0; i < blockNode.arguments().length; i++) {
			localVariables[i + 1] = new JavaVarDecl(
					blockNode.arguments()[i].name(),
					JavaType.getType(Object.class), null);
		}
		visit_(blockNode.body());
		if (blockNode.body().statements().length == 0) {
			pushNull();
		}
		mv.visitInsn(ARETURN);
		produceLocalVariableInfo(startLabel);

	}

	public void generateFunctionBody(MethodNode methodNode,
			MethodVisitor methodVisitor,
			LiteralBlockInlinePrecondition lbiPrecondition) {
		this.lbiPrecondition = lbiPrecondition;
		isBlock = true;
		mv = methodVisitor;
		Label startLabel = new Label();
		mv.visitLabel(startLabel);
		localVariables = new JavaVarDecl[methodNode.arguments().length];
		for (int i = 0; i < methodNode.arguments().length; i++) {
			VariableDeclarationNode parameterDeclNode = methodNode.arguments()[i];
			JavaType type;
			if (parameterDeclNode.isHolderDeclarationNode())
				type = JavaType.getType(Object[].class);
			else
				type = JavaType.getType(Object.class);
			localVariables[i] = new JavaVarDecl(parameterDeclNode.name(), type,
					null);
		}
		generateNonPrimitive(methodNode);
		produceLocalVariableInfo(startLabel);

	}

	public void generateNonPrimitive(MethodNode methodNode) {
		if (methodNode.nlrMarker() != null) {
			String nlrMarker = methodNode.nlrMarker();
			addLocalVariable(nlrMarker);
			Label nlrTryStart = new Label();
			Label nlrTryEnd = new Label();
			Label nlrTryHandler = new Label();
			mv.visitTryCatchBlock(nlrTryStart, nlrTryEnd, nlrTryHandler,
					NON_LOCAL_RETURN.getInternalName());
			mv.visitTypeInsn(NEW, "java/lang/Object");
			mv.visitInsn(DUP);
			mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>",
					"()V");
			mv.visitVarInsn(ASTORE, localIndex(nlrMarker));
			mv.visitLabel(nlrTryStart);

			produceMethodBody(methodNode.body());
			mv.visitLabel(nlrTryEnd);
			mv.visitLabel(nlrTryHandler);
			final String ex = newTempName();
			addLocalVariable(ex, NON_LOCAL_RETURN);
			mv.visitVarInsn(ASTORE, localIndex(ex));

			mv.visitVarInsn(ALOAD, localIndex(ex));
			mv.visitFieldInsn(GETFIELD, NON_LOCAL_RETURN.getInternalName(),
					"marker", "Ljava/lang/Object;");
			mv.visitVarInsn(ALOAD, localIndex(nlrMarker));
			Label notMine = new Label();
			mv.visitJumpInsn(IF_ACMPNE, notMine);
			mv.visitVarInsn(ALOAD, localIndex(ex));
			mv.visitFieldInsn(GETFIELD, NON_LOCAL_RETURN.getInternalName(),
					"returnValue", "Ljava/lang/Object;");
			mv.visitInsn(ARETURN);

			mv.visitLabel(notMine);
			mv.visitVarInsn(ALOAD, localIndex(ex));
			mv.visitInsn(ATHROW);

			mv.visitInsn(ARETURN);
		} else {
			produceMethodBody(methodNode.body());
		}
	}

	private void generatePrimitive(Symbol selector, MethodNode methodNode,
			JavaType receiver, String methodName) {
		Class<?> receiverClass = receiver.toClass();
		Method method = MethodTools.searchForMethod(receiverClass, methodName,
				selector.numArgs() + 1, true);
		if (method == null) {
			method = MethodTools.searchForMethod(receiverClass, methodName,
					selector.numArgs(), false);

			if (method == null) {
				mv.visitTypeInsn(NEW, "java/lang/RuntimeException");
				mv.visitInsn(DUP);
				String message = "No method " + methodName + " in "
						+ receiver.getClassName();
				log(message);
				mv.visitLdcInsn(message);
				mv.visitMethodInsn(INVOKESPECIAL, "java/lang/RuntimeException",
						"<init>", "(Ljava/lang/String;)V");
				mv.visitInsn(ATHROW);
				return;
			}
			final String methodDescriptor = Type.getMethodDescriptor(method);
			produceVarRead("self");
			castFromObject(receiver);
			for (int i = 0; i < methodNode.arguments().length; i++) {
				VariableDeclarationNode arg = methodNode.arguments()[i];
				produceVarRead(arg.name());
				castFromObject(JavaType.getType(method.getParameterTypes()[i]));
			}
			if (receiverClass.isInterface()) {
				mv.visitMethodInsn(INVOKEINTERFACE, receiver.getInternalName(),
						methodName, methodDescriptor);

			} else {
				mv.visitMethodInsn(INVOKEVIRTUAL, receiver.getInternalName(),
						methodName, methodDescriptor);
			}

		} else {
			produceVarRead("self");
			castFromObject(JavaType.getType(method.getParameterTypes()[0]));
			for (int i = 0; i < methodNode.arguments().length; i++) {
				VariableDeclarationNode arg = methodNode.arguments()[i];
				produceVarRead(arg.name());
				castFromObject(JavaType
						.getType(method.getParameterTypes()[i + 1]));
			}
			mv.visitMethodInsn(INVOKESTATIC, receiver.getInternalName(),
					methodName, Type.getMethodDescriptor(method));
		}
		if (method.getReturnType().isPrimitive()) {
			returnNonPrimitive(method.getReturnType());
		} else {
			mv.visitInsn(ARETURN);
		}
	}

	public JavaVarDecl[] getBlockConstructionParameters(BlockNode blockNode) {
		List<String> list = Arrays.asList(NonLocalVariableFinder.factory
				.analyze_(blockNode));
		java.util.Collections.sort(list);
		String[] nonLocals = list.toArray(new String[list.size()]);
		JavaVarDecl[] copiedVariables = ArrayExtensions.collect_(nonLocals,
				new Block1<JavaVarDecl, String>() {

					@Override
					public JavaVarDecl value_(String varName) {
						return findVarDecl(varName);
					}
				});

		return copiedVariables;
	}

	private int indexOfVarDecl(final JavaVarDecl[] varDecls,
			final String varName) {
		return ArrayExtensions.indexWhere_(varDecls,
				new Predicate1<JavaVarDecl>() {
					@Override
					public boolean value_(JavaVarDecl varDecl) {
						return varDecl.name().equals(varName)
								&& varDecl.isInScope();
					}
				}) - 1;
	}

	private void insertNodePosition(String nodePositionString) {
		mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
				"Ljava/io/PrintStream;");
		mv.visitLdcInsn(nodePositionString);
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println",
				"(Ljava/lang/String;)V");
	}

	private int lineNumberOf(SourcePosition sourcePosition) {
		return sourceIndex.lineNumberOf(sourcePosition);
	}

	private int localIndex(final String name) {
		int index = indexOfVarDecl(localVariables, name);
		if (index == -1)
			throw new RuntimeException("Can't resolve instVar: " + name);
		return index;
	}

	private void log(String message) {
		System.out.println(message);
	}

	private InnerClassDefinition newInnerClassDefinition() {
		final InnerClassDefinition innerClassDefinition = new InnerClassDefinition(
				innerclasses.size() + 1, owner);
		innerclasses.add(innerClassDefinition);
		return innerClassDefinition;
	}

	public JavaVarDecl newSelfVarDecl() {
		return new JavaVarDecl("self", JavaType.getType(Object.class), null);
	}

	private String newTempName() {
		return "___gen_temp" + tempIndex++;
	}

	public void printNodePosition(String nodePositionString) {
		if (insertDebugPrintStatements) {
			insertNodePosition(nodePositionString);
		}
	}

	private void produceBlockInlineMessageSend(MessageNode messageNode) {
		Symbol selector = Symbol.value(messageNode.selector());
		String name = selectorConverter.selectorAsFunctionName_(selector);

		final Expression[] arguments = messageNode.arguments();
		final int argLength = arguments.length;
		StringBuilder paramSource = new StringBuilder();
		StringBuilder descStream = new StringBuilder();
		descStream.append("(");
		descStream.append(JavaType.getType(Object.class).getDescriptor());
		for (int i = 0; i < argLength; i++) {
			if (i != 0) {
				paramSource.append(" ");
			}
			final Expression arg = arguments[i];
			if (arg.isBlockNode()) {
				final BlockNode blockNode = (BlockNode) arg;
				final JavaVarDecl[] copiedVariables = getBlockConstructionParameters(blockNode);
				for (JavaVarDecl copiedVar : copiedVariables) {
					produceVarRead(copiedVar.name());
					castFromObject(copiedVar.decl());
					descStream.append(JavaType.getType(Object.class)
							.getDescriptor());
					// descStream.append(copiedVar.decl().getDescriptor());
				}
				paramSource.append(astConstants.labelForBlock(blockNode,
						copiedVariables));
			} else {
				visit_(arg);
				paramSource.append("nil");
				descStream.append(JavaType.getType(Object.class)
						.getDescriptor());
			}
		}
		descStream.append(")");
		descStream.append(JavaType.getType(Object.class).getDescriptor());
		printNodePosition("blockBootstrap: " + name + " "
				+ descStream.toString());
		mv.visitInvokeDynamicInsn(name, descStream.toString(),
				BytecodeClassGenerator.blockBootstrap, paramSource.toString(), astConstants.labelForLbiPrecondition(lbiPrecondition.denySelector(messageNode.selector())));
		printNodePosition("post blockBootstrap: " + name);
	}

	private void produceExtractedConstant(LiteralNode literalNode) {
		if (!attemptProduceExtractedConstant(literalNode))
			throw new RuntimeException("Constant not found");
	}

	private void produceLocalVariableInfo(Label startLabel) {
		Label varLabel = new Label();
		mv.visitLabel(varLabel);
		for (int i = 0; i < localVariables.length; i++) {
			mv.visitLocalVariable(localVariables[i].name(), localVariables[i]
					.decl().getDescriptor(), null, startLabel, varLabel, i);
		}
	}

	private void produceMessageSend(MessageNode messageNode) {
		if (settings.literalBlockInlining() && lbiPrecondition.canInline(messageNode)) {
			produceBlockInlineMessageSend(messageNode);
			return;
		}
		Symbol selector = Symbol.value(messageNode.selector());
		String name = selectorConverter.selectorAsFunctionName_(selector);
		String desc = getDescWithReceiver(selector);
		
		for (Expression arg : messageNode.arguments()) {
			visit_(arg);
		}
		
		mv.visitInvokeDynamicInsn(name, desc, BytecodeClassGenerator.bootstrap);
	}

	private void produceMethodBody(final SequenceNode body) {
		visit_(body);
		final int stmtsLength = body.statements().length;
		if (stmtsLength == 0) {
			mv.visitVarInsn(ALOAD, 0);
			mv.visitInsn(ARETURN);
		} else if (!(body.statements()[stmtsLength - 1].isReturnNode())) {
			mv.visitInsn(POP);
			mv.visitVarInsn(ALOAD, 0);
			mv.visitInsn(ARETURN);
		}
	}

	private void produceStatements(final Statement[] statements) {
		final int lastIndex = statements.length - 1;
		for (int i = 0; i <= lastIndex; i++) {
			Statement stmt = statements[i];
			visit_(stmt);
			if (i < lastIndex) {
				mv.visitInsn(POP);
			}
		}
	}

	private void produceSuperSend(MessageNode messageNode) {
		Symbol selector = Symbol.value(messageNode.selector());
		String functionName = selectorConverter
				.selectorAsFunctionName_(selector);
		String desc = getDescWithReceiver(selector);
		produceVarRead("self");
		for (Expression arg : messageNode.arguments()) {
			visit_(arg);
		}
		SuperNode superNode = (SuperNode) messageNode.receiver();
		JavaType selfType = JavaType.fromDotted(referenceAsClassName_(superNode
				.reference()));
		if (isBlock) {
			castFromObject(selfType);
			String outerSuperDesc = BytecodeClassGenerator
					.getOuterSuperAccessDesc(selfType, selector);
			mv.visitMethodInsn(INVOKESTATIC, selfType.getInternalName(),
					"access$" + functionName, outerSuperDesc);
		} else {
			mv.visitInvokeDynamicInsn(functionName, desc,
					BytecodeClassGenerator.superBootstrap, superNode
							.reference().toString());
		}
	}

	private void produceToDoNodeConstantStep(ToDoNode toDoNode, int step) {
		final int objectCounter = addLocalVariable(toDoNode.counterName());
		final int counter = addLocalVariable(newTempName(),
				JavaType.getType(Integer.TYPE));
		final int stop = addLocalVariable(newTempName(),
				JavaType.getType(Integer.TYPE));
		visit_(toDoNode.start());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		mv.visitVarInsn(ISTORE, counter);
		visit_(toDoNode.stop());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		mv.visitVarInsn(ISTORE, stop);

		Label test = new Label();
		mv.visitJumpInsn(GOTO, test);
		Label inc = new Label();
		mv.visitLabel(inc);
		mv.visitIincInsn(counter, step);
		mv.visitLabel(test);
		mv.visitVarInsn(ILOAD, counter);
		mv.visitVarInsn(ILOAD, stop);
		Label exit = new Label();
		if (step > 0) {
			mv.visitJumpInsn(IF_ICMPGT, exit);
		} else {
			mv.visitJumpInsn(IF_ICMPLT, exit);
		}
		mv.visitVarInsn(ILOAD, counter);
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf",
				"(I)Ljava/lang/Integer;");
		mv.visitVarInsn(ASTORE, objectCounter);
		visit_(toDoNode.doSequence());
		mv.visitInsn(POP);
		mv.visitJumpInsn(GOTO, inc);
		mv.visitLabel(exit);
		pushNull();
		removeLocalVariable(toDoNode.counterName());
	}

	private void produceToDoNodeDynamicStep(ToDoNode toDoNode) {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	private void produceVarRead(final String varName) {
		printNodePosition("produceVarRead(" + varName + ")");

		JavaVarDecl localCopy = findVarDecl(localCopiedVariables, varName);
		if (localCopy != null) {
			printNodePosition("produceVarRead(" + varName + ") GETFIELD "
					+ localCopiedVariablesOwner.getInternalName() + " "
					+ localCopy.name() + " " + localCopy.decl().getDescriptor());
			mv.visitVarInsn(ALOAD, 0);
			mv.visitFieldInsn(GETFIELD,
					localCopiedVariablesOwner.getInternalName(),
					localCopy.name(), localCopy.decl().getDescriptor());
			return;
		}

		int index = indexOfVarDecl(localVariables, varName);
		if (index != -1) {
			if (insertDebugPrintStatements) {
				printNodePosition("produceVarRead(" + varName + ") ALOAD "
						+ index);
				mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
						"Ljava/io/PrintStream;");
			}

			mv.visitVarInsn(ALOAD, index);

			if (insertDebugPrintStatements) {
				mv.visitInsn(DUP_X1);
				mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream",
						"println", "(Ljava/lang/Object;)V");
			}
			return;
		}
		throw new RuntimeException("Undeclared: " + varName);
	}

	private void removeLocalVariable(final String varName) {
		int indexOfVarDecl = indexOfVarDecl(localVariables, varName);
		if (indexOfVarDecl == -1)
			throw new RuntimeException("Unknown Variable: " + varName);
		// We cant remove a var so we set it out of scope
		JavaVarDecl javaVarDecl = localVariables[indexOfVarDecl];
		localVariables[indexOfVarDecl] = javaVarDecl.asOutOfScope();
	}

	private void returnNonPrimitive(Class<?> returnType) {
		if (returnType.getName().equals("char")) {
			mv.visitMethodInsn(INVOKESTATIC, "java/lang/Character", "valueOf",
					"(C)Ljava/lang/Character;");
			mv.visitInsn(ARETURN);
			return;
		}
		if (returnType.getName().equals("int")) {
			mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf",
					"(I)Ljava/lang/Integer;");
			mv.visitInsn(ARETURN);
			return;
		}
		if (returnType.getName().equals("long")) {
			mv.visitMethodInsn(INVOKESTATIC,
					"org/gravel/support/jvm/IntegerExtensions$Factory",
					"fromValue", "(J)Ljava/lang/Number;");
			mv.visitInsn(ARETURN);
			return;
		}
		if (returnType.getName().equals("boolean")) {
			mv.visitMethodInsn(INVOKESTATIC, "java/lang/Boolean", "valueOf",
					"(Z)Ljava/lang/Boolean;");
			mv.visitInsn(ARETURN);
			return;
		}
		if (returnType.getName().equals("void")) {
			pushNull();
			mv.visitInsn(ARETURN);
			return;
		}
		throw new UnsupportedOperationException("Not Implemented Yet: "
				+ returnType);
	}

	@Override
	public Void visit_(Node node) {
		emitSourcePositionStart(node);
		super.visit_(node);
		emitSourcePositionEnd(node);
		return null;
	}

	@Override
	public Void visitArrayAtNode_(ArrayAtNode node) {
		visit_(node.receiver());
		mv.visitTypeInsn(CHECKCAST, "[Ljava/lang/Object;");
		visit_(node.index());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		mv.visitInsn(ICONST_1);
		mv.visitInsn(ISUB);
		mv.visitInsn(AALOAD);
		return null;
	}

	@Override
	public Void visitArrayAtPutNode_(ArrayAtPutNode node) {
		visit_(node.receiver());
		mv.visitTypeInsn(CHECKCAST, "[Ljava/lang/Object;");
		visit_(node.index());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		mv.visitInsn(ICONST_1);
		mv.visitInsn(ISUB);
		visit_(node.value());
		mv.visitInsn(DUP_X2);
		mv.visitInsn(AASTORE);
		return null;
	}

	@Override
	public Void visitArrayLiteralNode_(ArrayLiteralNode literalNode) {
		produceExtractedConstant(literalNode);
		return null;
	}

	@Override
	public Void visitArraySizeNode_(ArraySizeNode node) {
		visit_(node.receiver());
		mv.visitTypeInsn(CHECKCAST, "[Ljava/lang/Object;");
		mv.visitInsn(ARRAYLENGTH);
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf",
				"(I)Ljava/lang/Integer;");
		return null;
	}

	@Override
	public Void visitAssignmentNode_(AssignmentNode assignmentNode) {
		throw new RuntimeException(
				"Can't compile AssignmentNode; Field, Local or Global expected");
	}

	@Override
	public Void visitBlockNode_(BlockNode blockNode) {
		JavaVarDecl[] copiedVariables = getBlockConstructionParameters(blockNode);
		final InnerClassDefinition innerClassDefinition = createBlockInnerClass(
				blockNode, copiedVariables);

		if (copiedVariables.length == 0) {
			mv.visitFieldInsn(GETSTATIC, innerClassDefinition.innerclassName(),
					"SINGLETON", "L" + innerClassDefinition.innerclassName()
							+ ";");
		} else {
			mv.visitTypeInsn(NEW, innerClassDefinition.innerclassName());
			mv.visitInsn(DUP);
			for (JavaVarDecl copiedVar : copiedVariables) {
				produceVarRead(copiedVar.name());
			}
			mv.visitMethodInsn(INVOKESPECIAL,
					innerClassDefinition.innerclassName(), "<init>",
					BytecodeBlockGenerator.initDesc(copiedVariables));
		}
		return null;
	}

	@Override
	public Void visitBooleanAndNode_(BooleanAndNode node) {
		Label falseLabel = new Label();
		Label endLabel = new Label();
		visit_(node.left());

		mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "TRUE",
				"Ljava/lang/Boolean;");
		mv.visitJumpInsn(IF_ACMPNE, falseLabel);
		visit_(node.right());
		mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "TRUE",
				"Ljava/lang/Boolean;");
		mv.visitJumpInsn(IF_ACMPNE, falseLabel);
		pushBoolean(true);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(falseLabel);
		pushBoolean(false);
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitBooleanLiteralNode_(BooleanLiteralNode literalNode) {
		pushBoolean(literalNode.value());
		return null;
	}

	@Override
	public Void visitBooleanOrNode_(BooleanOrNode node) {
		Label trueLabel = new Label();
		Label endLabel = new Label();
		visit_(node.left());
		mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "TRUE",
				"Ljava/lang/Boolean;");
		mv.visitJumpInsn(IF_ACMPEQ, trueLabel);
		visit_(node.right());
		mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "TRUE",
				"Ljava/lang/Boolean;");
		mv.visitJumpInsn(IF_ACMPEQ, trueLabel);
		pushBoolean(false);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(trueLabel);
		pushBoolean(true);
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitByteArrayLiteralNode_(ByteArrayLiteralNode literalNode) {
		produceExtractedConstant(literalNode);
		return null;
	}

	@Override
	public Void visitCascadeNode_(CascadeNode cascadeNode) {
		visit_(cascadeNode.receiver());
		MessageNode[] messages = cascadeNode.messages();
		for (int i = 0; i < messages.length - 1; i++) {
			mv.visitInsn(DUP);
			MessageNode message = messages[i];
			produceMessageSend(message);
			mv.visitInsn(POP);
		}
		produceMessageSend(messages[messages.length - 1]);
		return null;
	}

	@Override
	public Void visitCharacterLiteralNode_(CharacterLiteralNode literalNode) {
		pushCharacter(literalNode.value().charValue());
		return null;
	}

	@Override
	public Void visitCreateHolderNode_(CreateHolderNode createHolderNode) {
		mv.visitInsn(ICONST_1);
		mv.visitTypeInsn(ANEWARRAY, "java/lang/Object");
		return null;
	}

	@Override
	public Void visitFieldReadNode_(FieldReadNode fieldReadNode) {
		visit_(fieldReadNode.owner());
		String desc = getDesc(1);
		mv.visitInvokeDynamicInsn(fieldReadNode.field(), desc,
				BytecodeClassGenerator.fieldReadBootstrap);
		return null;
	}

	@Override
	public Void visitFieldWriteNode_(FieldWriteNode fieldWriteNode) {
		visit_(fieldWriteNode.owner());
		visit_(fieldWriteNode.value());
		mv.visitInsn(DUP_X1);
		String desc = getDesc("Ljava/lang/Object;", 2, "V");
		mv.visitInvokeDynamicInsn(fieldWriteNode.field(), desc,
				BytecodeClassGenerator.fieldWriteBootstrap);
		return null;
	}

	@Override
	public Void visitFixedPointLiteralNode_(FixedPointLiteralNode literalNode) {
		produceExtractedConstant(literalNode);
		return null;
	}

	@Override
	public Void visitFloatLiteralNode_(FloatLiteralNode literalNode) {
		Object value = literalNode.value();
		pushConstant(value);
		return null;
	}

	@Override
	public Void visitGlobalReadNode_(GlobalReadNode globalReadNode) {
		char ch = globalReadNode.name().charAt(0);
		if (ch >= 'a' && ch <= 'z') {
			throw new RuntimeException("Probably not a global: "+globalReadNode.name());
		}
		mv.visitInvokeDynamicInsn(globalReadNode.name(),
				"()Ljava/lang/Object;",
				BytecodeClassGenerator.globalReadBootstrap, globalReadNode
						.namespace().toString());
		return null;
	}

	@Override
	public Void visitGlobalWriteNode_(GlobalWriteNode globalWriteNode) {
		visit_(globalWriteNode.value());
		mv.visitInsn(DUP);
		mv.visitInvokeDynamicInsn(globalWriteNode.name(),
				"(Ljava/lang/Object;)Ljava/lang/Object;",
				BytecodeClassGenerator.globalWriteBootstrap, globalWriteNode
						.namespace().toString());
		return null;
	}

	@Override
	public Void visitIdentityComparisonNode_(
			IdentityComparisonNode identityComparisonNode) {
		visit_(BinaryMessageNode.factory.receiver_selector_argument_(
				identityComparisonNode.left(), "==",
				identityComparisonNode.right()));
		return null;
	}

	@Override
	public Void visitIfTrueIfFalseNode_(IfTrueIfFalseNode node) {
		visit_(node.test());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "booleanValue",
				"()Z");
		Label elseLabel = new Label();
		mv.visitJumpInsn(IFEQ, elseLabel);
		visit_(node.trueSequence());
		Label end = new Label();
		mv.visitJumpInsn(GOTO, end);
		mv.visitLabel(elseLabel);
		visit_(node.falseSequence());
		mv.visitLabel(end);
		return null;
	}

	@Override
	public Void visitInlineExpressionCollection_(
			InlineExpressionCollection _anObject) {
		produceStatements(_anObject.expressions());
		return null;
	}

	@Override
	public Void visitInstanceCreationNode_(
			InstanceCreationNode instanceCreationNode) {
		String slashed = BytecodeClassGenerator.slashed(instanceCreationNode
				.reference().toString());
		mv.visitTypeInsn(NEW, slashed);
		mv.visitInsn(DUP);
		mv.visitMethodInsn(INVOKESPECIAL, slashed, "<init>", "()V");
		// mv.visitInsn(ARETURN);
		return null;
	}

	@Override
	public Void visitIntegerLiteralNode_(IntegerLiteralNode literalNode) {
		Object value = literalNode.value();
		if (!attemptProduceExtractedConstant(literalNode)) {
			pushConstant(value);
		}
		return null;
	}

	@Override
	public Void visitIsNilNode_(IsNilNode node) {
//		visit_(node.receiver().send_("isNil"));
		visit_(node.receiver());
		Label falseLabel = new Label();
		Label endLabel = new Label();
		mv.visitJumpInsn(IFNONNULL, falseLabel );
		pushBoolean(true);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(falseLabel);
		pushBoolean(false);
		mv.visitLabel(endLabel);
		
		return null;
	}
	
	@Override
	public Void visitLocalReadNode_(LocalReadNode localReadNode) {
		produceVarRead(localReadNode.name());
		return null;
	}

	@Override
	public Void visitLocalWriteNode_(LocalWriteNode localWriteNode) {
		visit_(localWriteNode.value());
		mv.visitInsn(DUP);
		mv.visitVarInsn(ASTORE, localIndex(localWriteNode.name()));
		return null;
	}

	@Override
	public Void visitMessageNode_(MessageNode messageNode) {
		if (messageNode.receiver().isSuperNode()) {
			produceSuperSend(messageNode);
			return null;
		}
		visit_(messageNode.receiver());
		produceMessageSend(messageNode);
		return null;
	}

	@Override
	public Void visitNamespacedVariableNode_(NamespacedVariableNode _anObject) {
		pushNull();
		return null;
	}

	@Override
	public Void visitNilLiteralNode_(NilLiteralNode _anObject) {
		pushNull();
		return null;
	}

	@Override
	public Void visitNonLocalReturnNode_(NonLocalReturnNode returnNode) {
		if (!isBlock)
			throw new RuntimeException();
		mv.visitTypeInsn(NEW, NON_LOCAL_RETURN.getInternalName());
		mv.visitInsn(DUP);
		visit_(returnNode.value());
		produceVarRead(returnNode.marker());
		mv.visitMethodInsn(INVOKESPECIAL, NON_LOCAL_RETURN.getInternalName(),
				"<init>", "(Ljava/lang/Object;Ljava/lang/Object;)V");
		mv.visitInsn(ATHROW);
		return null;
	}

	@Override
	public Void visitReadHolderNode_(ReadHolderNode readHolderNode) {
		produceVarRead(readHolderNode.varName());
		mv.visitInsn(ICONST_0);
		mv.visitInsn(AALOAD);
		return null;
	}

	@Override
	public Void visitReferenceLiteralNode_(ReferenceLiteralNode _anObject) {
		pushNull();
		return null;
	}

	@Override
	public Void visitReturnNode_(ReturnNode returnNode) {
		visit_(returnNode.value());
		mv.visitInsn(ARETURN);
		return null;
	}

	@Override
	public Void visitSelfNode_(SelfNode selfNode) {
		produceVarRead("self");
		return null;
	}

	@Override
	public Void visitSequenceNode_(final SequenceNode sequenceNode) {
		for (VariableDeclarationNode decl : sequenceNode.temporaries()) {
			int index = addLocalVariable(
					decl.name(),
					JavaType.getType(Object.class).asHolder(
							decl.isHolderDeclarationNode()));
			pushNull();
			mv.visitVarInsn(ASTORE, index);
		}
		produceStatements(sequenceNode.statements());
		for (VariableDeclarationNode decl : sequenceNode.temporaries()) {
			removeLocalVariable(decl.name());
		}
		return null;
	}

	@Override
	public Void visitStringLiteralNode_(StringLiteralNode literalNode) {
		pushConstant(literalNode.value());
		return null;
	}

	@Override
	public Void visitSymbolLiteralNode_(SymbolLiteralNode literalNode) {
		produceExtractedConstant(literalNode);
		return null;
	}

	@Override
	public Void visitToDoNode_(ToDoNode toDoNode) {
		if (toDoNode.step().isIntegerLiteralNode()) {
			int step = ((Integer) ((IntegerLiteralNode) toDoNode.step())
					.value());
			produceToDoNodeConstantStep(toDoNode, step);
		} else {
			produceToDoNodeDynamicStep(toDoNode);
		}
		return null;
	}

	@Override
	public Void visitTypeCast_(TypeCast _aTypeCast) {
		visit_(_aTypeCast.expression());
		return null;
	}

	@Override
	public Void visitVariableNode_(final VariableNode varNode) {
		throw new RuntimeException(
				"Can't compile VariableNode; Field, Local or Global expected");
	}

	@Override
	public Void visitWhileFalseNode_(WhileFalseNode node) {
		Label topLabel = new Label();
		Label doLabel = new Label();
		Label endLabel = new Label();
		mv.visitLabel(topLabel);
		visit_(node.testSequence());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "booleanValue",
				"()Z");

		mv.visitJumpInsn(IFEQ, doLabel);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(doLabel);
		if (node.doSequence() != null) {
			visit_(node.doSequence());
			mv.visitInsn(POP);
		}
		mv.visitJumpInsn(GOTO, topLabel);
		mv.visitLabel(endLabel);
		pushNull();
		return null;
	}

	@Override
	public Void visitWhileTrueNode_(WhileTrueNode node) {
		Label topLabel = new Label();
		mv.visitLabel(topLabel);
		visit_(node.testSequence());
		mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "booleanValue",
				"()Z");

		Label endLabel = new Label();
		mv.visitJumpInsn(IFEQ, endLabel);
		if (node.doSequence() != null) {
			visit_(node.doSequence());
			mv.visitInsn(POP);
		}
		mv.visitJumpInsn(GOTO, topLabel);
		mv.visitLabel(endLabel);
		pushNull();
		return null;
	}

	@Override
	public Void visitWriteHolderNode_(WriteHolderNode writeHolderNode) {
		produceVarRead(writeHolderNode.varName());
		mv.visitInsn(ICONST_0);
		visit_(writeHolderNode.value());
		mv.visitInsn(DUP_X2);
		mv.visitInsn(AASTORE);
		return null;
	}
}
