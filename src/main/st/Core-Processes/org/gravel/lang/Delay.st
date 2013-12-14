(reader defineClass: 'Delay' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'durationNS')
!
(reader addMethod: 'initialize-release')
!
initializeDuration: aDuration
	durationNS := aDuration asNanoSeconds
!
(reader addMethod: 'initialize-release')
!
pvtWaitForNanoseconds: durationNanoSeconds
	<primitive: #('org.gravel.support.jvm.TimeExtensions' 'waitForNanoseconds')>
	
!
(reader addMethod: 'initialize-release')
!
wait
	self pvtWaitForNanoseconds: durationNS
!
(reader addClassMethod: 'As yet unclassified')
!
duration: aDuration
	^self new initializeDuration: aDuration
!
(reader addClassMethod: 'As yet unclassified')
!
forMilliseconds: ms
	^self duration: ms milliSeconds
!
