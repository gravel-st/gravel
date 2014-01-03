(reader defineTrait: 'Addable' superclass: nil)
!
(reader addMethod: 'As yet unclassified')
!
add: anElement
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
addAll: aCollection
	aCollection do: [:each | self add: each].
	^aCollection
!
(reader addClassMethod: 'private-instance creation')
!
newWithCapacity: size
	^self new: size
!
(reader addClassMethod: 'instance creation')
!
with: anObject
	| newCollection |
	newCollection := self newWithCapacity: 1.
	newCollection add: anObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject
	| newCollection |
	newCollection := self newWithCapacity: 2.
	newCollection add: firstObject.
	newCollection add: secondObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject
	| newCollection |
	newCollection := self newWithCapacity: 3.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject
	| newCollection |
	newCollection := self newWithCapacity: 4.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject
	| newCollection |
	newCollection := self newWithCapacity: 5.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	newCollection add: fifthObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject
	| newCollection |
	newCollection := self newWithCapacity: 6.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	newCollection add: fifthObject.
	newCollection add: sixthObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject with: seventhObject
	| newCollection |
	newCollection := self newWithCapacity: 7.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	newCollection add: fifthObject.
	newCollection add: sixthObject.
	newCollection add: seventhObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject with: seventhObject with: eighthObject
	| newCollection |
	newCollection := self newWithCapacity: 8.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	newCollection add: fifthObject.
	newCollection add: sixthObject.
	newCollection add: seventhObject.
	newCollection add: eighthObject.
	^newCollection
!
(reader addClassMethod: 'instance creation')
!
withAll: aCollection
	| newCollection |
	newCollection := self newWithCapacity: aCollection size.
	newCollection addAll: aCollection.
	^newCollection
!
