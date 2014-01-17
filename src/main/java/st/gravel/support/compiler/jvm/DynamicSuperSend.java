package st.gravel.support.compiler.jvm;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import java.math.BigInteger;
import st.gravel.support.jvm.NonLocalReturn;
import st.gravel.support.compiler.jvm.DynamicSend;
import st.gravel.support.compiler.jvm.DynamicSend.DynamicSend_Factory;
import st.gravel.support.compiler.jvm.JVMInstructionVisitor;
import st.gravel.support.compiler.jvm.JVMMethodType;
import st.gravel.support.compiler.jvm.JVMType;

public class DynamicSuperSend extends DynamicSend implements Cloneable {

	public static DynamicSuperSend_Factory factory = new DynamicSuperSend_Factory();

	String _superReference;

	public static class DynamicSuperSend_Factory extends DynamicSend_Factory {

		public DynamicSuperSend basicNew() {
			DynamicSuperSend newInstance = new DynamicSuperSend();
			newInstance.initialize();
			return newInstance;
		}

		public DynamicSuperSend functionName_numArgs_superReference_(final String _aString, final int _anInteger, final String _aString2) {
			return this.basicNew().initializeFunctionName_numArgs_superReference_(_aString, _anInteger, _aString2);
		}
	}

	static public DynamicSuperSend _functionName_numArgs_superReference_(Object receiver, final String _aString, final int _anInteger, final String _aString2) {
		return factory.functionName_numArgs_superReference_(_aString, _anInteger, _aString2);
	}

	@Override
	public <X> X accept_(final JVMInstructionVisitor<X> _visitor) {
		return _visitor.visitDynamicSuperSend_(this);
	}

	public DynamicSuperSend copy() {
		try {
			DynamicSuperSend _temp1 = (DynamicSuperSend) this.clone();
			_temp1.postCopy();
			return _temp1;
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
	}

	public DynamicSuperSend_Factory factory() {
		return factory;
	}

	public DynamicSuperSend initializeFunctionName_numArgs_superReference_(final String _aString, final int _anInteger, final String _aString2) {
		_functionName = _aString;
		_numArgs = _anInteger;
		_superReference = _aString2;
		this.initialize();
		return this;
	}

	@Override
	public DynamicSuperSend printOn_(final StringBuilder _aStream) {
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
	public DynamicSuperSend pvtSetArgumentTypes_(final JVMType[] _anArray) {
		_argumentTypes = _anArray;
		return this;
	}

	@Override
	public DynamicSuperSend pvtSetReceiverType_(final JVMType _aJVMObjectType) {
		_receiverType = _aJVMObjectType;
		return this;
	}

	@Override
	public JVMMethodType signature() {
		return JVMMethodType.factory.dynamic_((_numArgs + 1));
	}

	@Override
	public DynamicSuperSend sourceOn_(final StringBuilder _aStream) {
		_aStream.append(_functionName);
		return this;
	}

	public String superReference() {
		return _superReference;
	}

	@Override
	public DynamicSuperSend withReceiverType_argumentTypes_(final JVMType _aJVMObjectType, final JVMType[] _anArray) {
		DynamicSuperSend _temp1 = this.copy();
		_temp1.pvtSetReceiverType_(_aJVMObjectType);
		return _temp1.pvtSetArgumentTypes_(_anArray);
	}

	@Override
	public DynamicSuperSend withReturnType_(final JVMType _aType) {
		if (st.gravel.support.jvm.ObjectExtensions.equals_(this.type(), _aType)) {
			return DynamicSuperSend.this;
		}
		throw new RuntimeException("niy");
	}
}
