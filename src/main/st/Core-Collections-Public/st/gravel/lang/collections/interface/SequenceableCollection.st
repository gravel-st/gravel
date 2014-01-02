(reader defineTrait: 'SequenceableCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequencedReadable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequencedReadable class')
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
	newSequenceableCollection := self species new: newSize.
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
(reader addMethod: 'gravel')
!
copySpecies
	^self class
!
(reader addMethod: 'copying')
!
copyTo: stop
	^self copyFrom: 1 to: stop
!
(reader addMethod: 'gravel')
!
copyWith: newElement
	| newIC |
	newIC := self copySpecies withSize: self size + 1.
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
	newIC := self copySpecies withSize: totalSize.
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
	^(self copySpecies new: self size + 1)
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
(reader addMethod: 'converting')
!
reverse
	^self reversed
!
(reader addMethod: 'converting')
!
reversed
	| n result src |
	n := self size.
	result := self species ofSize: n.
	src := n + 1.
	1 to: n do: [:i | result at: i put: (self at: (src := src - 1))].
	^result
!
(reader addMethod: 'enumerating')
!
species
	^OrderedCollection
!
(reader addMethod: 'gravel')
!
startingAt: repStart replaceElementsIn: collection from: start to: stop
	^collection
		replaceElementsFrom: start
		to: stop
		withSequenceableCollection: self
		startingAt: repStart
!
(reader addMethod: 'converting')
!
writeStream
	^WriteStreamImpl collection: self
!
