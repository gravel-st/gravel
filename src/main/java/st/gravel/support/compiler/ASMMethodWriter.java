package st.gravel.support.compiler;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import st.gravel.support.compiler.jvm.ALoad;
import st.gravel.support.compiler.jvm.AReturn;
import st.gravel.support.compiler.jvm.AStore;
import st.gravel.support.compiler.jvm.AThrow;
import st.gravel.support.compiler.jvm.AndThenElse;
import st.gravel.support.compiler.jvm.ArrayLength;
import st.gravel.support.compiler.jvm.ByteArrayStore;
import st.gravel.support.compiler.jvm.CastArrayToObject;
import st.gravel.support.compiler.jvm.CastBooleanToObject;
import st.gravel.support.compiler.jvm.CastByteToObject;
import st.gravel.support.compiler.jvm.CastCharToObject;
import st.gravel.support.compiler.jvm.CastDefinedToObject;
import st.gravel.support.compiler.jvm.CastDoubleToObject;
import st.gravel.support.compiler.jvm.CastFloatToObject;
import st.gravel.support.compiler.jvm.CastIntToObject;
import st.gravel.support.compiler.jvm.CastLongToObject;
import st.gravel.support.compiler.jvm.CastObjectToArray;
import st.gravel.support.compiler.jvm.CastObjectToBoolean;
import st.gravel.support.compiler.jvm.CastObjectToByte;
import st.gravel.support.compiler.jvm.CastObjectToChar;
import st.gravel.support.compiler.jvm.CastObjectToDefined;
import st.gravel.support.compiler.jvm.CastObjectToDouble;
import st.gravel.support.compiler.jvm.CastObjectToFloat;
import st.gravel.support.compiler.jvm.CastObjectToInt;
import st.gravel.support.compiler.jvm.CastObjectToLong;
import st.gravel.support.compiler.jvm.CastObjectToShort;
import st.gravel.support.compiler.jvm.Dup;
import st.gravel.support.compiler.jvm.DupX1;
import st.gravel.support.compiler.jvm.DupX2;
import st.gravel.support.compiler.jvm.DynamicFieldRead;
import st.gravel.support.compiler.jvm.DynamicFieldWrite;
import st.gravel.support.compiler.jvm.DynamicGlobalRead;
import st.gravel.support.compiler.jvm.DynamicGlobalWrite;
import st.gravel.support.compiler.jvm.DynamicMessageSend;
import st.gravel.support.compiler.jvm.DynamicSuperSend;
import st.gravel.support.compiler.jvm.Frame;
import st.gravel.support.compiler.jvm.GetField;
import st.gravel.support.compiler.jvm.GetStatic;
import st.gravel.support.compiler.jvm.ILoad;
import st.gravel.support.compiler.jvm.IStore;
import st.gravel.support.compiler.jvm.IdentityCast;
import st.gravel.support.compiler.jvm.IfBooleanObjectThenElse;
import st.gravel.support.compiler.jvm.IfBooleanValueThenElse;
import st.gravel.support.compiler.jvm.IfObjectIsNullThenElse;
import st.gravel.support.compiler.jvm.IfObjectsEqualThenElse;
import st.gravel.support.compiler.jvm.IncrementLocal;
import st.gravel.support.compiler.jvm.InvokeInterface;
import st.gravel.support.compiler.jvm.InvokeSpecial;
import st.gravel.support.compiler.jvm.InvokeStatic;
import st.gravel.support.compiler.jvm.InvokeVirtual;
import st.gravel.support.compiler.jvm.JVMInstruction;
import st.gravel.support.compiler.jvm.JVMInstructionVisitor;
import st.gravel.support.compiler.jvm.JVMLocalDeclaration;
import st.gravel.support.compiler.jvm.JVMMethod;
import st.gravel.support.compiler.jvm.LabelLineNumber;
import st.gravel.support.compiler.jvm.NewArray;
import st.gravel.support.compiler.jvm.NewInstance;
import st.gravel.support.compiler.jvm.ObjectArrayLoad;
import st.gravel.support.compiler.jvm.ObjectArrayStore;
import st.gravel.support.compiler.jvm.OrThenElse;
import st.gravel.support.compiler.jvm.Pop;
import st.gravel.support.compiler.jvm.PushChar;
import st.gravel.support.compiler.jvm.PushFalse;
import st.gravel.support.compiler.jvm.PushFloat;
import st.gravel.support.compiler.jvm.PushInt;
import st.gravel.support.compiler.jvm.PushNull;
import st.gravel.support.compiler.jvm.PushString;
import st.gravel.support.compiler.jvm.PushTrue;
import st.gravel.support.compiler.jvm.PutField;
import st.gravel.support.compiler.jvm.PutStatic;
import st.gravel.support.compiler.jvm.Return;
import st.gravel.support.compiler.jvm.Subtract;
import st.gravel.support.compiler.jvm.TryCatch;
import st.gravel.support.compiler.jvm.WhileFalseLoop;
import st.gravel.support.compiler.jvm.WhileGreaterThanLoop;
import st.gravel.support.compiler.jvm.WhileLessThanLoop;
import st.gravel.support.compiler.jvm.WhileTrueLoop;

