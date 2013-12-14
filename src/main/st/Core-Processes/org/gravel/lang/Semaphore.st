(reader defineClass: 'Semaphore' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.util.concurrent.Semaphore')
!
(reader addMethod: 'As yet unclassified')
!
signal
	<primitive: 'release'>
	
!
(reader addMethod: 'As yet unclassified')
!
wait
	<primitive: 'acquire'>
	
!
(reader addClassMethod: 'gravel')
!
forMutualExclusion
	^self new signal
!
(reader addClassMethod: 'gravel')
!
new
	<primitive: #('org.gravel.support.jvm.SemaphoreExtensions' 'newInstance')>
	
!
