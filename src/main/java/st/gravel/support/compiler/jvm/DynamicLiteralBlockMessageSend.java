package st.gravel.support.compiler.jvm;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import java.math.BigInteger;
import st.gravel.support.jvm.NonLocalReturn;
import st.gravel.support.compiler.jvm.DynamicSend;
import st.gravel.support.compiler.jvm.DynamicSend.DynamicSend_Factory;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;
import st.gravel.support.compiler.jvm.JVMInstructionVisitor;
import st.gravel.support.compiler.jvm.JVMStack;
import st.gravel.support.compiler.jvm.JVMInstruction;
import st.gravel.support.compiler.jvm.JVMType;

public class DynamicLiteralBlockMessageSend extends DynamicSend implements Cloneable {

	public static DynamicLiteralBlockMessageSend_Factory factory = new DynamicLiteralBlockMessageSend_Factory();

	String[] _blockSendConstants;

	JVMDefinedObjectType _constantOwner;

	public static class DynamicLiteralBlockMessageSend_Factory extends DynamicSend_Factory {

		public DynamicLiteralBlockMessageSend basicNew() {
			DynamicLiteralBlockMessageSend newInstance = new DynamicLiteralBlockMessageSend();
			newInstance.initialize();
			return newInstance;
		}

		public DynamicLiteralBlockMessageSend functionName_numArgs_blockSendConstants_constantOwner_(final String _aString, final int _anInteger, final String[] _anArray, final JVMDefinedObjectType _aJVMDefinedObjectType) {
			return this.basicNew().initializeFunctionName_numArgs_blockSendConstants_constantOwner_(_aString, _anInteger, _anArray, _aJVMDefinedObjectType);
		}
	}

	static public DynamicLiteralBlockMessageSend _functionName_numArgs_blockSendConstants_constantOwner_(Object receiver, final String _aString, final int _anInteger, final String[] _anArray, final JVMDefinedObjectType _aJVMDefinedObjectType) {
		return factory.functionName_numArgs_blockSendConstants_constantOwner_(_aString, _anInteger, _anArray, _aJVMDefinedObjectType);
	}

	@Override
	public <X> X accept_(final JVMInstructionVisitor<X> _visitor) {
		return _visitor.visitDynamicLiteralBlockMessageSend_(this);
	}

	public String[] blockSendConstants() {
		return _blockSendConstants;
	}

	public JVMDefinedObjectType constantOwner() {
		return _constantOwner;
	}

	public DynamicLiteralBlockMessageSend copy() {
		try {
			DynamicLiteralBlockMessageSend _temp1 = (DynamicLiteralBlockMessageSend) this.clone();
			_temp1.postCopy();
			return _temp1;
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public JVMInstruction effectStack_(final JVMStack _aJVMStack) {
		final JVMType _aReceiverType;
		final JVMType[] _anArray;
		_anArray = st.gravel.support.jvm.ArrayExtensions.reverse(new st.gravel.core.Interval(1, _numArgs).collect_(new st.gravel.support.jvm.Block1<JVMType, Integer>() {

			@Override
			public JVMType value_(final Integer _i) {
				return (JVMType) _aJVMStack.pop();
			}
		}));
		_aReceiverType = _aJVMStack.pop();
		st.gravel.support.jvm.ObjectExtensions.assert_(this, _aReceiverType.isObjectType());
		_aJVMStack.push_(this.type());
		return this.withReceiverType_argumentTypes_(_aReceiverType, _anArray);
	}

	public DynamicLiteralBlockMessageSend_Factory factory() {
		return factory;
	}

	public DynamicLiteralBlockMessageSend initializeFunctionName_numArgs_blockSendConstants_constantOwner_(final String _aString, final int _anInteger, final String[] _anArray, final JVMDefinedObjectType _aJVMDefinedObjectType) {
		_functionName = _aString;
		_numArgs = _anInteger;
		_blockSendConstants = _anArray;
		_constantOwner = _aJVMDefinedObjectType;
		this.initialize();
		return this;
	}

	@Override
	public DynamicLiteralBlockMessageSend printOn_(final StringBuilder _aStream) {
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
	public DynamicLiteralBlockMessageSend pvtSetArgumentTypes_(final JVMType[] _anArray) {
		_argumentTypes = _anArray;
		return this;
	}

	@Override
	public DynamicLiteralBlockMessageSend pvtSetReceiverType_(final JVMType _aJVMObjectType) {
		_receiverType = _aJVMObjectType;
		return this;
	}

	@Override
	public DynamicLiteralBlockMessageSend sourceOn_(final StringBuilder _aStream) {
		_aStream.append(_functionName);
		return this;
	}

	@Override
	public DynamicLiteralBlockMessageSend withReceiverType_argumentTypes_(final JVMType _aJVMObjectType, final JVMType[] _anArray) {
		DynamicLiteralBlockMessageSend _temp1 = this.copy();
		_temp1.pvtSetReceiverType_(_aJVMObjectType);
		return _temp1.pvtSetArgumentTypes_(_anArray);
	}

	@Override
	public DynamicLiteralBlockMessageSend withReturnType_(final JVMType _aType) {
		if (st.gravel.support.jvm.ObjectExtensions.equals_(this.type(), _aType)) {
			return DynamicLiteralBlockMessageSend.this;
		}
		throw new RuntimeException("niy");
	}
}
