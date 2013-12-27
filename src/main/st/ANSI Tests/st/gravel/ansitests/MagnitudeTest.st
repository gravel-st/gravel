(reader defineClass: 'MagnitudeTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_between_and_
	self assert: (3 between: 1 and: 7).
	self assert: ($s between: $a and: $z)
!
(reader addMethod: 'tests')
!
test_less
	self assert: 3 < 7.
	self assert: $s < $z
!
(reader addMethod: 'tests')
!
test_less_equals
	self assert: 3 <= 7.
	self assert: $s <= $z
!
(reader addMethod: 'tests')
!
test_max_
	self assert: (3 max: 7) = 7.
	self assert: ($s max: $z) = $z
!
(reader addMethod: 'tests')
!
test_min_
	self assert: (3 min: 7) = 3.
	self assert: ($s min: $z) = $s
!
(reader addMethod: 'tests')
!
test_more
	self deny: 3 > 7.
	self deny: $s > $z
!
(reader addMethod: 'tests')
!
test_more_equals
	self deny: 3 >= 7.
	self deny: $s >= $z
!
