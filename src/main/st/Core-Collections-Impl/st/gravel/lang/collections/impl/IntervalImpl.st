(reader defineClass: 'IntervalImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Interval')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Interval class')
!
(reader addInstVar: 'start')
!
(reader addInstVar: 'stop')
!
(reader addInstVar: 'step')
!
(reader addMethod: 'accessing')
!
at: anInteger
	(anInteger >= 1 and: [anInteger <= self size])
		ifTrue: [^start + (step * (anInteger - 1))]
		ifFalse: [self errorSubscriptBounds: anInteger]
!
(reader addMethod: 'gravel')
!
collect: aBlock
	| result i |
	result := Array new: self size.
	i := 0.
	self do: [:v | result at: (i := i + 1) put: (aBlock value: v)].
	^result
!
(reader addMethod: 'gravel')
!
do: aBlock
	0 to: self size - 1 do: [:n | aBlock value: start + (step * n)]
!
(reader addMethod: 'gravel')
!
initializeFrom: aStart to: aStop by: aStep
	start := aStart.
	stop := aStop.
	step := aStep
!
(reader addMethod: 'gravel')
!
size
	^step < 0
		ifTrue: [start < stop ifTrue: [0] ifFalse: [(stop - start) // step + 1]]
		ifFalse: [stop < start ifTrue: [0] ifFalse: [(stop - start) // step + 1]]
!
(reader addMethod: 'gravel')
!
species
	^Array
!
(reader addMethod: 'gravel')
!
start
	^start
!
(reader addMethod: 'gravel')
!
step
	^step
!
(reader addMethod: 'gravel')
!
stop
	^stop
!
(reader addClassMethod: 'gravel')
!
from: start to: stop
	^self from: start to: stop by: 1
!
(reader addClassMethod: 'gravel')
!
from: start to: stop by: step
	^super new initializeFrom: start to: stop by: step
!
