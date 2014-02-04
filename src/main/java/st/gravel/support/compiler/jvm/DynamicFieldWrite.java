package st.gravel.support.compiler.jvm;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import java.math.BigInteger;
import st.gravel.support.jvm.NonLocalReturn;
import st.gravel.support.compiler.jvm.JVMInstruction;
import st.gravel.support.compiler.jvm.JVMInstruction.JVMInstruction_Factory;
import st.gravel.support.compiler.jvm.JVMType;
import st.gravel.support.compiler.jvm.JVMInstructionVisitor;
import st.gravel.support.compiler.jvm.JVMStack;
import st.gravel.support.compiler.jvm.JVMMethodType;
import st.gravel.support.compiler.jvm.JVMVoidType;
import st.gravel.support.compiler.jvm.JVMDynamicObjectType;

public class DynamicFieldWrite extends JVMInstruction implements Cloneable {

	public static DynamicFieldWrite_Factory factory = new DynamicFieldWrite_Factory();

	String _name;

	JVMType _type;

	public static class DynamicFieldWrite_Factory extends JVMInstruction_Factory {

		public DynamicFieldWrite basicNew() {
			DynamicFieldWrite newInstance = new DynamicFieldWrite();
			newInstance.initialize();
			return newInstance;
		}

		public DynamicFieldWrite name_type_(final String _aString, final JVMType _aJVMDynamicObjectType) {
			return this.basicNew().initializeName_type_(_aString, _aJVMDynamicObjectType);
		}
	}

	static public DynamicFieldWrite _name_type_(Object receiver, final String _aString, final JVMType _aJVMDynamicObjectType) {
		return factory.name_type_(_aString, _aJVMDynamicObjectType);
	}

	@Override
	public <X> X accept_(final JVMInstructionVisitor<X> _visitor) {
		return _visitor.visitDynamicFieldWrite_(this);
	}

	public DynamicFieldWrite copy() {
		try {
			DynamicFieldWrite _temp1 = (DynamicFieldWrite) this.clone();
			_temp1.postCopy();
			return _temp1;
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public JVMInstruction effectStack_(final JVMStack _aJVMStack) {
		_aJVMStack.popType_(this.type());
		_aJVMStack.pop();
		return this;
	}

	public DynamicFieldWrite_Factory factory() {
		return factory;
	}

	public DynamicFieldWrite initializeName_type_(final String _aString, final JVMType _aJVMDynamicObjectType) {
		_name = _aString;
		_type = _aJVMDynamicObjectType;
		this.initialize();
		return this;
	}

	public JVMMethodType methodType() {
		return JVMMethodType.factory.returnType_arguments_(JVMVoidType.factory.basicNew(), st.gravel.support.jvm.ArrayFactory.with_with_(JVMDynamicObjectType.factory.basicNew(), _type));
	}

	public String name() {
		return _name;
	}

	@Override
	public DynamicFieldWrite printOn_(final StringBuilder _aStream) {
		final String _title;
		_title = this.factory().toString();
		_aStream.append(st.gravel.support.jvm.CharacterExtensions.isVowel(_title.charAt(0)) ? "an " : "a ");
		_aStream.append(_title);
		_aStream.append('[');
		this.sourceOn_(_aStream);
		_aStream.append(']');
		return this;
	}

	@Override
	public DynamicFieldWrite sourceOn_(final StringBuilder _aStream) {
		return this;
	}

	@Override
	public JVMType type() {
		return _type;
	}

	@Override
	public DynamicFieldWrite withReturnType_(final JVMType _aType) {
		if (st.gravel.support.jvm.ObjectExtensions.equals_(this.type(), _aType)) {
			return DynamicFieldWrite.this;
		}
		throw new RuntimeException("niy");
	}
}
