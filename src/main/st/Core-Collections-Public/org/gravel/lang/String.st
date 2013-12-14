(reader defineClass: 'String' superclass: 'org.gravel.lang.SequenceableCollectionImpl')
!
(reader addSimpleTrait: 'org.gravel.lang.Comparable')
!
(reader propertyAt: 'javaClass' put: 'java.lang.String')
!
(reader addMethod: 'gravel')
!
, aString
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'comma_')>
	
!
(reader addMethod: 'gravel')
!
< anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'sortsLowerThan_')>
	
!
(reader addMethod: 'gravel')
!
= anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'equals_')>
	
!
(reader addMethod: 'gravel')
!
asString
	^self
!
(reader addMethod: 'gravel')
!
asSymbol
	^Symbol value: self
!
(reader addMethod: 'gravel')
!
at: index
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'at_')>
	
!
(reader addMethod: 'gravel')
!
copyFrom: start to: stop
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'copyFrom_to_')>
	
!
(reader addMethod: 'gravel')
!
do: aBlock
	1 to: self size do: [:i | aBlock value: (self at: i)]
!
(reader addMethod: 'gravel')
!
isString
	^true
!
(reader addMethod: 'gravel')
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
(reader addMethod: 'gravel')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: 'gravel')
!
size
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'size')>
	
!
(reader addMethod: 'gravel')
!
species
	^OrderedCollection
!
(reader addMethod: 'gravel')
!
storeOn: aStream
	aStream nextPut: $'.
	1 to: self size
		do: 
			[:i |
			| ch |
			ch := self at: i.
			ch = $' ifTrue: [aStream nextPutAll: ''''''] ifFalse: [aStream nextPut: ch]].
	aStream nextPut: $'
!
(reader addMethod: 'As yet unclassified')
!
tokensBasedOn: anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'tokensBasedOn_')>
	
!
(reader addClassMethod: 'gravel')
!
basicNew
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'newInstance')>
	
!
(reader addClassMethod: 'gravel')
!
new: initialSize
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'newInstance_')>
	
!
(reader addClassMethod: 'gravel')
!
with: aCharacter
	| ws |
	ws := WriteStream on: String new.
	ws nextPut: aCharacter.
	^ws contents
!
