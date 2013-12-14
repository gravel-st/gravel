(reader defineClass: 'OrderedCollectionImpl' superclass: 'org.gravel.lang.SequenceableCollectionImpl')
!
(reader addInstVar: 'contents')
!
(reader addInstVar: 'firstIndex')
!
(reader addInstVar: 'lastIndex')
!
(reader addMethod: 'gravel')
!
add: anObject
	^self addLast: anObject
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
addAll: anOrderedCollection
	^self addAllLast: anOrderedCollection
!
(reader addMethod: 'adding')
!
addAllFirst: anOrderedCollection
	anOrderedCollection reverseDo: [:each | self addFirst: each].
	^anOrderedCollection
!
(reader addMethod: 'adding')
!
addAllLast: anOrderedCollection
	anOrderedCollection do: [:each | self addLast: each].
	^anOrderedCollection
!
(reader addMethod: 'adding')
!
addFirst: newObject
	firstIndex = 1 ifTrue: [self makeRoomAtFirst].
	firstIndex := firstIndex - 1.
	contents basicAt: firstIndex put: newObject.
	^newObject
!
(reader addMethod: 'adding')
!
addLast: newObject
	lastIndex = contents basicSize ifTrue: [self makeRoomAtLast].
	lastIndex := lastIndex + 1.
	contents basicAt: lastIndex put: newObject.
	^newObject
!
(reader addMethod: 'accessing')
!
after: oldObject
	| index |
	index := self find: oldObject.
	index = lastIndex ifTrue: [^self lastObjectError] ifFalse: [^contents basicAt: index + 1]
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
	^contents basicAt: anInteger + firstIndex - 1
!
(reader addMethod: 'initialize-release')
!
at: anInteger put: anObject
	^contents basicAt: anInteger + firstIndex - 1 put: anObject
!
(reader addMethod: 'accessing')
!
before: oldObject
	| index |
	index := self find: oldObject.
	index = firstIndex
		ifTrue: [^self firstObjectError]
		ifFalse: [^contents basicAt: index - 1]
!
(reader addMethod: 'initialize-release')
!
capacity
	^contents basicSize
!
(reader addMethod: 'initialize-release')
!
changeCapacityTo: newCapacity
	| newContents |
	newContents := Array new: newCapacity.
	firstIndex to: lastIndex
		do: [:index | newContents at: index - firstIndex + 1 put: (contents basicAt: index)].
	contents := newContents.
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
			newLast + 1 to: lastIndex do: [:i | contents basicAt: i put: nil].
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
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection
!
(reader addMethod: 'enumerating')
!
detect: aBlock ifNone: exceptionBlock
	firstIndex to: lastIndex
		do: 
			[:i |
			| each |
			each := contents basicAt: i.
			(aBlock value: each) ifTrue: [^each]].
	^exceptionBlock value
!
(reader addMethod: 'enumerating')
!
do: aBlock
	firstIndex to: lastIndex do: [:index | aBlock value: (contents basicAt: index)]
!
(reader addMethod: 'As yet unclassified')
!
emptyCheck
	self isEmpty ifTrue: [^self emptyCollectionError]
!
(reader addMethod: 'accessing')
!
first
	self emptyCheck.
	^contents basicAt: firstIndex
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
	firstIndex to: lastIndex do: [:i | anObject = (contents basicAt: i) ifTrue: [^true]].
	^false
!
(reader addMethod: 'private')
!
increaseCapacity
	self changeCapacityTo: self size + self growSize
!
(reader addMethod: 'initialize-release')
!
initializeCapacity: size
	contents := Array withSize: size.
	firstIndex := 1.
	lastIndex := 0
!
(reader addMethod: 'initialize-release')
!
initializeContents: anArray
	contents := anArray.
	firstIndex := 1.
	lastIndex := contents basicSize
!
(reader addMethod: 'private')
!
insert: anObject before: spot
	| index delta spotIndex shouldMovePrecedingElements |
	shouldMovePrecedingElements := spot + spot < (firstIndex + lastIndex)
				or: [lastIndex = contents basicSize].
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
					[contents basicAt: index put: (contents basicAt: index + 1).
					index := index + 1]]
		ifFalse: 
			[spotIndex := spot.
			index := lastIndex := lastIndex + 1.
			[index > spotIndex] whileTrue: 
					[contents basicAt: index put: (contents basicAt: index - 1).
					index := index - 1]].
	contents basicAt: index put: anObject.
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
		do: [:index | aBlock value: index - firstIndex + 1 value: (contents basicAt: index)]
