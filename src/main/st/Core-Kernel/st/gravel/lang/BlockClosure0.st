(reader defineClass: 'BlockClosure0' superclass: 'st.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.Block0')
!
(reader addMethod: 'gravel')
!
cull: anObject
	^self value
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject
	^self value
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject
	^self value
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject
	^self value
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject cull: eObject
	^self value
!
(reader addMethod: 'gravel')
!
cull: anObject cull: bObject cull: cObject cull: dObject cull: eObject cull: fObject
	^self value
!
(reader addMethod: 'gravel')
!
cullWithArguments: args
	^self value
!
(reader addMethod: '')
!
ensure: handlerBlock
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'ensure_')>
	
!
(reader addMethod: '')
!
ifCurtailed: handlerBlock
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'ifCurtailed_')>
	
!
(reader addMethod: 'testing')
!
isMonadicBlock
	^true
!
(reader addMethod: 'testing')
!
isMonadicValuable
	^true
!
(reader addMethod: 'gravel')
!
numArgs
	^0
!
(reader addMethod: '')
!
on: anExceptionSelector do: handlerBlock
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'on_do_')>
	
!
(reader addMethod: 'gravel')
!
value
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
valueWithArguments: args
	args size = 0 ifFalse: [^self raiseInvalidArgumentCount].
	^self value
!
