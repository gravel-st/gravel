(reader defineClass: 'Character' superclass: 'org.gravel.lang.Magnitude')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Character')
!
(reader addMethod: 'gravel')
!
< aMagnitude
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: 'gravel')
!
== aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'gravel')
!
asInteger
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'asInteger')>
	
!
(reader addMethod: 'gravel')
!
asUppercase
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'asUppercase')>
	
!
(reader addMethod: 'gravel')
!
digitValue
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'digitValue')>
	
!
(reader addMethod: 'gravel')
!
isDigit
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'isDigit')>
	
!
(reader addMethod: 'gravel')
!
isLetter
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'isLetter')>
	
!
(reader addMethod: 'gravel')
!
isLineBreak
	^self = Character cr or: [self = Character lf]
!
(reader addMethod: 'gravel')
!
isVowel
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'isVowel')>
	
!
(reader addMethod: 'gravel')
!
isWhitespace
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'isWhitespace')>
	
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
(reader addClassMethod: 'gravel')
!
value: anInteger
	<primitive: #('org.gravel.support.jvm.CharacterExtensions' 'newInstance')>
	
!
