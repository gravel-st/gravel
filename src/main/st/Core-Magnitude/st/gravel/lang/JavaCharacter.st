(reader defineClass: 'JavaCharacter' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.Character')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Character class')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Character')
!
(reader addMethod: '')
!
< aMagnitude
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: '')
!
== aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: '')
!
asInteger
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'asInteger')>
	
!
(reader addMethod: 'converting')
!
asLowercase
	<primitive: 'toLowerCase'>
	
!
(reader addMethod: 'converting')
!
asUppercase
	<primitive: 'toUpperCase'>
	
!
(reader addMethod: 'converting')
!
codePoint
	^self asInteger
!
(reader addMethod: 'As yet unclassified')
!
codeUnitsSize
	^1
!
(reader addMethod: '')
!
digitValue
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'digitValue')>
	
!
(reader addMethod: '')
!
isDigit
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'isDigit')>
	
!
(reader addMethod: '')
!
isLetter
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'isLetter')>
	
!
(reader addMethod: 'testing')
!
isLowercase
	<primitive: 'isLowerCase'>
	
!
(reader addMethod: 'testing')
!
isUppercase
	<primitive: 'isUpperCase'>
	
!
(reader addMethod: '')
!
isVowel
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'isVowel')>
	
!
(reader addMethod: '')
!
isWhitespace
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'isWhitespace')>
	
!
(reader addClassMethod: 'private-java')
!
charCount: anInteger
	<primitive: #('java.lang.Character' 'charCount')>
	^1
!
(reader addClassMethod: 'instance creation')
!
codePoint: anInteger
	(self charCount: anInteger) > 1 ifTrue: [^SurrogatePair codePoint: anInteger].
	^self newInstance: anInteger
!
(reader addClassMethod: 'instance creation')
!
newInstance: anInteger
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'newInstance')>
	
!
