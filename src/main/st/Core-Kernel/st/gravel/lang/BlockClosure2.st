(reader defineClass: 'BlockClosure2' superclass: 'st.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.Block2')
!
(reader addMethod: 'gravel')
!
numArgs
	^2
!
(reader addMethod: 'gravel')
!
value: arg1 value: arg2
	^self subclassResponsibility
!
(reader addMethod: 'evaluating')
!
valueWithArguments: args
	args size = 1 ifFalse: [^self raiseInvalidArgumentCount].
	^self value: args first value: args second
!
