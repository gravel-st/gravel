(reader defineClass: 'Process' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Thread')
!
(reader addMethod: '')
!
isAlive
	<primitive: 'isAlive'>
	
!
(reader addMethod: 'As yet unclassified')
!
isTerminated
	^self isAlive not
!
(reader addMethod: '')
!
resume
	<primitive: 'start'>
	
!
(reader addClassMethod: '')
!
forBlock: aBlock
	<primitive: #('st.gravel.support.jvm.ProcessExtensions' 'forBlock_')>
	
!
