(reader defineClass: 'BlockClosure3' superclass: 'org.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.Block3')
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
