(reader defineClass: 'BlockClosure1' superclass: 'st.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.Block1')
!
(reader addMethod: 'gravel')
!
cull: anObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject cull: eObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject cull: eObject cull: fObject
	^self value: anObject
!
(reader addMethod: 'gravel')
!
cullWithArguments: args
	^self value: args first
!
(reader addMethod: 'gravel')
!
numArgs
	^1
!
(reader addMethod: 'gravel')
!
value: anArgument
	^self subclassResponsibility
!
(reader addMethod: 'evaluating')
!
valueWithArguments: args
	args size = 1 ifFalse: [^self raiseInvalidArgumentCount].
	^self value: args first
!
