(reader defineClass: 'BlockClosure0' superclass: 'org.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.Block0')
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
(reader addMethod: 'gravel')
!
ensure: handlerBlock
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'ensure_')>
	
!
(reader addMethod: 'gravel')
!
ifCurtailed: handlerBlock
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'ifCurtailed_')>
	
!
(reader addMethod: 'gravel')
!
numArgs
	^0
!
(reader addMethod: 'gravel')
!
on: anExceptionSelector do: handlerBlock
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'on_do_')>
	
!
(reader addMethod: 'gravel')
!
value
	^self subclassResponsibility
!
