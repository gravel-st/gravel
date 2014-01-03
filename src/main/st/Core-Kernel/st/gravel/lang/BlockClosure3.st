(reader defineClass: 'BlockClosure3' superclass: 'st.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.Block3')
!
(reader addMethod: 'gravel')
!
numArgs
	^3
!
(reader addMethod: 'gravel')
!
value: arg1 value: arg2 value: arg3
	^self subclassResponsibility
!
(reader addMethod: 'evaluating')
!
valueWithArguments: args
	args size = 1 ifFalse: [^self raiseInvalidArgumentCount].
	^self
		value: args first
		value: args second
		value: args third
!
