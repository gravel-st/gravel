package org.gravel.support.compiler;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.gravel.support.jvm.Block1;
import org.gravel.support.jvm.DictionaryExtensions;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.Node;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class ConstantExtractor implements Opcodes {
	private final HashMap<LiteralNode, String> constantMap = new HashMap<LiteralNode, String>();
	private int constantLabelCount = 0;

	public HashMap<LiteralNode, String> getConstantMap() {
		return constantMap;
	}

	public int getConstantLabelCount() {
		return constantLabelCount;
	}

	private void addConstant(LiteralNode node) {
		final String currentLabel = constantMap.get(node);
		if (currentLabel == null) {
			constantMap.put(node, newConstantLabelName());
		}
	}

	private String newConstantLabelName() {
		return getConstantLabelName(constantLabelCount++);
	}

	public String getConstantLabelName(int constantIndex) {
		return "__constant_" + constantIndex;
	}

	public void loadConstantMap(List<MethodNode> methods) {
		for (Node node : methods) {

			loadConstantsInNode(node);
		}
	}

	public void loadConstantsInNode(Node node) {
		node.allNodesDo_pruneWhere_(new Block1<Object, Node>() {

			@Override
			public Object value_(Node node) {
				if (node.isByteArrayLiteralNode()) {
					addConstant(((LiteralNode) node));
				}
				if (node.isSymbolLiteralNode()) {
					addConstant(((LiteralNode) node));
				}
				if (node.isFixedPointLiteralNode()) {
					addConstant(((LiteralNode) node));
				}
				if (node.isIntegerLiteralNode()) {
					Object intValue = ((LiteralNode) node).value();
					if (intValue instanceof BigInteger) {
						addConstant((LiteralNode) node);
					} else if (intValue instanceof Integer) {
						int integer = (int) ((Integer) intValue);
						if (integer < 6) {
							addConstant((LiteralNode) node);
						}
					}
				}
				return null;
			}

		}, new Block1<Boolean, Node>() {

			@Override
			public Boolean value_(Node node) {
				boolean isArrayLiteralNode = node.isArrayLiteralNode();
				if (isArrayLiteralNode) {
					addConstant((LiteralNode) node);
				}
				return isArrayLiteralNode;
			}
		});
	}

	public void writeStaticFields(ClassWriter cw) {
		for (int i = 0; i < getConstantLabelCount(); i++) {
			String constantLabel = getConstantLabelName(i);

			FieldVisitor fv = cw.visitField(ACC_FINAL + ACC_STATIC,
					constantLabel, "Ljava/lang/Object;", null, null);
			fv.visitEnd();
		}

	}

	public void writeStaticFieldAssignments(MethodVisitor mv, String owner) {
		for (int i = 0; i < getConstantLabelCount(); i++) {
			String constantLabel = getConstantLabelName(i);
			LiteralNode node = DictionaryExtensions.keyAtValue_(
					getConstantMap(), constantLabel);
			new BytecodeConstantFieldGenerator(mv).visit_(node);

			mv.visitFieldInsn(PUTSTATIC, owner, constantLabel,
					"Ljava/lang/Object;");
		}
	}

}
