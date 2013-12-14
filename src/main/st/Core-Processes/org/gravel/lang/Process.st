(reader defineClass: 'Process' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Thread')
!
(reader addMethod: 'As yet unclassified')
!
isAlive
	<primitive: 'isAlive'>
	
!
(reader addMethod: 'As yet unclassified')
!
isTerminated
	^self isAlive not
!
(reader addMethod: 'As yet unclassified')
!
resume
	<primitive: 'start'>
	
!
(reader addClassMethod: 'As yet unclassified')
!
forBlock: aBlock
	<primitive: #('org.gravel.support.jvm.ProcessExtensions' 'forBlock_')>
	
!
