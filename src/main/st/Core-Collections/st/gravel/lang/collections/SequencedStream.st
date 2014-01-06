(reader defineTrait: 'SequencedStream' superclass: nil)
!
(reader addMethod: 'testing')
!
atEnd
	^self traitRequirement
!
(reader addMethod: 'open/close')
!
close
	
!
(reader addMethod: 'accessing')
!
contents
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
contentsSpecies
	^Array
!
(reader addMethod: 'testing')
!
isEmpty
	^self atEnd
!
(reader addMethod: 'accessing')
!
position
	^self traitRequirement
!
(reader addMethod: 'positioning')
!
position: aPosition
	^self traitRequirement
!
(reader addMethod: 'positioning')
!
reset
	self position: 0
!
(reader addMethod: 'positioning')
!
setToEnd
	^self traitRequirement
!
