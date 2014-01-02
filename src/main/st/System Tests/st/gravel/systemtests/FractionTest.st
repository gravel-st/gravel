(reader defineClass: 'FractionTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
testNegativeFraction
	| value |
	value := -2 / 5.
	self assert: value numerator = -2.
	self assert: value denominator = 5
!
