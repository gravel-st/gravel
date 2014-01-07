(reader defineTrait: 'Character' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addMethod: 'comparing')
!
< aMagnitude
	^self traitRequirement
!
(reader addMethod: 'comparing')
!
== aMagnitude
	^self traitRequirement
!
(reader addMethod: 'converting')
!
asInteger
	^self traitRequirement
!
(reader addMethod: 'converting')
!
asLowercase
	^self traitRequirement
!
(reader addMethod: 'converting')
!
asString
	^String with: self
!
(reader addMethod: 'converting')
!
asUppercase
	^self traitRequirement
!
(reader addMethod: 'converting')
!
codePoint
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
codeUnitsSize
	^self traitRequirement
!
(reader addMethod: 'converting')
!
digitValue
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isAlphaNumeric
	^self isLetter or: [self isDigit]
!
(reader addMethod: 'testing')
!
isCharacter
	^true
!
(reader addMethod: 'testing')
!
isDigit
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isLetter
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isLineBreak
	^self = Character cr or: [self = Character lf]
!
(reader addMethod: 'testing')
!
isLowercase
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isUppercase
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isVowel
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isWhitespace
	^self traitRequirement
!
(reader addClassMethod: 'instance creation')
!
codePoint: anInteger
	^self defaultImplementation codePoint: anInteger
!
(reader addClassMethod: 'accessing untypeable characters')
!
cr
	^self value: 13
!
(reader addClassMethod: 'instance creation')
!
defaultImplementation
	^JavaCharacter
!
(reader addClassMethod: 'accessing untypeable characters')
!
del
	^self value: 127
!
(reader addClassMethod: 'accessing untypeable characters')
!
esc
	^self value: 27
!
(reader addClassMethod: 'accessing untypeable characters')
!
euro
	^self value: 8364
!
(reader addClassMethod: 'accessing untypeable characters')
!
lb
	^self value: 11
!
(reader addClassMethod: 'accessing untypeable characters')
!
lf
	^self value: 10
!
(reader addClassMethod: 'accessing untypeable characters')
!
nbsp
	^self value: 160
!
(reader addClassMethod: 'accessing untypeable characters')
!
space
	^self value: 32
!
(reader addClassMethod: 'accessing untypeable characters')
!
tab
	^self value: 9
!
(reader addClassMethod: 'instance creation')
!
value: anInteger
	^self codePoint: anInteger
!
