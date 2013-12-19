(reader defineClass: 'Semaphore' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.util.concurrent.Semaphore')
!
(reader addMethod: '')
!
signal
	<primitive: 'release'>
	
!
(reader addMethod: '')
!
wait
	<primitive: 'acquire'>
	
!
(reader addClassMethod: 'gravel')
!
forMutualExclusion
	^self new signal
!
(reader addClassMethod: '')
!
new
	<primitive: #('st.gravel.support.jvm.SemaphoreExtensions' 'newInstance')>
	
!
