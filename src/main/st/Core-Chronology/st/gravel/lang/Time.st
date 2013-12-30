(reader defineClass: 'Time' superclass: 'st.gravel.lang.Temporal')
!
(reader addClassMethod: 'clock')
!
currentTimeMillis
	<primitive: #('java.lang.System' 'currentTimeMillis')>
	
!
(reader addClassMethod: 'clock')
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
	^self currentTimeMillis
!
(reader addClassMethod: 'gravel')
!
millisecondsToRun: aBlock
	^((self microsecondsToRun: aBlock) + 500) // 1000
!
(reader addClassMethod: 'clock')
!
nanosecondClock
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'nanosecondClock')>
	
!
(reader addClassMethod: 'clock')
!
nanoTime
	<primitive: #('java.lang.System' 'nanoTime')>
	
!
