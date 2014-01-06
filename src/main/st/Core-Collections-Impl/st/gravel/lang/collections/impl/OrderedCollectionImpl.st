(reader defineClass: 'OrderedCollectionImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.OrderedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.OrderedCollection class')
!
(reader addInstVar: 'array')
!
(reader addInstVar: 'firstIndex')
!
(reader addInstVar: 'lastIndex')
!
(reader addMethod: 'adding')
!
add: newObject
	^self addLast: newObject
!
(reader addMethod: 'adding')
!
add: newObject after: oldObject
	| index |
	index := self find: oldObject.
	self insert: newObject before: index + 1.
	^newObject
!
(reader addMethod: 'adding')
!
add: newObject before: oldObject
	| index |
	index := self find: oldObject.
	self insert: newObject before: index.
	^newObject
!
(reader addMethod: 'adding')
!
add: anObject beforeIndex: spot
	spot < 1 ifTrue: [self errorOutOfBounds].
	^self insert: anObject before: (spot + firstIndex - 1 min: lastIndex + 1)
!
(reader addMethod: 'adding')
!
addAll: aCollection
	^self addAllLast: aCollection
!
(reader addMethod: 'adding')
!
addAllFirst: anOrderedCollection
	anOrderedCollection reverseDo: [:each | self addFirst: each].
	^anOrderedCollection
!
(reader addMethod: 'adding')
!
addAllLast: aCollection
	aCollection do: [:each | self addLast: each].
	^aCollection
!
(reader addMethod: 'adding')
!
addFirst: newObject
	firstIndex = 1 ifTrue: [self makeRoomAtFirst].
	firstIndex := firstIndex - 1.
	array basicAt: firstIndex put: newObject.
	^newObject
!
(reader addMethod: 'adding')
!
addLast: newObject
	lastIndex = array basicSize ifTrue: [self makeRoomAtLast].
	lastIndex := lastIndex + 1.
	array basicAt: lastIndex put: newObject.
	^newObject
!
(reader addMethod: 'accessing')
!
after: oldObject
	| index |
	index := self find: oldObject.
	index = lastIndex ifTrue: [^self lastObjectError] ifFalse: [^array basicAt: index + 1]
!
(reader addMethod: 'gravel')
!
asArray
	| anArray index |
	anArray := Array new: self size.
	index := 0.
	self do: [:each | anArray at: (index := index + 1) put: each].
	^anArray
!
(reader addMethod: 'initialize-release')
!
at: anInteger
	(anInteger < 1 or: [anInteger + firstIndex - 1 > lastIndex])
		ifTrue: [self errorNoSuchElement]
		ifFalse: [^array basicAt: anInteger + firstIndex - 1]
!
(reader addMethod: 'initialize-release')
!
at: anInteger put: anObject
	^array basicAt: anInteger + firstIndex - 1 put: anObject
!
(reader addMethod: 'accessing')
!
before: oldObject
	| index |
	index := self find: oldObject.
	index = firstIndex ifTrue: [^self firstObjectError] ifFalse: [^array basicAt: index - 1]
!
(reader addMethod: 'initialize-release')
!
capacity
	^array basicSize
!
(reader addMethod: 'initialize-release')
!
changeCapacityTo: newCapacity
	| newContents |
	newContents := Array new: newCapacity.
	firstIndex to: lastIndex
		do: [:index | newContents at: index - firstIndex + 1 put: (array basicAt: index)].
	array := newContents.
	lastIndex := lastIndex - firstIndex + 1.
	firstIndex := 1
!
(reader addMethod: 'adding')
!
changeSizeTo: newSize
	| newLast |
	newSize < 0
		ifTrue: 
			[self error: #errNeedPositiveIntegerArg << #dialogs
						>> 'This message needs a positive integer argument'].
	newSize <= (self capacity + 1 - firstIndex)
		ifTrue: 
			[newLast := firstIndex + newSize - 1.
			newLast + 1 to: lastIndex do: [:i | array basicAt: i put: nil].
			lastIndex := newLast.
			^self].
	newSize <= self capacity
		ifTrue: 
			[self makeRoomAtLast.
			lastIndex := newSize.
			^self].
	self changeCapacityTo: (self capacity + self growSize max: newSize).
	lastIndex := firstIndex + newSize - 1