public class ASMMethodWriter extends JVMInstructionVisitor<Void> implements
		Opcodes {

	private ClassWriter cw;
	private MethodVisitor mv;

	public ASMMethodWriter(ClassWriter cw) {
		this.cw = cw;
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	public double fromage(Object x) {
		return (Double)x;
	}

	public void logToErr(final String string) {
		mv.visitFieldInsn(GETSTATIC, "java/lang/System", "err",
				"Ljava/io/PrintStream;");
		mv.visitLdcInsn(string);
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println",
				"(Ljava/lang/String;)V");
	}
	private void produceLocalVariableInfo(Label startLabel, JVMLocalDeclaration[] jvmLocalDeclarations) {
		Label varLabel = new Label();
		mv.visitLabel(varLabel);
		for (JVMLocalDeclaration local: jvmLocalDeclarations) {
			mv.visitLocalVariable(local.varName(), 
					local.type().descriptorString()
					, null, startLabel, varLabel, local.index());
		}
	}

	public void pushFloat(float value) {
		if (value == 0.0f) {
			mv.visitInsn(FCONST_0);
			return;
		}
		if (value == 1.0f) {
			mv.visitInsn(FCONST_1);
			return;
		}
		if (value == 2.0f) {
			mv.visitInsn(FCONST_2);
			return;
		}
		mv.visitLdcInsn(value);
		return;
	}

	public void pushInt(int i) {
		switch (i) {
		case (0):
			mv.visitInsn(ICONST_0);
			return;
		case (1):
			mv.visitInsn(ICONST_1);
			return;
		case (2):
			mv.visitInsn(ICONST_2);
			return;
		case (3):
			mv.visitInsn(ICONST_3);
			return;
		case (4):
			mv.visitInsn(ICONST_4);
			return;
		case (5):
			mv.visitInsn(ICONST_5);
			return;
		}
		if (i >= Byte.MIN_VALUE && i <= Byte.MAX_VALUE) {
			mv.visitIntInsn(BIPUSH, i);
			return;
		}
		if (i >= Short.MIN_VALUE && i <= Short.MAX_VALUE) {
			mv.visitIntInsn(SIPUSH, i);
			return;
		}
		mv.visitLdcInsn(i);
	}

	public Void visit_(JVMInstruction node) {
//		logToErr("Start: " + node);
		node.accept_(this);
		return null;
	}

	@Override
	public Void visitALoad_(ALoad node) {
		mv.visitVarInsn(ALOAD, node.index());
		return null;
	}

	@Override
	public Void visitAndThenElse_(AndThenElse node) {
		Label falseLabel = new Label();
		Label endLabel = new Label();
		visit_(node.left());
		mv.visitJumpInsn(IFEQ, falseLabel);
		visit_(node.right());
		mv.visitJumpInsn(IFEQ, falseLabel);
		visit_(node.trueFrame());
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(falseLabel);
		visit_(node.falseFrame());
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitAReturn_(AReturn node) {
		mv.visitInsn(ARETURN);
		return null;
	}

	@Override
	public Void visitArrayLength_(ArrayLength node) {
		mv.visitInsn(ARRAYLENGTH);
		return null;
	}

	@Override
	public Void visitAStore_(AStore node) {
		mv.visitVarInsn(ASTORE, node.index());
		return null;
	}

	@Override
	public Void visitAThrow_(AThrow node) {
		mv.visitInsn(ATHROW);
		return null;
	}

	@Override
	public Void visitByteArrayStore_(ByteArrayStore node) {
		mv.visitInsn(BASTORE);
		return null;
	}

	@Override
	public Void visitCastArrayToObject_(CastArrayToObject node) {
		return null;
	}

	@Override
	public Void visitCastBooleanToObject_(CastBooleanToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Boolean", "valueOf",
				"(Z)Ljava/lang/Boolean;");
		return null;
	}

	@Override
	public Void visitCastByteToObject_(CastByteToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf", "(I)Ljava/lang/Integer;");
		return null;
	}

	@Override
	public Void visitCastCharToObject_(CastCharToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Character", "valueOf",
				"(C)Ljava/lang/Character;");
		return null;
	}

	@Override
	public Void visitCastDefinedToObject_(CastDefinedToObject node) {
		return null;
	}

	@Override
	public Void visitCastDoubleToObject_(CastDoubleToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Double", "valueOf", "(D)Ljava/lang/Double;");
		return null;
	}

	@Override
	public Void visitCastFloatToObject_(CastFloatToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Float", "valueOf", "(F)Ljava/lang/Float;");
		return null;
	}

	@Override
	public Void visitCastIntToObject_(CastIntToObject node) {
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf",
				"(I)Ljava/lang/Integer;");
		return null;
	}

	@Override
	public Void visitCastLongToObject_(CastLongToObject _anObject) {
		mv.visitMethodInsn(INVOKESTATIC, "java/math/BigInteger", "valueOf",
				"(J)Ljava/math/BigInteger;");
		return null;
	}

	@Override
	public Void visitCastObjectToArray_(CastObjectToArray node) {
		mv.visitTypeInsn(CHECKCAST, "[" + node.elementType().descriptorString());
		return null;
	}

	@Override
	public Void visitCastObjectToBoolean_(CastObjectToBoolean _anObject) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "booleanValue",
				"()Z");
		return null;
	}

	@Override
	public Void visitCastObjectToByte_(CastObjectToByte _anObject) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		return null;
	}

	@Override
	public Void visitCastObjectToChar_(CastObjectToChar _anObject) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Character");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Character", "charValue",
				"()C");
		return null;
	}

	@Override
	public Void visitCastObjectToDefined_(CastObjectToDefined node) {
		mv.visitTypeInsn(CHECKCAST, node.type().className());
		return null;
	}

	@Override
	public Void visitCastObjectToFloat_(CastObjectToFloat _anObject) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Float");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Float", "floatValue",
				"()F");
		return null;
	}

	@Override
	public Void visitCastObjectToDouble_(CastObjectToDouble node) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Double");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Double", "doubleValue", "()D");
		return null;
	}

	@Override
	public Void visitCastObjectToInt_(CastObjectToInt node) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Integer");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Integer", "intValue",
				"()I");
		return null;
	}

	@Override
	public Void visitCastObjectToLong_(CastObjectToLong _anObject) {
		mv.visitMethodInsn(INVOKESTATIC, "st/gravel/support/jvm/IntegerExtensions", "asLong", "(Ljava/lang/Object;)J");
		return null;
	}

	@Override
	public Void visitCastObjectToShort_(CastObjectToShort _anObject) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Short");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Short", "shortValue",
				"()S");
		return null;
	}

	@Override
	public Void visitDup_(Dup _anObject) {
		mv.visitInsn(DUP);
		return null;
	}

	@Override
	public Void visitDupX1_(DupX1 _anObject) {
		mv.visitInsn(DUP_X1);
		return null;
	}

	@Override
	public Void visitDupX2_(DupX2 _anObject) {
		mv.visitInsn(DUP_X2);
		return null;
	}

	@Override
	public Void visitDynamicFieldRead_(DynamicFieldRead node) {
		mv.visitInvokeDynamicInsn(node.name(), node.methodType()
				.descriptorString(), BootstrapHandles.fieldReadBootstrap);
		return null;
	}

	@Override
	public Void visitDynamicFieldWrite_(DynamicFieldWrite node) {
		mv.visitInvokeDynamicInsn(node.name(), node.methodType()
				.descriptorString(), BootstrapHandles.fieldWriteBootstrap);
		return null;

	}

	@Override
	public Void visitDynamicGlobalRead_(DynamicGlobalRead node) {
		mv.visitInvokeDynamicInsn(node.name(), node.methodType()
				.descriptorString(),
				BootstrapHandles.globalReadBootstrap, node.namespace());
		return null;
	}

	@Override
	public Void visitDynamicGlobalWrite_(DynamicGlobalWrite node) {
		mv.visitInvokeDynamicInsn(node.name(), node.methodType()
				.descriptorString(),
				BootstrapHandles.globalWriteBootstrap, node.namespace());
		return null;
	}

	@Override
	public Void visitDynamicMessageSend_(DynamicMessageSend node) {
		mv.visitInvokeDynamicInsn(node.functionName(), node.signature()
				.descriptorString(), BootstrapHandles.bootstrap);
		return null;
	}

	@Override
	public Void visitDynamicSuperSend_(DynamicSuperSend node) {

		mv.visitInvokeDynamicInsn(node.functionName(), node.signature()
				.descriptorString(), BootstrapHandles.superBootstrap,
				node.superReference());
		return null;
	}

	@Override
	public Void visitFrame_(Frame frame) {
		for (JVMInstruction insn : frame.instructions())
			visit_(insn);
		return null;
	}

	@Override
	public Void visitGetField_(GetField node) {
		mv.visitFieldInsn(GETFIELD, node.ownerType().className(), node.name(),
				node.type().descriptorString());
		return null;
	}

	@Override
	public Void visitGetStatic_(GetStatic node) {
		mv.visitFieldInsn(GETSTATIC, node.ownerType().className(), node.name(),
				node.type().descriptorString());
		return null;
	}

	@Override
	public Void visitIdentityCast_(IdentityCast _anObject) {
		return null;
	}

	@Override
	public Void visitIfBooleanObjectThenElse_(IfBooleanObjectThenElse node) {
		mv.visitTypeInsn(CHECKCAST, "java/lang/Boolean");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/Boolean", "booleanValue",
				"()Z");
		Label elseLabel = new Label();
		mv.visitJumpInsn(IFEQ, elseLabel);
		visit_(node.trueFrame());
		Label end = new Label();
		mv.visitJumpInsn(GOTO, end);
		mv.visitLabel(elseLabel);
		visit_(node.falseFrame());
		mv.visitLabel(end);
		return null;
	}

	@Override
	public Void visitIfBooleanValueThenElse_(IfBooleanValueThenElse node) {
		Label elseLabel = new Label();
		mv.visitJumpInsn(IFEQ, elseLabel);
		visit_(node.trueFrame());
		Label end = new Label();
		mv.visitJumpInsn(GOTO, end);
		mv.visitLabel(elseLabel);
		visit_(node.falseFrame());
		mv.visitLabel(end);
		return null;
	}

	@Override
	public Void visitIfObjectIsNullThenElse_(IfObjectIsNullThenElse node) {
		Label elseLabel = new Label();
		mv.visitJumpInsn(IFNONNULL, elseLabel);
		visit_(node.trueFrame());
		Label end = new Label();
		mv.visitJumpInsn(GOTO, end);
		mv.visitLabel(elseLabel);
		visit_(node.falseFrame());
		mv.visitLabel(end);
		return null;
	}

	@Override
	public Void visitIfObjectsEqualThenElse_(IfObjectsEqualThenElse node) {
		Label elseLabel = new Label();
		mv.visitJumpInsn(IF_ACMPNE, elseLabel);
		visit_(node.trueFrame());
		Label end = new Label();
		mv.visitJumpInsn(GOTO, end);
		mv.visitLabel(elseLabel);
		visit_(node.falseFrame());
		mv.visitLabel(end);
		return null;
	}

	@Override
	public Void visitILoad_(ILoad node) {
		mv.visitVarInsn(ILOAD, node.index());
		return null;
	}

	@Override
	public Void visitIncrementLocal_(IncrementLocal node) {
		mv.visitIincInsn(node.local().index(), node.increment());
		return null;
	}

	@Override
	public Void visitInvokeInterface_(InvokeInterface node) {
		mv.visitMethodInsn(INVOKEINTERFACE, node.ownerType().className(),
				node.name(), node.signature().descriptorString());
		return null;
	}

	@Override
	public Void visitInvokeSpecial_(InvokeSpecial node) {
		mv.visitMethodInsn(INVOKESPECIAL, node.ownerType().className(),
				node.name(), node.signature().descriptorString());
		return null;
	}

	@Override
	public Void visitInvokeStatic_(InvokeStatic node) {
		mv.visitMethodInsn(INVOKESTATIC, node.ownerType().className(),
				node.name(), node.signature().descriptorString());
		return null;
	}

	@Override
	public Void visitInvokeVirtual_(InvokeVirtual node) {
		mv.visitMethodInsn(INVOKEVIRTUAL, node.ownerType().className(),
				node.name(), node.signature().descriptorString());
		return null;
	}

	@Override
	public Void visitIStore_(IStore node) {
		mv.visitVarInsn(ISTORE, node.index());
		return null;
	}

	@Override
	public Void visitLabelLineNumber_(LabelLineNumber node) {
		Label l1 = new Label();
		mv.visitLabel(l1);
		mv.visitLineNumber(node.line(), l1);
		return null;
	}

	@Override
	public Void visitNewArray_(NewArray node) {
		if (node.elementType().isObjectType())
			mv.visitTypeInsn(ANEWARRAY, "java/lang/Object");
		else if (node.elementType().isByteType())
			mv.visitIntInsn(NEWARRAY, T_BYTE);
		return null;
	}

	@Override
	public Void visitNewInstance_(NewInstance node) {
		mv.visitTypeInsn(NEW, node.type().className());
		return null;
	}

	@Override
	public Void visitObjectArrayLoad_(ObjectArrayLoad node) {
		mv.visitInsn(AALOAD);
		return null;
	}

	@Override
	public Void visitObjectArrayStore_(ObjectArrayStore node) {
		mv.visitInsn(AASTORE);
		return null;
	}

	@Override
	public Void visitOrThenElse_(OrThenElse node) {
		Label trueLabel = new Label();
		Label endLabel = new Label();
		visit_(node.left());
		mv.visitJumpInsn(IFNE, trueLabel);
		visit_(node.right());
		mv.visitJumpInsn(IFNE, trueLabel);
		visit_(node.falseFrame());
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(trueLabel);
		visit_(node.trueFrame());
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitPop_(Pop node) {
		mv.visitInsn(POP);
		return null;
	}

	@Override
	public Void visitPushChar_(PushChar node) {
		mv.visitIntInsn(BIPUSH, node.value());
		return null;
	}

	@Override
	public Void visitPushFalse_(PushFalse node) {
		mv.visitInsn(ICONST_0);
		return null;
	}

	@Override
	public Void visitPushFloat_(PushFloat node) {
		pushFloat(node.value());
		return null;
	}

	@Override
	public Void visitPushInt_(PushInt node) {
		pushInt(node.value());
		return null;
	}

	@Override
	public Void visitPushNull_(PushNull node) {
		mv.visitInsn(ACONST_NULL);
		return null;
	}

	@Override
	public Void visitPushString_(PushString node) {
		mv.visitLdcInsn(node.value());
		return null;
	}

	@Override
	public Void visitPushTrue_(PushTrue node) {
		mv.visitInsn(ICONST_1);
		return null;
	}

	@Override
	public Void visitPutField_(PutField node) {
		mv.visitFieldInsn(PUTFIELD, node.ownerType().className(), node.name(),
				node.type().descriptorString());
		return null;
	}

	@Override
	public Void visitPutStatic_(PutStatic node) {
		mv.visitFieldInsn(PUTSTATIC, node.ownerType().className(), node.name(),
				node.type().descriptorString());
		return null;
	}

	@Override
	public Void visitReturn_(Return node) {
		mv.visitInsn(RETURN);
		return null;
	}

	@Override
	public Void visitSubtract_(Subtract node) {
		mv.visitInsn(ISUB);
		return null;
	}

	@Override
	public Void visitTryCatch_(TryCatch node) {
		Label nlrTryStart = new Label();
		Label nlrTryEnd = new Label();
		Label nlrTryHandler = new Label();
		mv.visitTryCatchBlock(nlrTryStart, nlrTryEnd, nlrTryHandler, node
				.exception().className());
		mv.visitLabel(nlrTryStart);
		visit_(node.tryFrame());
		mv.visitLabel(nlrTryEnd);
		Label endLabel = new Label();
		if (node.doFrame() != null) { 
			visit_(node.doFrame());
		}
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(nlrTryHandler);
		visit_(node.catchFrame());
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitWhileFalseLoop_(WhileFalseLoop node) {
		Label topLabel = new Label();
		Label doLabel = new Label();
		Label endLabel = new Label();
		mv.visitLabel(topLabel);

		visit_(node.testFrame());
		mv.visitJumpInsn(IFEQ, doLabel);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(doLabel);
		visit_(node.doFrame());
		mv.visitJumpInsn(GOTO, topLabel);
		mv.visitLabel(endLabel);
		return null;
	}

	@Override
	public Void visitWhileGreaterThanLoop_(WhileGreaterThanLoop node) {
		Label testLabel = new Label();
		Label endLabel = new Label();
		mv.visitLabel(testLabel);
		visit_(node.testFrame());
		mv.visitJumpInsn(IF_ICMPLT, endLabel);
		visit_(node.doFrame());
		mv.visitJumpInsn(GOTO, testLabel);
		mv.visitLabel(endLabel);
		return null;
	}
	
	@Override
	public Void visitWhileLessThanLoop_(WhileLessThanLoop node) {
		Label testLabel = new Label();
		Label endLabel = new Label();
		mv.visitLabel(testLabel);
		visit_(node.testFrame());
		mv.visitJumpInsn(IF_ICMPGT, endLabel);
		visit_(node.doFrame());
		mv.visitJumpInsn(GOTO, testLabel);
		mv.visitLabel(endLabel);
		return null;
	}



	@Override
	public Void visitWhileTrueLoop_(WhileTrueLoop node) {
		Label topLabel = new Label();
		Label doLabel = new Label();
		Label endLabel = new Label();
		mv.visitLabel(topLabel);

		visit_(node.testFrame());
		mv.visitJumpInsn(IFNE, doLabel);
		mv.visitJumpInsn(GOTO, endLabel);
		mv.visitLabel(doLabel);
		visit_(node.doFrame());
		mv.visitJumpInsn(GOTO, topLabel);
		mv.visitLabel(endLabel);
		return null;
	}

	public void write(JVMMethod method) {
		mv = cw.visitMethod(ACC_PUBLIC + (method.isStatic() ? ACC_STATIC : 0),
				method.name(), method.signature().descriptorString(), null,
				null);
		mv.visitCode();
//		logToErr("Method: " + method);

		Label startLabel = new Label();
		mv.visitLabel(startLabel);

		for (JVMInstruction inst : method.instructions()) {
			inst.accept_(this);
		}
		produceLocalVariableInfo(startLabel, method.locals());
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}
}
