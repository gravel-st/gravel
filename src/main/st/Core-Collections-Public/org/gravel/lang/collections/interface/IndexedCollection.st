(reader defineTrait: 'IndexedCollection' superclass: nil)
!
(reader addMethod: 'As yet unclassified')
!
at: index
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
at: index ifAbsent: aBlock
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
nextIndexOf: anElement from: startIndex to: stopIndex
	startIndex to: stopIndex do: [:i | (self at: i) = anElement ifTrue: [^i]].
	^nil
!