!
(reader addMethod: 'enumerating')
!
collect: aBlock
	| newCollection |
	newCollection := self copyEmpty: self size.
	firstIndex to: lastIndex
		do: [:index | newCollection addLast: (aBlock value: (array basicAt: index))].
	^newCollection
!
(reader addMethod: 'private')
!
collector
	^array
!
(reader addMethod: 'copying')
!
copyEmpty
	^self species new
!
(reader addMethod: 'enumerating')
!
detect: aBlock ifNone: exceptionBlock
	firstIndex to: lastIndex
		do: 
			[:i |
			| each |
			each := array basicAt: i.
			(aBlock value: each) ifTrue: [^each]].
	^exceptionBlock value
!
(reader addMethod: 'enumerating')
!
do: aBlock
	firstIndex to: lastIndex do: [:index | aBlock value: (array basicAt: index)]
!
(reader addMethod: 'As yet unclassified')
!
emptyCheck
	self isEmpty ifTrue: [^self emptyCollectionError]
!
(reader addMethod: 'adding')
!
find: oldObject
	| index |
	index := firstIndex.
	[index <= lastIndex] whileTrue: 
			[(array at: index) = oldObject ifTrue: [^index].
			index := index + 1].
	self errorNotFound: oldObject
!
(reader addMethod: 'accessing')
!
first
	self emptyCheck.
	^array basicAt: firstIndex
!
(reader addMethod: 'As yet unclassified')
!
firstIndex
	^firstIndex
!
(reader addMethod: 'adding')
!
grow
	self increaseCapacity
!
(reader addMethod: 'testing')
!
includes: anObject
	firstIndex to: lastIndex do: [:i | anObject = (array basicAt: i) ifTrue: [^true]].
	^false
!
(reader addMethod: 'private')
!
increaseCapacity
	self changeCapacityTo: self size + self growSize
!
(reader addMethod: 'initialize-release')
!
initializeContents: anArray
	array := anArray.
	firstIndex := 1.
	lastIndex := array basicSize
!
(reader addMethod: 'private')
!
insert: anObject before: spot
	| index delta spotIndex shouldMovePrecedingElements |
	shouldMovePrecedingElements := spot + spot < (firstIndex + lastIndex)
				or: [lastIndex = array basicSize].
	shouldMovePrecedingElements
		ifTrue: 
			[spotIndex := spot - 1.
			firstIndex = 1
				ifTrue: 
					[delta := spotIndex - firstIndex.
					self makeRoomAtFirst.
					spotIndex := firstIndex + delta].
			index := firstIndex := firstIndex - 1.
			[index < spotIndex] whileTrue: 
					[array basicAt: index put: (array basicAt: index + 1).
					index := index + 1]]
		ifFalse: 
			[spotIndex := spot.
			index := lastIndex := lastIndex + 1.
			[index > spotIndex] whileTrue: 
					[array basicAt: index put: (array basicAt: index - 1).
					index := index - 1]].
	array basicAt: index put: anObject.
	^anObject
!
(reader addMethod: 'testing')
!
isEmpty
	^firstIndex > lastIndex
!
(reader addMethod: 'enumerating')
!
keysAndValuesDo: aBlock
	firstIndex to: lastIndex
		do: [:index | aBlock value: index - firstIndex + 1 value: (array basicAt: index)]
!
(reader addMethod: 'accessing')
!
last
	self emptyCheck.
	^array basicAt: lastIndex
!
(reader addMethod: 'private')
!
makeRoomAtFirst
	| delta |
	delta := array basicSize - lastIndex.
	delta = 0
		ifTrue: 
			[self increaseCapacity.
			firstIndex = 1 ifTrue: [self makeRoomAtFirst].
			^self].
	lastIndex to: firstIndex
		by: -1
		do: [:i | array basicAt: i + delta put: (array basicAt: i)].
	firstIndex to: firstIndex + delta - 1 do: [:i | array basicAt: i put: nil].
	firstIndex := firstIndex + delta.
	lastIndex := array basicSize
!
(reader addMethod: 'private')
!
makeRoomAtLast
	| delta |
	delta := 1 - firstIndex.
	delta = 0 ifTrue: [^self increaseCapacity].
	firstIndex to: lastIndex do: [:i | array basicAt: i + delta put: (array basicAt: i)].
	lastIndex + delta + 1 to: lastIndex do: [:i | array basicAt: i put: nil].
	firstIndex := 1.
	lastIndex := lastIndex + delta
