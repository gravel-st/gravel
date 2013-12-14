(reader defineClass: 'BlockClosure2' superclass: 'org.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.Block2')
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
