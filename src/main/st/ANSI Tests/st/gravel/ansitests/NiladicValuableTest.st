(reader defineClass: 'NiladicValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_argumentCount
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue argumentCount.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_value
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue value.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_whileFalse
	| runs |
	runs := 0.
	
	[runs := runs + 1.
	runs = 10] whileFalse.
	self assert: runs = 10
!
(reader addMethod: 'tests')
!
test_whileFalse_
	| runs |
	runs := 0.
	[runs = 10] whileFalse: [runs := runs + 1].
	self assert: runs = 10
!
(reader addMethod: 'tests')
!
test_whileTrue
	| runs |
	runs := 0.
	
	[runs := runs + 1.
	runs < 10] whileTrue.
	self assert: runs = 10
!
(reader addMethod: 'tests')
!
test_whileTrue_
	| runs |
	runs := 0.
	[runs < 10] whileTrue: [runs := runs + 1].
	self assert: runs = 10
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: [3 + 4 = 7]
!