!
(reader addMethod: 'accessing')
!
last
	self emptyCheck.
	^contents basicAt: lastIndex
!
(reader addMethod: 'private')
!
makeRoomAtFirst
	| delta |
	delta := contents basicSize - lastIndex.
	delta = 0
		ifTrue: 
			[self increaseCapacity.
			firstIndex = 1 ifTrue: [self makeRoomAtFirst].
			^self].
	lastIndex to: firstIndex
		by: -1
		do: [:i | contents basicAt: i + delta put: (contents basicAt: i)].
	firstIndex to: firstIndex + delta - 1 do: [:i | contents basicAt: i put: nil].
	firstIndex := firstIndex + delta.
	lastIndex := contents basicSize
!
(reader addMethod: 'private')
!
makeRoomAtLast
	| delta |
	delta := 1 - firstIndex.
	delta = 0 ifTrue: [^self increaseCapacity].
	firstIndex to: lastIndex do: [:i | contents basicAt: i + delta put: (contents basicAt: i)].
	lastIndex + delta + 1 to: lastIndex do: [:i | contents basicAt: i put: nil].
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
remove: oldObject ifAbsent: anExceptionBlock
	firstIndex to: lastIndex
		do: 
			[:index |
			oldObject = (contents basicAt: index)
				ifTrue: 
					[self removeIndex: index.
					^oldObject]].
	^anExceptionBlock value
!
(reader addMethod: 'removing')
!
removeAllSuchThat: aBlock
	| element newCollection index removed |
	newCollection := self copyEmpty.
	index := firstIndex.
	removed := 0.
	[index <= lastIndex] whileTrue: 
			[element := contents basicAt: index.
			(aBlock value: element)
				ifTrue: 
					[| replacementObject |
					replacementObject := index = lastIndex
								ifTrue: [nil]
								ifFalse: [contents basicAt: index + 1].
					newCollection add: element.
					contents basicAt: index - removed put: replacementObject.
					removed := removed + 1]
				ifFalse: 
					[removed > 0 ifTrue: [contents basicAt: index - removed put: (contents basicAt: index)]].
			index := index + 1].
	lastIndex - removed + 1 to: lastIndex
		do: [:nillingIndex | contents basicAt: nillingIndex put: nil].
	lastIndex := lastIndex - removed.
	^newCollection
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
	firstObject := contents basicAt: firstIndex.
	contents basicAt: firstIndex put: nil.
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
			result at: index put: (contents basicAt: firstIndex).
			contents basicAt: firstIndex put: nil.
			firstIndex := firstIndex + 1].
	^result
!
(reader addMethod: 'private')
!
removeIndex: removedIndex
	| index |
	index := removedIndex.
	[index < lastIndex] whileTrue: 
			[contents basicAt: index put: (contents basicAt: index + 1).
			index := index + 1].
	contents basicAt: lastIndex put: nil.
	lastIndex := lastIndex - 1
!
(reader addMethod: 'removing')
!
removeLast
	| lastObject |
	self emptyCheck.
	lastObject := contents basicAt: lastIndex.
	contents basicAt: lastIndex put: nil.
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
			result at: numElements + 1 - index put: (contents basicAt: lastIndex).
			contents basicAt: lastIndex put: nil.
			lastIndex := lastIndex - 1].
	^result
!
(reader addMethod: 'enumerating')
!
reverseDo: aBlock
	lastIndex to: firstIndex
		by: -1
		do: [:index | aBlock value: (contents basicAt: index)]
!
(reader addMethod: 'enumerating')
!
select: aBlock
	| newCollection |
	newCollection := self copyEmpty.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection
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
(reader addClassMethod: 'gravel')
!
new
	^super new initializeCapacity: 3
!
(reader addClassMethod: 'gravel')
!
new: size
	^super new initializeCapacity: size
!
(reader addClassMethod: 'gravel')
!
withSize: size
	^super new initializeContents: (Array withSize: size)
!
