(reader defineClass: 'DictionaryImpl' superclass: 'st.gravel.lang.collections.impl.HashedCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Dictionary')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Dictionary class')
!
(reader addMethod: 'comparing')
!
= aDictionary
	self == aDictionary ifTrue: [^true].
	(aDictionary isKindOf: Dictionary) ifFalse: [^false].
	self size = aDictionary size ifFalse: [^false].
	self associationsDo: 
			[:assoc |
			(aDictionary at: assoc key ifAbsent: [^false]) = assoc value ifFalse: [^false]].
	^true
!
(reader addMethod: 'adding')
!
add: anAssociation
	| index |
	index := self scanFor: anAssociation key.
	(array at: index)
		ifNil: [self atNewIndex: index put: anAssociation]
		ifNotNil: [:element | element value: anAssociation value].
	^anAssociation
!
(reader addMethod: 'accessing')
!
associationAt: key ifAbsent: aBlock
	^(array at: (self scanFor: key)) ifNil: [aBlock value]
!
(reader addMethod: 'accessing')
!
associations
	| aCollection i |
	aCollection := Array new: self size.
	i := 0.
	self associationsDo: [:assn | aCollection at: (i := i + 1) put: assn].
	^aCollection
!
(reader addMethod: 'enumerating')
!
associationsDo: aBlock
	<squeak>
	tally = 0 ifTrue: [^self].
	1 to: array size
		do: [:index | (array at: index) ifNotNil: [:element | aBlock value: element]]
!
(reader addMethod: 'enumerating')
!
associationsSelect: aBlock
 <squeak>| newCollection |
	newCollection := (self copyEmpty).
	self associationsDo: [:each | (aBlock value: each) ifTrue: [ newCollection add: each]].
	^newCollection
!
(reader addMethod: 'accessing')
!
at: key
	^self at: key ifAbsent: [self errorKeyNotFound: key]
!
(reader addMethod: 'accessing')
!
at: key ifAbsent: aBlock
	^((array at: (self scanFor: key)) ifNil: [aBlock]) value
!
(reader addMethod: 'accessing')
!
at: key ifPresent: aBlock
	| v |
	v := self at: key ifAbsent: [^nil].
	^aBlock value: v
!
(reader addMethod: 'accessing')
!
at: key ifPresent: oneArgBlock ifAbsent: absentBlock
	self at: key ifPresent: [:v | ^oneArgBlock value: v].
	^absentBlock value
!
(reader addMethod: 'accessing')
!
at: key put: anObject
	| index |
	index := self scanFor: key.
	(array at: index)
		ifNil: [self atNewIndex: index put: (Association key: key value: anObject)]
		ifNotNil: [:association | association value: anObject].
	^anObject
!
(reader addMethod: 'enumerating')
!
collect: aBlock
 <squeak>| newCollection |
	newCollection := ((self species) new: (self size)).
	self associationsDo: [:each | newCollection at: (each key) put: (aBlock value: (each value))].
	^newCollection
!
(reader addMethod: 'enumerating')
!
do: aBlock
	self valuesDo: aBlock
!
(reader addMethod: 'private')
!
errorValueNotFound
	<squeak>
	self error: 'value not found'
!
(reader addMethod: 'private')
!
fixCollisionsFrom: start
 <squeak>| element index |
	index := start.
	[ (element := (array at: (index := ((index \\ (array size)) + 1)))) == nil] whileFalse: [| newIndex |
 ((newIndex := (self scanFor: (element key))) = index) ifFalse: [ array at: newIndex put: element;  at: index put: nil]]
!
(reader addMethod: 'testing')
!
includesAssociation: anAssociation
	<squeak>
	^(self associationAt: anAssociation key ifAbsent: [^false]) value = anAssociation value
!
(reader addMethod: 'testing')
!
includesKey: key
	<squeak>
	^(array at: (self scanFor: key)) ~~ nil
!
(reader addMethod: 'accessing')
!
keyAtIdentityValue: value ifAbsent: exceptionBlock
	self
		associationsDo: [:association | value == association value ifTrue: [^association key]].
	^exceptionBlock value
!
(reader addMethod: 'accessing')
!
keyAtValue: value
	^self keyAtValue: value ifAbsent: [self errorValueNotFound]
!
(reader addMethod: 'accessing')
!
keyAtValue: value ifAbsent: exceptionBlock
	self
		associationsDo: [:association | value = association value ifTrue: [^association key]].
	^exceptionBlock value
!
(reader addMethod: 'accessing')
!
keys
	| aCollection i |
	aCollection := Array new: self size.
	i := 0.
	self keysDo: [:key | aCollection at: (i := i + 1) put: key].
	^aCollection
!
(reader addMethod: 'enumerating')
!
keysAndValuesDo: aBlock
	self
		associationsDo: [:association | aBlock value: association key value: association value]
!
(reader addMethod: 'enumerating')
!
keysDo: aBlock
	<squeak>
	self associationsDo: [:association | aBlock value: association key]
!
(reader addMethod: 'private')
!
noCheckNoGrowFillFrom: anArray
	1 to: anArray size
		do: 
			[:index |
			(anArray at: index)
				ifNotNil: [:association | array at: (self scanForEmptySlotFor: association key) put: association]]
!
(reader addMethod: 'copying')
!
postCopy
	<squeak>
	super postCopy.
	array := array collect: [:association | association ifNotNil: [association copy]]
!
(reader addMethod: 'removing')
!
removeKey: key ifAbsent: aBlock
 <squeak>| index association |
	index := (self scanFor: key).
	association := ((array at: index) ifNil: [ ^(aBlock value)]).
	array at: index put: nil.
	tally := (tally - 1).
	self fixCollisionsFrom: index.
	^(association value)
!
(reader addMethod: 'private')
!
scanFor: anObject
 <squeak>| index start |
	index := (start := (((anObject hash) \\ (array size)) + 1)).
	[| element |
 (((element := (array at: index)) == nil) or: [ anObject = (element key)]) ifTrue: [ ^index].
 (index := ((index \\ (array size)) + 1)) = start] whileFalse.
	self errorNoFreeSpace
!
(reader addMethod: 'enumerating')
!
select: aBlock
 <squeak>| newCollection |
	newCollection := (self copyEmpty).
	self associationsDo: [:each | (aBlock value: (each value)) ifTrue: [ newCollection add: (each copy)]].
	^newCollection
!
(reader addMethod: 'accessing')
!
size
	^tally
!
(reader addMethod: 'accessing')
!
values
	| aCollection i |
	aCollection := Array new: self size.
	i := 0.
	self valuesDo: [:elem | aCollection at: (i := i + 1) put: elem].
	^aCollection
!
(reader addMethod: 'enumerating')
!
valuesDo: aBlock
	<squeak>
	self associationsDo: [:association | aBlock value: association value]
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
(reader addClassMethod: 'instance creation')
!
newFrom: aDict
 <squeak>| newDictionary |
	newDictionary := (self new: (aDict size)).
	aDict associationsDo: [:x | (newDictionary includesKey: (x key)) ifTrue: [ self error: ('Duplicate key: ' , ((x key) printString))] ifFalse: [ newDictionary add: (x copy)]].
	^newDictionary
!
(reader addClassMethod: 'instance creation')
!
newFromPairs: anArray
 <squeak>| newDictionary |
	newDictionary := (self new: ((anArray size) / 2)).
	1 to: ((anArray size) - 1) by: 2 do: [:i | newDictionary at: (anArray at: i) put: (anArray at: (i + 1))].
	^newDictionary
!
