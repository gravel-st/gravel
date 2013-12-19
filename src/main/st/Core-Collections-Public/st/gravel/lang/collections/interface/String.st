(reader defineTrait: 'String' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.IndexedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.IndexedCollection class')
!
(reader addMethod: 'As yet unclassified')
!
asSymbol {^Sym}
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
keywords
	| start stop size result |
	size := self size.
	size = 0 ifTrue: [^#()].
	stop := self nextIndexOf: $: from: 1 to: size.
	(stop isNil or: [stop = size]) ifTrue: [^Array with: self asString].
	result := OrderedCollection new.
	result add: (self copyFrom: 1 to: stop).
	start := stop + 1.
	[start > size] whileFalse: 
			[stop := self nextIndexOf: $: from: start to: size.
			stop isNil ifTrue: [stop := size].
			result add: (self copyFrom: start to: stop).
			start := stop + 1].
	^result asArray
!
(reader addMethod: 'gravel')
!
match: aString
	^self match: aString ignoreCase: true
!
(reader addMethod: 'gravel')
!
match: aString ignoreCase: caseFlag
	^aString matchesPattern: self ignoreCase: caseFlag do: nil
!
(reader addMethod: 'gravel')
!
matchesPattern: pattern ignoreCase: ignoreCase do: aBlock
	| stringSize stringIndex patternSize patternIndex p t patternStartScan stringStartScan singleMatches |
	stringSize := self size.
	stringIndex := 1.
	patternSize := pattern size.
	patternIndex := 1.
	stringStartScan := nil.
	singleMatches := aBlock == nil ifTrue: [nil] ifFalse: [OrderedCollection new].
	[patternIndex <= patternSize] whileTrue: 
			[p := pattern at: patternIndex.
			patternIndex := patternIndex + 1.
			p == $*
				ifTrue: 
					[aBlock == nil
						ifFalse: 
							[stringStartScan == nil
								ifFalse: [aBlock value: stringStartScan value: stringIndex + patternStartScan - patternIndex].
							singleMatches do: [:index | aBlock value: index value: index]].
					patternIndex > patternSize
						ifTrue: 
							[aBlock == nil ifFalse: [aBlock value: stringIndex value: stringSize].
							^true].
					stringStartScan := stringIndex.
					patternStartScan := patternIndex.
					singleMatches == nil ifFalse: [singleMatches setIndices]]
				ifFalse: 
					[stringIndex > stringSize ifTrue: [^false].
					t := self at: stringIndex.
					stringIndex := stringIndex + 1.
					(t == p or: [p == $# or: [ignoreCase and: [t asUppercase == p asUppercase]]])
						ifTrue: 
							[(patternIndex > patternSize and: [stringIndex <= stringSize])
								ifTrue: 
									[stringStartScan == nil ifTrue: [^false].
									stringIndex := stringIndex + patternStartScan - patternIndex + 1.
									patternIndex := patternStartScan.
									singleMatches == nil ifFalse: [singleMatches setIndices]]
								ifFalse: 
									[(p == $# and: [singleMatches notNil]) ifTrue: [singleMatches addLast: stringIndex - 1]]]
						ifFalse: 
							[stringStartScan == nil ifTrue: [^false].
							stringIndex := stringIndex + patternStartScan - patternIndex + 1.
							patternIndex := patternStartScan.
							singleMatches == nil ifFalse: [singleMatches setIndices]]]].
	stringIndex <= stringSize ifTrue: [^false].
	aBlock == nil
		ifFalse: 
			[stringStartScan == nil
				ifFalse: 
					[aBlock value: stringStartScan value: stringIndex + patternStartScan - patternIndex - 1].
			singleMatches do: [:index | aBlock value: index value: index]].
	^true
!
(reader addMethod: 'As yet unclassified')
!
storeOn: aStream
	self stringStoreOn: aStream
!
(reader addMethod: 'private')
!
stringStoreOn: aStream
	aStream nextPut: $'.
	1 to: self size
		do: 
			[:i |
			| ch |
			ch := self at: i.
			ch = $' ifTrue: [aStream nextPutAll: ''''''] ifFalse: [aStream nextPut: ch]].
	aStream nextPut: $'
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^JavaString
!
(reader addClassMethod: 'instance creation')
!
with: ch1
	^(WriteStream on: String new)
		nextPut: ch1;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		nextPut: ch6;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		nextPut: ch6;
		nextPut: ch7;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		nextPut: ch6;
		nextPut: ch7;
		nextPut: ch8;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8 with: ch9
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		nextPut: ch6;
		nextPut: ch7;
		nextPut: ch8;
		nextPut: ch9;
		contents
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8 with: ch9 with: ch10
	^(WriteStream on: String new)
		nextPut: ch1;
		nextPut: ch2;
		nextPut: ch3;
		nextPut: ch4;
		nextPut: ch5;
		nextPut: ch6;
		nextPut: ch7;
		nextPut: ch8;
		nextPut: ch9;
		nextPut: ch10;
		contents
!
