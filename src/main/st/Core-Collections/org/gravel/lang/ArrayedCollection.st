(reader defineClass: 'ArrayedCollection' superclass: 'org.gravel.lang.SequenceableCollectionImpl')
!
(reader addClassMethod: 'gravel')
!
new: size withAll: value
	^(self new: size) atAllPut: value
!
(reader addClassMethod: 'gravel')
!
with: anObject
	| newCollection |
	newCollection := self new: 1.
	newCollection at: 1 put: anObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject
	| newCollection |
	newCollection := self new: 2.
	newCollection at: 1 put: firstObject.
	newCollection at: 2 put: secondObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject
	| newCollection |
	newCollection := self new: 3.
	newCollection at: 1 put: firstObject.
	newCollection at: 2 put: secondObject.
	newCollection at: 3 put: thirdObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject
	| newCollection |
	newCollection := self new: 4.
	newCollection at: 1 put: firstObject.
	newCollection at: 2 put: secondObject.
	newCollection at: 3 put: thirdObject.
	newCollection at: 4 put: fourthObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject
	| newCollection |
	newCollection := self new: 5.
	newCollection at: 1 put: firstObject.
	newCollection at: 2 put: secondObject.
	newCollection at: 3 put: thirdObject.
	newCollection at: 4 put: fourthObject.
	newCollection at: 5 put: fifthObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject
	^(self new: 6)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		at: 4 put: fourthObject;
		at: 5 put: fifthObject;
		at: 6 put: sixthObject;
		yourself
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject with: seventhObject
	^(self new: 7)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		at: 4 put: fourthObject;
		at: 5 put: fifthObject;
		at: 6 put: sixthObject;
		at: 7 put: seventhObject;
		yourself
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject with: seventhObject with: eightObject
	^(self new: 8)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		at: 4 put: fourthObject;
		at: 5 put: fifthObject;
		at: 6 put: sixthObject;
		at: 7 put: seventhObject;
		at: 8 put: eightObject;
		yourself
!
(reader addClassMethod: 'gravel')
!
with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject with: seventhObject with: eightObject with: ninthObject
	^(self new: 9)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		at: 4 put: fourthObject;
		at: 5 put: fifthObject;
		at: 6 put: sixthObject;
		at: 7 put: seventhObject;
		at: 8 put: eightObject;
		at: 9 put: ninthObject;
		yourself
!
(reader addClassMethod: 'gravel')
!
withAll: aCollection
	| newCollection index |
	newCollection := self new: aCollection size.
	index := 0.
	aCollection do: [:element | newCollection at: (index := index + 1) put: element].
	^newCollection
!
