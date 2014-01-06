(reader defineTrait: 'Symbol' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.String')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.String class')
!
(reader addMethod: 'copying')
!
copyWith: aCharacter
	^self asString copyWith: aCharacter
!
(reader addMethod: 'copying')
!
copyWithAll: aCollection
	^self asString copyWithAll: aCollection
!
(reader addMethod: 'As yet unclassified')
!
isLiteralSymbol
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isSymbol
	^true
!
(reader addMethod: 'As yet unclassified')
!
storeOn: aStream
	aStream nextPut: $#.
	self isLiteralSymbol
		ifTrue: [aStream nextPutAll: self]
		ifFalse: [self stringStoreOn: aStream]
!
(reader addClassMethod: 'instance creation')
!
allStrings
	^self defaultImplementation allStrings
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^GravelSymbol
!
(reader addClassMethod: 'instance creation')
!
value: aString
	^self defaultImplementation value: aString
!
(reader addClassMethod: 'instance creation')
!
with: ch1
	^(String with: ch1) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2
	^(String with: ch1 with: ch2) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3
	^(String with: ch1 with: ch2 with: ch3) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5
		with: ch6) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5
		with: ch6
		with: ch7) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5
		with: ch6
		with: ch7
		with: ch8) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8 with: ch9
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5
		with: ch6
		with: ch7
		with: ch8
		with: ch9) asSymbol
!
(reader addClassMethod: 'instance creation')
!
with: ch1 with: ch2 with: ch3 with: ch4 with: ch5 with: ch6 with: ch7 with: ch8 with: ch9 with: ch10
	^(String
		with: ch1
		with: ch2
		with: ch3
		with: ch4
		with: ch5
		with: ch6
		with: ch7
		with: ch8
		with: ch9
		with: ch10) asSymbol
!
