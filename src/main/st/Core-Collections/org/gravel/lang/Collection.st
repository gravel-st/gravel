(reader defineTrait: 'Collection' superclass: nil)
!
(reader addMethod: 'iterating')
!
allSatisfy: aBlock
	self do: [:each | (aBlock value: each) ifFalse: [^false]].
	^true
!
(reader addMethod: 'gravel')
!
asArray
	^self asOrderedCollection asArray
!
(reader addMethod: 'gravel')
!
asOrderedCollection
	| anOrderedCollection |
	anOrderedCollection := OrderedCollection new.
	self do: [:each | anOrderedCollection addLast: each].
	^anOrderedCollection
!
(reader addMethod: 'iterating')
!
collect: aBlock
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection
!
(reader addMethod: 'iterating')
!
detect: aBlock
	^self detect: aBlock ifNone: [self notFoundError]
!
(reader addMethod: 'iterating')
!
detect: aBlock ifNone: exceptionBlock
	self do: [:each | (aBlock value: each) ifTrue: [^each]].
	^exceptionBlock value
!
(reader addMethod: 'requirements')
!
do: aBlock
	^self traitRequirement
!
(reader addMethod: 'iterating')
!
do: elementBlock separatedBy: separatorBlock
	| first |
	first := true.
	self do: 
			[:elem |
			first ifTrue: [first := false] ifFalse: [separatorBlock value].
			elementBlock value: elem]
!
(reader addMethod: 'iterating')
!
includes: o {Object} {^Boolean}
	self do: [:e {E} | e = o ifTrue: [^true]].
	^false
!
(reader addMethod: 'iterating')
!
inject: thisValue into: binaryBlock
	| nextValue |
	nextValue := thisValue.
	self do: [:each | nextValue := binaryBlock value: nextValue value: each].
	^nextValue
!
(reader addMethod: 'iterating')
!
join: elemBlock with: sepString
	| stream |
	stream := WriteStream on: String new.
	self do: [:each | stream nextPutAll: (elemBlock value: each)]
		separatedBy: [stream nextPutAll: sepString].
	^stream contents
!
(reader addMethod: 'parallel processing')
!
parallel: threadCount collect: collectBlock
	| newCollection |
	newCollection := JavaConcurrentLinkedQueue new.
	self parallel: threadCount do: [:each | newCollection add: (collectBlock value: each)].
	^newCollection asOrderedCollection
!
(reader addMethod: 'parallel processing')
!
parallel: threadCount do: aBlock
	| queue semaphores failed |
	queue := JavaConcurrentLinkedQueue new.
	self do: [:each | queue nextPut: each].
	semaphores := (1 to: threadCount) collect: [:each | Semaphore new].
	failed := false.
	semaphores do: 
			[:sema |
			
			[
			[
			[| next |
			
			[next := queue nextAvailable.
			next isNil] whileFalse: [aBlock value: next]]
					ifCurtailed: [failed := true]]
					ensure: [sema signal]]
					fork].
	semaphores do: [:sema | sema wait].
	failed ifTrue: [self error: 'Process curtailed']
!
(reader addMethod: 'iterating')
!
select: aBlock
	| newCollection |
	newCollection := self species new.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection
!
(reader addMethod: 'requirements')
!
species
	^self traitRequirement
!
