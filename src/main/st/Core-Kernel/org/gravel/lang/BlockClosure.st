(reader defineClass: 'BlockClosure' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.AbstractBlock')
!
(reader addMethod: 'gravel')
!
numArgs
	^self subclassResponsibility
!
