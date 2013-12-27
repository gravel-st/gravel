(reader defineClass: 'Delay' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'durationNS')
!
(reader addMethod: 'initialize-release')
!
initializeDuration: aDuration
	durationNS := aDuration asNanoSeconds
!
(reader addMethod: '')
!
pvtWaitForNanoseconds: durationNanoSeconds
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'waitForNanoseconds')>
	
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
	^self duration: ms milliseconds
!
