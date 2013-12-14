(reader defineClass: 'SortedCollection' superclass: 'org.gravel.lang.SequenceableCollectionImpl')
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
	list insert: newObject before: nextIndex.
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
initialize
	list := OrderedCollection new
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
(reader addClassMethod: 'gravel')
!
new
	^self sortBlock: [:a :b | a < b]
!
(reader addClassMethod: 'gravel')
!
sortBlock: aBlock
	^(super new)
		initialize;
		sortBlock: aBlock
!
