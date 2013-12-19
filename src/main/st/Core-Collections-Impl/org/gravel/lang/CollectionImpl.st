(reader defineClass: 'CollectionImpl' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.Collection')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.Collection class')
!
(reader addMethod: 'gravel')
!
, aCollection
	^self copyWithAll: aCollection
!
(reader addMethod: 'gravel')
!
add: anObject
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
addAll: aCollection
	aCollection do: [:each | self add: each].
	^aCollection
!
(reader addMethod: 'gravel')
!
anElement
	self do: [:elem | ^elem].
	^self subscriptBoundsErrorFor: #anElement index: 1
!
(reader addMethod: 'gravel')
!
anElementOrNil
	self isEmpty ifTrue: [^nil].
	^self anElement
!
(reader addMethod: 'gravel')
!
anySatisfy: aBlock
	self do: [:each | (aBlock value: each) ifTrue: [^true]].
	^false
!
(reader addMethod: 'gravel')
!
asSortedCollection
	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	aSortedCollection addAll: self.
	^aSortedCollection
!
(reader addMethod: 'gravel')
!
asSortedCollection: aBlock
	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	aSortedCollection sortBlock: aBlock.
	aSortedCollection addAll: self.
	^aSortedCollection
!
(reader addMethod: 'gravel')
!
do: aBlock
	<primitive: #('org.gravel.support.jvm.CollectionExtensions' 'do_')>
	
!
(reader addMethod: 'gravel')
!
isCollection
	^true
!
(reader addMethod: 'gravel')
!
isEmpty
	^self size = 0
!
(reader addMethod: 'gravel')
!
isNilOrEmpty
	^self isEmpty
!
(reader addMethod: 'gravel')
!
maxPrint
	^5000
!
(reader addMethod: 'gravel')
!
nextIndexOf: anElement from: startIndex to: stopIndex
	startIndex to: stopIndex do: [:i | (self at: i) = anElement ifTrue: [^i]].
	^nil
!
(reader addMethod: 'gravel')
!
size
	| tally |
	tally := 0.
	self do: [:each | tally := tally + 1].
	^tally
!
(reader addMethod: 'gravel')
!
species
	^self class
!
(reader addClassMethod: 'gravel')
!
with: anObject
	| newCollection |
	newCollection := self new.
	newCollection add: anObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: anObject1 with: anObject2
	| newCollection |
	newCollection := self new.
	newCollection add: anObject1.
	newCollection add: anObject2.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
withAll: aCollection
	| newCollection |
	newCollection := self new.
	newCollection addAll: aCollection.
	^newCollection
!
