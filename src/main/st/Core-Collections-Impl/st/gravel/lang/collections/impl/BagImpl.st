(reader defineClass: 'BagImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Bag')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Bag class')
!
(reader addInstVar: 'contents')
!
(reader addMethod: 'comparing')
!
= aBag
	aBag isBag ifFalse: [^false].
	self size = aBag size ifFalse: [^false].
	contents
		associationsDo: [:assoc | (aBag occurrencesOf: assoc key) = assoc value ifFalse: [^false]].
	^true
!
(reader addMethod: 'adding')
!
add: newObject
	^self add: newObject withOccurrences: 1
!
(reader addMethod: 'adding')
!
add: newObject withOccurrences: anInteger
	contents at: newObject put: (contents at: newObject ifAbsent: [0]) + anInteger.
	^newObject
!
(reader addMethod: 'converting')
!
asBag
	^self
!
(reader addMethod: 'converting')
!
asSet
	^contents keys asSet
!
(reader addMethod: 'iterating')
!
do: aBlock
	contents
		keysAndValuesDo: [:element :occurrences | 1 to: occurrences do: [:i | aBlock value: element]]
!
(reader addMethod: 'testing')
!
includes: anObject
	^contents includesKey: anObject
!
(reader addMethod: 'testing')
!
occurrencesOf: anObject
	^contents at: anObject ifAbsent: [0]
!
(reader addMethod: 'copying')
!
postCopy
	super postCopy.
	contents := contents copy
!
(reader addMethod: 'removing')
!
remove: oldObject ifAbsent: exceptionBlock
	| count |
	count := contents at: oldObject ifAbsent: [^exceptionBlock value].
	count = 1
		ifTrue: [contents removeKey: oldObject]
		ifFalse: [contents at: oldObject put: count - 1].
	^oldObject
!
(reader addMethod: 'removing')
!
removeAll
	contents removeAll
!
(reader addMethod: 'private')
!
setContents: aDictionary
	contents := aDictionary
!
(reader addMethod: 'accessing')
!
size
	| tally |
	tally := 0.
	contents do: [:each | tally := tally + each].
	^tally
!
(reader addMethod: 'accessing')
!
sortedElements
	^(contents associations)
		sort;
		yourself
!
(reader addClassMethod: 'private')
!
contentsClass
	^Dictionary
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
(reader addClassMethod: 'instance creation')
!
newImpl
	^self newImpl: 4
!
(reader addClassMethod: 'instance creation')
!
newImpl: nElements
	^super new setContents: (self contentsClass new: nElements)
!
