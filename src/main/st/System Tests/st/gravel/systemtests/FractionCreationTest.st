(reader defineClass: 'FractionCreationTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
testNegativeFraction
	| value |
	value := -25 / 10.
	self assert: value numerator = -5.
	self assert: value denominator = 2
!
