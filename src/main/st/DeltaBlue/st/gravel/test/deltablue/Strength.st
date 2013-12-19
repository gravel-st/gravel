(reader defineClass: 'Strength' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'symbolicValue')
!
(reader addInstVar: 'arithmeticValue')
!
(reader addClassInstVar: 'absoluteStrongest')
!
(reader addClassInstVar: 'absoluteWeakest')
!
(reader addClassInstVar: 'required')
!
(reader addClassInstVar: 'strengthConstants')
!
(reader addClassInstVar: 'strengthTable')
!
(reader addMethod: 'gravel')
!
arithmeticValue
	^arithmeticValue
!
(reader addMethod: 'gravel')
!
initializeWith: symVal
	symbolicValue := symVal.
	arithmeticValue := self class strengthTableAt: symbolicValue
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream nextPutAll: '%' , symbolicValue , '%'
!
(reader addMethod: 'gravel')
!
sameAs: aStrength
	^arithmeticValue = aStrength arithmeticValue
!
(reader addMethod: 'gravel')
!
stronger: aStrength
	^arithmeticValue < aStrength arithmeticValue
!
(reader addMethod: 'gravel')
!
strongest: aStrength
	(aStrength stronger: self) ifTrue: [^aStrength] ifFalse: [^self]
!
(reader addMethod: 'gravel')
!
weaker: aStrength
	^arithmeticValue > aStrength arithmeticValue
!
(reader addMethod: 'gravel')
!
weakest: aStrength
	(aStrength weaker: self) ifTrue: [^aStrength] ifFalse: [^self]
!
(reader addClassMethod: 'gravel')
!
absoluteStrongest
	^absoluteStrongest
!
(reader addClassMethod: 'gravel')
!
absoluteWeakest
	^absoluteWeakest
!
(reader addClassMethod: 'gravel')
!
initialize
	strengthTable := Dictionary new.
	strengthTable at: #absoluteStrongest put: -10000.
	strengthTable at: #required put: -800.
	strengthTable at: #strongPreferred put: -600.
	strengthTable at: #preferred put: -400.
	strengthTable at: #strongDefault put: -200.
	strengthTable at: #default put: 0.
	strengthTable at: #weakDefault put: 500.
	strengthTable at: #absoluteWeakest put: 10000.
	strengthConstants := Dictionary new.
	strengthTable keys
		do: [:strengthSymbol | strengthConstants at: strengthSymbol put: (super new initializeWith: strengthSymbol)].
	absoluteStrongest := Strength of: #absoluteStrongest.
	absoluteWeakest := Strength of: #absoluteWeakest.
	required := Strength of: #required
!
(reader addClassMethod: 'gravel')
!
of: aSymbol
	^strengthConstants at: aSymbol
!
(reader addClassMethod: 'gravel')
!
required
	^required
!
(reader addClassMethod: 'gravel')
!
strengthTableAt: aKey
	^strengthTable at: aKey
!
