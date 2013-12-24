(reader defineClass: 'SortedCollectionImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SortedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SortedCollection class')
!
(reader addInstVar: 'sortBlock')
!
(reader addInstVar: 'list')
!
(reader addMethod: 'gravel')
!
add: newObject
	| nextIndex |
	self isEmpty ifTrue: [^list addLast: newObject].
	nextIndex := self indexForInserting: newObject.
	list add: newObject beforeIndex: nextIndex.
	^newObject
!
(reader addMethod: 'gravel')
!
do: aBlock
	list do: aBlock
!
(reader addMethod: 'gravel')
!
indexForInserting: newObject
	| index low high |
	low := 1.
	high := self size.
	
	[index := (high + low) // 2.
	low > high] whileFalse: 
				[(sortBlock value: (list at: index) value: newObject)
					ifTrue: [low := index + 1]
					ifFalse: [high := index - 1]].
	^low
!
(reader addMethod: 'gravel')
!
initialize: initialCapacity
	list := OrderedCollection new: initialCapacity
!
(reader addMethod: 'As yet unclassified')
!
isEmpty
	^list isEmpty
!
(reader addMethod: 'gravel')
!
reSort
	| cp |
	cp := list.
	list := OrderedCollection new.
	cp do: [:each | self add: each]
!
(reader addMethod: 'gravel')
!
size
	^list size
!
(reader addMethod: 'gravel')
!
sortBlock: aBlock
	sortBlock := aBlock.
	self isEmpty ifFalse: [self reSort]
!
(reader addClassMethod: 'private-constants')
!
defaultInitialCapacity
	^3
!
(reader addClassMethod: 'private-constants')
!
defaultSortBlock
	^[:a :b | a < b]
!
(reader addClassMethod: 'instance creation')
!
new
	^self new: self defaultInitialCapacity
!
(reader addClassMethod: 'instance creation')
!
new: initialCapacity
	^(super new)
		initialize: initialCapacity;
		sortBlock: self defaultSortBlock
!
(reader addClassMethod: 'instance creation')
!
sortBlock: aBlock
	^(super new)
		initialize: self defaultInitialCapacity;
		sortBlock: aBlock
!
