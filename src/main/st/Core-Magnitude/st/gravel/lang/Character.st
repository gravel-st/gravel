(reader defineClass: 'Character' superclass: 'st.gravel.lang.Magnitude')
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
	^self digitValue
!
(reader addMethod: '')
!
digitValue
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'digitValue')>
	
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
(reader addMethod: 'gravel')
!
isLineBreak
	^self = Character cr or: [self = Character lf]
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
(reader addClassMethod: 'gravel')
!
cr
	^self value: 13
!
(reader addClassMethod: 'gravel')
!
del
	^self value: 127
!
(reader addClassMethod: 'gravel')
!
esc
	^self value: 27
!
(reader addClassMethod: 'gravel')
!
euro
	^self value: 8364
!
(reader addClassMethod: 'gravel')
!
lb
	^self value: 11
!
(reader addClassMethod: 'gravel')
!
lf
	^self value: 10
!
(reader addClassMethod: 'gravel')
!
nbsp
	^self value: 160
!
(reader addClassMethod: 'gravel')
!
space
	^self value: 32
!
(reader addClassMethod: 'gravel')
!
tab
	^self value: 9
!
(reader addClassMethod: '')
!
value: anInteger
	<primitive: #('st.gravel.support.jvm.CharacterExtensions' 'newInstance')>
	
!
