(reader defineClass: 'Interval' superclass: 'org.gravel.lang.CollectionImpl')
!
(reader addInstVar: 'start')
!
(reader addInstVar: 'stop')
!
(reader addInstVar: 'step')
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
	^OrderedCollection
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
from: anInteger to: anInteger2 by: anInteger3
	^self new initializeFrom: anInteger to: anInteger2 by: anInteger3
!
