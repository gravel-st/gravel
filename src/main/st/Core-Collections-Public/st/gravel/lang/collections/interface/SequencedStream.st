(reader defineTrait: 'SequencedStream' superclass: nil)
!
(reader addMethod: 'open/close')
!
close
	
!
(reader addMethod: 'testing')
!
isEmpty
	^self traitRequirement
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
	^self traitRequirement
!
(reader addMethod: 'positioning')
!
setToEnd
	^self traitRequirement
!
