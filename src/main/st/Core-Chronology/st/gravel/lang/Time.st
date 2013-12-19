(reader defineClass: 'Time' superclass: 'st.gravel.lang.Temporal')
!
(reader addClassMethod: 'gravel')
!
microsecondClock
	^self nanosecondClock // 1000
!
(reader addClassMethod: 'gravel')
!
microsecondsToRun: timedBlock
	| start |
	start := self microsecondClock.
	timedBlock value.
	^self microsecondClock - start
!
(reader addClassMethod: 'As yet unclassified')
!
millisecondClockValue
	^self microsecondClock // 1000
!
(reader addClassMethod: 'gravel')
!
millisecondsToRun: aBlock
	^((self microsecondsToRun: aBlock) + 500) // 1000
!
(reader addClassMethod: '')
!
nanosecondClock
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'nanosecondClock')>
	
!
