(reader extendClass: 'String')
!
(reader addSimpleTrait: 'org.gravel.lang.Comparable')
!
(reader addMethod: 'gravel')
!
sunitMatch: aString
	^self match: aString
!
