(reader defineTrait: 'SequenceableCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequencedReadable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequencedReadable class')
!
(reader addMethod: 'gravel')
!
anElement
	^self at: 1
!
(reader addMethod: 'accessing')
!
atAll: aCollection put: anObject
	aCollection do: [:index | self at: index put: anObject].
	^anObject
!
(reader addMethod: 'accessing')
!
atAllPut: anObject
	1 to: self size do: [:index | self at: index put: anObject]
!
(reader addMethod: 'enumerating')
!
collect: aBlock
	| newCollection |
	newCollection := self species new: self size.
	1 to: self size
		do: [:index | newCollection at: index put: (aBlock value: (self at: index))].
	^newCollection
!
(reader addMethod: 'enumerating')
!
copyEmpty: aSize
	^self class new: aSize
!
(reader addMethod: 'copying')
!
copyReplaceFrom: start to: stop with: replacementCollection
	| newSequenceableCollection newSize endReplacement |
	newSize := self size - (stop - start + 1) + replacementCollection size.
	endReplacement := start - 1 + replacementCollection size.
	newSequenceableCollection := self copySpecies ofSize: newSize.
	start > 1
		ifTrue: 
			[newSequenceableCollection
				replaceFrom: 1
				to: start - 1
				with: self
				startingAt: 1].
	start <= endReplacement
		ifTrue: 
			[newSequenceableCollection
				replaceFrom: start
				to: endReplacement
				with: replacementCollection
				startingAt: 1].
	endReplacement < newSize
		ifTrue: 
			[newSequenceableCollection
				replaceFrom: endReplacement + 1
				to: newSize
				with: self
				startingAt: stop + 1].
	^newSequenceableCollection
!
(reader addMethod: 'copying')
!
copyReplaceFrom: start to: stop withObject: replacementElement
	| newSequenceableCollection newSize replacementCollection |
	newSize := self size.
	replacementCollection := Array new: stop - start + 1 withAll: replacementElement.
	newSequenceableCollection := self copySpecies ofSize: newSize.
	newSequenceableCollection
		replaceFrom: 1
		to: start - 1
		with: self
		startingAt: 1.
	newSequenceableCollection
		replaceFrom: start
		to: stop
		with: replacementCollection
		startingAt: 1.
	newSequenceableCollection
		replaceFrom: stop + 1
		to: newSize
		with: self
		startingAt: stop + 1.
	^newSequenceableCollection
!
(reader addMethod: 'copying')
!
copyReplacing: sourceElement withObject: destElement
	^self copy replaceAll: sourceElement with: destElement
!
(reader addMethod: 'gravel')
!
copySpecies
	^self class
!
(reader addMethod: 'copying')
!
copyTo: stop
	self size > stop ifFalse: [^self].
	^self copyFrom: 1 to: stop
!
(reader addMethod: 'gravel')
!
copyWith: newElement
	| newIC |
	newIC := self copySpecies ofSize: self size + 1.
	newIC
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1.
	newIC at: newIC size put: newElement.
	^newIC
!
(reader addMethod: 'gravel')
!
copyWithAll: aColl
	| newIC totalSize |
	totalSize := self size + aColl size.
	newIC := self copySpecies ofSize: totalSize.
	newIC
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1.
	newIC
		replaceFrom: self size + 1
		to: totalSize
		with: aColl
		startingAt: 1.
	^newIC
!
(reader addMethod: 'gravel')
!
copyWithFirst: anObject
	^(self copySpecies ofSize: self size + 1)
		replaceFrom: 2
			to: self size + 1
			with: self;
		at: 1 put: anObject;
		yourself
!
(reader addMethod: 'initialize-release')
!
growSize
	^self capacity max: 2
!
(reader addMethod: 'comparing')
!
hash
	| hash |
	hash := self species hash.
	1 to: self size do: [:i | hash := (hash + (self at: i) hash) hashMultiply].
	^hash
!
(reader addMethod: 'converting')
!
readWriteStream
	^ReadWriteStreamImpl collection: self
!
(reader addMethod: 'accessing')
!
replaceAll: oldObject with: newObject
	| index |
	index := self
				indexOf: oldObject
				startingAt: 1
				ifAbsent: [0].
	[index = 0] whileFalse: 
			[self at: index put: newObject.
			index := self
						indexOf: oldObject
						startingAt: index + 1
						ifAbsent: [0]]
!
(reader addMethod: 'gravel')
!
replaceElementsFrom: start to: stop withSequenceableCollection: replacement startingAt: repStart
	| repOff |
	repOff := repStart - start.
	(self == replacement and: [repStart < start])
		ifTrue: 
			[stop to: start
				by: -1
				do: [:index | self at: index put: (replacement at: repOff + index)]]
		ifFalse: [start to: stop do: [:index | self at: index put: (replacement at: repOff + index)]]
!
(reader addMethod: 'accessing')
!
replaceFrom: start to: stop with: replacement
	replacement size = (stop - start + 1)
		ifFalse: [self error: 'Size of replacement doesnt match'].
	^self
		replaceFrom: start
		to: stop
		with: replacement
		startingAt: 1
!
(reader addMethod: 'gravel')
!
replaceFrom: start to: stop with: replacement startingAt: repStart
	^replacement
		startingAt: repStart
		replaceElementsIn: self
		from: start
		to: stop
!
(reader addMethod: 'accessing')
!
replaceFrom: start to: stop withObject: anElement
	start to: stop do: [:i | self at: i put: anElement]
!
(reader addMethod: 'converting')
!
reverse
	| n result src |
	n := self size.
	result := self species ofSize: n.
	src := n + 1.
	1 to: n do: [:i | result at: i put: (self at: (src := src - 1))].
	^result
!
(reader addMethod: 'accessing')
!
select: aBlock
	| aStream |
	aStream := WriteStream on: (self species new: self size).
	1 to: self size
		do: [:index | (aBlock value: (self at: index)) ifTrue: [aStream nextPut: (self at: index)]].
	^aStream contents
!
(reader addMethod: 'enumerating')
!
species
	^OrderedCollection
!
(reader addMethod: 'converting')
!
writeStream
	^WriteStreamImpl collection: self
!