!
(reader addMethod: 'testing')
!
notEmpty
	^firstIndex <= lastIndex
!
(reader addMethod: 'removing')
!
remove: oldObject ifAbsent: absentBlock
	| index |
	index := firstIndex.
	[index <= lastIndex] whileTrue: 
			[oldObject = (array at: index)
				ifTrue: 
					[self removeIndex: index.
					^oldObject]
				ifFalse: [index := index + 1]].
	^absentBlock value
!
(reader addMethod: 'removing')
!
removeAllSuchThat: aBlock
	| n |
	n := firstIndex.
	firstIndex to: lastIndex
		do: 
			[:index |
			(aBlock value: (array at: index))
				ifFalse: 
					[array at: n put: (array at: index).
					n := n + 1]].
	array from: n to: lastIndex put: nil.
	lastIndex := n - 1
!
(reader addMethod: 'removing')
!
removeAtIndex: anIndex
	| obj |
	obj := self at: anIndex.
	self removeIndex: anIndex + firstIndex - 1.
	^obj
!
(reader addMethod: 'removing')
!
removeFirst
	| firstObject |
	self emptyCheck.
	firstObject := array basicAt: firstIndex.
	array basicAt: firstIndex put: nil.
	firstIndex := firstIndex + 1.
	^firstObject
!
(reader addMethod: 'removing')
!
removeFirst: numElements
	| result |
	numElements > self size ifTrue: [^self notEnoughElementsError].
	result := Array new: numElements.
	1 to: numElements
		do: 
			[:index |
			result at: index put: (array basicAt: firstIndex).
			array basicAt: firstIndex put: nil.
			firstIndex := firstIndex + 1].
	^result
!
(reader addMethod: 'private')
!
removeIndex: removedIndex
	| index |
	index := removedIndex.
	[index < lastIndex] whileTrue: 
			[array basicAt: index put: (array basicAt: index + 1).
			index := index + 1].
	array basicAt: lastIndex put: nil.
	lastIndex := lastIndex - 1
!
(reader addMethod: 'removing')
!
removeLast
	| lastObject |
	self emptyCheck.
	lastObject := array basicAt: lastIndex.
	array basicAt: lastIndex put: nil.
	lastIndex := lastIndex - 1.
	^lastObject
!
(reader addMethod: 'removing')
!
removeLast: numElements
	| result |
	numElements > self size ifTrue: [^self notEnoughElementsError].
	result := Array new: numElements.
	1 to: numElements
		do: 
			[:index |
			result at: numElements + 1 - index put: (array basicAt: lastIndex).
			array basicAt: lastIndex put: nil.
			lastIndex := lastIndex - 1].
	^result
!
(reader addMethod: 'removing')
!
reset
	self resetTo: 1
!
(reader addMethod: 'removing')
!
resetTo: index
	firstIndex := index.
	lastIndex := firstIndex - 1
!
(reader addMethod: 'enumerating')
!
reverseDo: aBlock
	lastIndex to: firstIndex
		by: -1
		do: [:index | aBlock value: (array basicAt: index)]
!
(reader addMethod: 'accessing')
!
select: aBlock
	| newCollection element |
	newCollection := self copyEmpty.
	firstIndex to: lastIndex
		do: [:index | (aBlock value: (element := array at: index)) ifTrue: [newCollection addLast: element]].
	^newCollection
!
(reader addMethod: 'private')
!
setCollection: anArray
	<squeak>
	array := anArray.
	self reset
!
(reader addMethod: 'private')
!
setContents: anArray
	array := anArray.
	firstIndex := 1.
	lastIndex := array size
!
(reader addMethod: 'gravel')
!
size
	^lastIndex - (firstIndex - 1)
!
(reader addMethod: 'private')
!
trim
	self changeCapacityTo: self size
!
(reader addClassMethod: 'private')
!
arrayType
	<squeak>
	^Array
!
(reader addClassMethod: 'gravel')
!
newImpl
	^self newImpl: 3
!
(reader addClassMethod: 'gravel')
!
newImpl: size
	^super new setCollection: (self arrayType new: size)
!
(reader addClassMethod: 'instance creation')
!
ofSize: n
	| collection |
	collection := self new: n.
	collection setContents: collection collector.
	^collection
!
