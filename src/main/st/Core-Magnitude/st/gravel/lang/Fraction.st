(reader defineClass: 'Fraction' superclass: 'st.gravel.lang.Number')
!
(reader addInstVar: 'numerator')
!
(reader addInstVar: 'denominator')
!
(reader addMethod: 'accessing')
!
denominator
	^denominator
!
(reader addMethod: 'initialize-release')
!
initializeNumerator: anInteger denominator: anInteger2
	numerator := anInteger.
	denominator := anInteger2.
	self initialize
!
(reader addMethod: 'accessing')
!
numerator
	^numerator
!
(reader addMethod: 'accessing')
!
printOn: aStream
	aStream
		nextPut: $(;
		print: numerator.
	aStream
		nextPutAll: ' / ';
		print: denominator;
		nextPut: $)
!
(reader addClassMethod: 'instance creation')
!
numerator: numerator denominator: denominator
	numerator < 0
		ifTrue: [^self numerator: numerator negated denominator: denominator negated].
	denominator = 1 ifTrue: [^numerator].
	^self new initializeNumerator: numerator truncated denominator: denominator truncated
!
(reader addClassMethod: 'instance creation')
!
reducedNumerator: numInteger denominator: denInteger
	| gcd denominator numerator |
	denominator := denInteger truncated abs.
	denominator isZero ifTrue: [^self divisionByZeroError].
	denInteger negative
		ifTrue: [numerator := numInteger truncated negated]
		ifFalse: [numerator := numInteger truncated].
	gcd := numerator gcd: denominator.
	denominator = gcd ifTrue: [^numerator // gcd].
	gcd = 1 ifTrue: [^self basicNew initializeNumerator: numerator denominator: denominator].
	^self basicNew initializeNumerator: numerator // gcd denominator: denominator // gcd
!
