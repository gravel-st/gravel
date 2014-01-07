(reader defineClass: 'SurrogatePair' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.Character')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Character class')
!
(reader addInstVar: 'characters')
!
(reader addMethod: 'comparing')
!
= anObject
	^self class = anObject class
		and: [SurrogatePair characters: characters equals: anObject characters]
!
(reader addMethod: 'comparing')
!
== anObject
	^self = anObject
!
(reader addMethod: 'accessing')
!
characters
	^characters
!
(reader addMethod: 'converting')
!
codePoint
	^SurrogatePair codePointOfCharacters: characters
!
(reader addMethod: 'accessing')
!
codeUnitsSize
	^SurrogatePair codeUnitsSize: characters
!
(reader addMethod: 'initialize-release')
!
initializeCharacters: aString
	characters := aString.
	self initialize
!
(reader addClassMethod: 'instance creation')
!
characters: aString
	^self new initializeCharacters: aString
!
(reader addClassMethod: 'private')
!
characters: characters equals: other
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'characters_equals_')>
	
!
(reader addClassMethod: 'instance creation')
!
codePoint: anInteger
	^self characters: (self toChars: anInteger)
!
(reader addClassMethod: 'private')
!
codePointOfCharacters: characters
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'codePointOfCharacters_')>
	
!
(reader addClassMethod: 'private')
!
codeUnitsSize: characters
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'codeUnitsSize_')>
	
!
(reader addClassMethod: 'instance creation')
!
toChars: anInteger
	<primitive: #('java.lang.Character' 'toChars')>
	
!
