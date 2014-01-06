(reader defineClass: 'CrossTypeComparisonTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_big_equals_big
	self
		assert: 251172765292171600923361522612285166173 = 251172765292171600923361522612285166173
		equals: true
!
(reader addMethod: 'tests')
!
test_big_equals_double
	self assert: 251172765292171600923361522612285166173 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_fixed
	self assert: 251172765292171600923361522612285166173 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_float
	self assert: 251172765292171600923361522612285166173 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_fraction
	self assert: 251172765292171600923361522612285166173 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_int
	self assert: 251172765292171600923361522612285166173 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negbig
	self
		assert: 251172765292171600923361522612285166173 = -251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negdouble
	self assert: 251172765292171600923361522612285166173 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negfixed
	self assert: 251172765292171600923361522612285166173 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negfloat
	self assert: 251172765292171600923361522612285166173 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negfraction
	self assert: 251172765292171600923361522612285166173 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negint
	self assert: 251172765292171600923361522612285166173 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_negzero
	self assert: 251172765292171600923361522612285166173 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_big_equals_zero
	self assert: 251172765292171600923361522612285166173 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_big
	self
		assert: 251172765292171600923361522612285166173 < 251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_big_less_double
	self assert: 251172765292171600923361522612285166173 < 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_big_less_fixed
	self assert: 251172765292171600923361522612285166173 < 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_big_less_float
	self assert: 251172765292171600923361522612285166173 < 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_fraction
	self assert: 251172765292171600923361522612285166173 < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_big_less_int
	self assert: 251172765292171600923361522612285166173 < 7 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negbig
	self
		assert: 251172765292171600923361522612285166173 < -251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negdouble
	self assert: 251172765292171600923361522612285166173 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negfixed
	self assert: 251172765292171600923361522612285166173 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negfloat
	self assert: 251172765292171600923361522612285166173 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negfraction
	self assert: 251172765292171600923361522612285166173 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negint
	self assert: 251172765292171600923361522612285166173 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_negzero
	self assert: 251172765292171600923361522612285166173 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_big_less_zero
	self assert: 251172765292171600923361522612285166173 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_big_more_big
	self
		assert: 251172765292171600923361522612285166173 > 251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_big_more_double
	self assert: 251172765292171600923361522612285166173 > 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_big_more_fixed
	self assert: 251172765292171600923361522612285166173 > 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_big_more_float
	self assert: 251172765292171600923361522612285166173 > 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_big_more_fraction
	self assert: 251172765292171600923361522612285166173 > (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_big_more_int
	self assert: 251172765292171600923361522612285166173 > 7 equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negbig
	self
		assert: 251172765292171600923361522612285166173 > -251172765292171600923361522612285166173
		equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negdouble
	self assert: 251172765292171600923361522612285166173 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negfixed
	self assert: 251172765292171600923361522612285166173 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negfloat
	self assert: 251172765292171600923361522612285166173 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negfraction
	self assert: 251172765292171600923361522612285166173 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negint
	self assert: 251172765292171600923361522612285166173 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_big_more_negzero
	self assert: 251172765292171600923361522612285166173 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_big_more_zero
	self assert: 251172765292171600923361522612285166173 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_double_equals_big
	self assert: 7.5 d = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_double
	self assert: 7.5 d = 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_double_equals_fixed
	self assert: 7.5 d = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_float
	self assert: 7.5 d = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_fraction
	self assert: 7.5 d = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_int
	self assert: 7.5 d = 7 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negbig
	self assert: 7.5 d = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negdouble
	self assert: 7.5 d = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negfixed
	self assert: 7.5 d = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negfloat
	self assert: 7.5 d = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negfraction
	self assert: 7.5 d = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negint
	self assert: 7.5 d = -7 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_negzero
	self assert: 7.5 d = 0 equals: false
!
(reader addMethod: 'tests')
!
test_double_equals_zero
	self assert: 7.5 d = 0 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_big
	self assert: 7.5 d < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_double_less_double
	self assert: 7.5 d < 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_double_less_fixed
	self assert: 7.5 d < 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_double_less_float
	self assert: 7.5 d < 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_fraction
	self assert: 7.5 d < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_double_less_int
	self assert: 7.5 d < 7 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negbig
	self assert: 7.5 d < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negdouble
	self assert: 7.5 d < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negfixed
	self assert: 7.5 d < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negfloat
	self assert: 7.5 d < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negfraction
	self assert: 7.5 d < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negint
	self assert: 7.5 d < -7 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_negzero
	self assert: 7.5 d < 0 equals: false
!
(reader addMethod: 'tests')
!
test_double_less_zero
	self assert: 7.5 d < 0 equals: false
!
(reader addMethod: 'tests')
!
test_double_more_big
	self assert: 7.5 d > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_double_more_double
	self assert: 7.5 d > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_double_more_fixed
	self assert: 7.5 d > 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_double_more_float
	self assert: 7.5 d > 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_fraction
	self assert: 7.5 d > (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_double_more_int
	self assert: 7.5 d > 7 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negbig
	self assert: 7.5 d > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negdouble
	self assert: 7.5 d > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negfixed
	self assert: 7.5 d > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negfloat
	self assert: 7.5 d > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negfraction
	self assert: 7.5 d > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negint
	self assert: 7.5 d > -7 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_negzero
	self assert: 7.5 d > 0 equals: true
!
(reader addMethod: 'tests')
!
test_double_more_zero
	self assert: 7.5 d > 0 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_equals_big
	self assert: 2.5s = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_double
	self assert: 2.5s = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_fixed
	self assert: 2.5s = 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_fixed_equals_float
	self assert: 2.5s = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_fraction
	self assert: 2.5s = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_int
	self assert: 2.5s = 7 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negbig
	self assert: 2.5s = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negdouble
	self assert: 2.5s = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negfixed
	self assert: 2.5s = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negfloat
	self assert: 2.5s = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negfraction
	self assert: 2.5s = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negint
	self assert: 2.5s = -7 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_negzero
	self assert: 2.5s = 0 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_equals_zero
	self assert: 2.5s = 0 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_big
	self assert: 2.5s < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_less_double
	self assert: 2.5s < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_fixed_less_fixed
	self assert: 2.5s < 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_float
	self assert: 2.5s < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_less_fraction
	self assert: 2.5s < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_int
	self assert: 2.5s < 7 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_less_negbig
	self assert: 2.5s < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negdouble
	self assert: 2.5s < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negfixed
	self assert: 2.5s < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negfloat
	self assert: 2.5s < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negfraction
	self assert: 2.5s < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negint
	self assert: 2.5s < -7 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_negzero
	self assert: 2.5s < 0 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_less_zero
	self assert: 2.5s < 0 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_big
	self assert: 2.5s > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_double
	self assert: 2.5s > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_fixed
	self assert: 2.5s > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_float
	self assert: 2.5s > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_fraction
	self assert: 2.5s > (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_int
	self assert: 2.5s > 7 equals: false
!
(reader addMethod: 'tests')
!
test_fixed_more_negbig
	self assert: 2.5s > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negdouble
	self assert: 2.5s > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negfixed
	self assert: 2.5s > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negfloat
	self assert: 2.5s > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negfraction
	self assert: 2.5s > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negint
	self assert: 2.5s > -7 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_negzero
	self assert: 2.5s > 0 equals: true
!
(reader addMethod: 'tests')
!
test_fixed_more_zero
	self assert: 2.5s > 0 equals: true
!
(reader addMethod: 'tests')
!
test_float_equals_big
	self assert: 7.5 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_double
	self assert: 7.5 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_fixed
	self assert: 7.5 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_float
	self assert: 7.5 = 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_float_equals_fraction
	self assert: 7.5 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_int
	self assert: 7.5 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negbig
	self assert: 7.5 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negdouble
	self assert: 7.5 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negfixed
	self assert: 7.5 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negfloat
	self assert: 7.5 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negfraction
	self assert: 7.5 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negint
	self assert: 7.5 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_negzero
	self assert: 7.5 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_float_equals_zero
	self assert: 7.5 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_big
	self assert: 7.5 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_float_less_double
	self assert: 7.5 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_float_less_fixed
	self assert: 7.5 < 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_float_less_float
	self assert: 7.5 < 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_fraction
	self assert: 7.5 < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_float_less_int
	self assert: 7.5 < 7 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negbig
	self assert: 7.5 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negdouble
	self assert: 7.5 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negfixed
	self assert: 7.5 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negfloat
	self assert: 7.5 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negfraction
	self assert: 7.5 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negint
	self assert: 7.5 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_negzero
	self assert: 7.5 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_float_less_zero
	self assert: 7.5 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_float_more_big
	self assert: 7.5 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_float_more_double
	self assert: 7.5 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_float_more_fixed
	self assert: 7.5 > 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_float_more_float
	self assert: 7.5 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_float_more_fraction
	self assert: 7.5 > (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_float_more_int
	self assert: 7.5 > 7 equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negbig
	self assert: 7.5 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negdouble
	self assert: 7.5 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negfixed
	self assert: 7.5 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negfloat
	self assert: 7.5 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negfraction
	self assert: 7.5 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negint
	self assert: 7.5 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_float_more_negzero
	self assert: 7.5 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_float_more_zero
	self assert: 7.5 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_equals_big
	self assert: 2 / 3 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_double
	self assert: 2 / 3 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_fixed
	self assert: 2 / 3 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_float
	self assert: 2 / 3 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_fraction
	self assert: 2 / 3 = (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_fraction_equals_int
	self assert: 2 / 3 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negbig
	self assert: 2 / 3 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negdouble
	self assert: 2 / 3 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negfixed
	self assert: 2 / 3 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negfloat
	self assert: 2 / 3 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negfraction
	self assert: 2 / 3 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negint
	self assert: 2 / 3 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_negzero
	self assert: 2 / 3 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_equals_zero
	self assert: 2 / 3 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_big
	self assert: 2 / 3 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_less_double
	self assert: 2 / 3 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_fraction_less_fixed
	self assert: 2 / 3 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_fraction_less_float
	self assert: 2 / 3 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_less_fraction
	self assert: 2 / 3 < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_int
	self assert: 2 / 3 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_less_negbig
	self assert: 2 / 3 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negdouble
	self assert: 2 / 3 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negfixed
	self assert: 2 / 3 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negfloat
	self assert: 2 / 3 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negfraction
	self assert: 2 / 3 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negint
	self assert: 2 / 3 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_negzero
	self assert: 2 / 3 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_less_zero
	self assert: 2 / 3 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_big
	self assert: 2 / 3 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_double
	self assert: 2 / 3 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_fixed
	self assert: 2 / 3 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_float
	self assert: 2 / 3 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_fraction
	self assert: 2 / 3 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_int
	self assert: 2 / 3 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_fraction_more_negbig
	self assert: 2 / 3 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negdouble
	self assert: 2 / 3 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negfixed
	self assert: 2 / 3 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negfloat
	self assert: 2 / 3 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negfraction
	self assert: 2 / 3 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negint
	self assert: 2 / 3 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_negzero
	self assert: 2 / 3 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_fraction_more_zero
	self assert: 2 / 3 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_int_equals_big
	self assert: 7 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_double
	self assert: 7 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_fixed
	self assert: 7 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_float
	self assert: 7 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_fraction
	self assert: 7 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_int
	self assert: 7 = 7 equals: true
!
(reader addMethod: 'tests')
!
test_int_equals_negbig
	self assert: 7 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negdouble
	self assert: 7 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negfixed
	self assert: 7 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negfloat
	self assert: 7 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negfraction
	self assert: 7 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negint
	self assert: 7 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_negzero
	self assert: 7 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_int_equals_zero
	self assert: 7 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_big
	self assert: 7 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_int_less_double
	self assert: 7 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_int_less_fixed
	self assert: 7 < 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_int_less_float
	self assert: 7 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_int_less_fraction
	self assert: 7 < (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_int_less_int
	self assert: 7 < 7 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negbig
	self assert: 7 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negdouble
	self assert: 7 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negfixed
	self assert: 7 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negfloat
	self assert: 7 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negfraction
	self assert: 7 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negint
	self assert: 7 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_negzero
	self assert: 7 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_int_less_zero
	self assert: 7 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_int_more_big
	self assert: 7 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_int_more_double
	self assert: 7 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_int_more_fixed
	self assert: 7 > 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_int_more_float
	self assert: 7 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_int_more_fraction
	self assert: 7 > (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_int_more_int
	self assert: 7 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_int_more_negbig
	self assert: 7 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negdouble
	self assert: 7 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negfixed
	self assert: 7 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negfloat
	self assert: 7 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negfraction
	self assert: 7 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negint
	self assert: 7 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_int_more_negzero
	self assert: 7 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_int_more_zero
	self assert: 7 > 0 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_equals_big
	self
		assert: -251172765292171600923361522612285166173 = 251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_double
	self assert: -251172765292171600923361522612285166173 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_fixed
	self assert: -251172765292171600923361522612285166173 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_float
	self assert: -251172765292171600923361522612285166173 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_fraction
	self assert: -251172765292171600923361522612285166173 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_int
	self assert: -251172765292171600923361522612285166173 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negbig
	self assert: -251172765292171600923361522612285166173
				= -251172765292171600923361522612285166173
		equals: true
!
(reader addMethod: 'tests')
!
test_negbig_equals_negdouble
	self assert: -251172765292171600923361522612285166173 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negfixed
	self assert: -251172765292171600923361522612285166173 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negfloat
	self assert: -251172765292171600923361522612285166173 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negfraction
	self assert: -251172765292171600923361522612285166173 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negint
	self assert: -251172765292171600923361522612285166173 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_negzero
	self assert: -251172765292171600923361522612285166173 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_equals_zero
	self assert: -251172765292171600923361522612285166173 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_less_big
	self
		assert: -251172765292171600923361522612285166173 < 251172765292171600923361522612285166173
		equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_double
	self assert: -251172765292171600923361522612285166173 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_fixed
	self assert: -251172765292171600923361522612285166173 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_float
	self assert: -251172765292171600923361522612285166173 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_fraction
	self assert: -251172765292171600923361522612285166173 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_int
	self assert: -251172765292171600923361522612285166173 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negbig
	self assert: -251172765292171600923361522612285166173
				< -251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_negbig_less_negdouble
	self assert: -251172765292171600923361522612285166173 < -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negfixed
	self assert: -251172765292171600923361522612285166173 < -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negfloat
	self assert: -251172765292171600923361522612285166173 < -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negfraction
	self assert: -251172765292171600923361522612285166173 < (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negint
	self assert: -251172765292171600923361522612285166173 < -7 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_negzero
	self assert: -251172765292171600923361522612285166173 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_less_zero
	self assert: -251172765292171600923361522612285166173 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negbig_more_big
	self
		assert: -251172765292171600923361522612285166173 > 251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_double
	self assert: -251172765292171600923361522612285166173 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_fixed
	self assert: -251172765292171600923361522612285166173 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_float
	self assert: -251172765292171600923361522612285166173 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_fraction
	self assert: -251172765292171600923361522612285166173 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_int
	self assert: -251172765292171600923361522612285166173 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negbig
	self assert: -251172765292171600923361522612285166173
				> -251172765292171600923361522612285166173
		equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negdouble
	self assert: -251172765292171600923361522612285166173 > -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negfixed
	self assert: -251172765292171600923361522612285166173 > -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negfloat
	self assert: -251172765292171600923361522612285166173 > -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negfraction
	self assert: -251172765292171600923361522612285166173 > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negint
	self assert: -251172765292171600923361522612285166173 > -7 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_negzero
	self assert: -251172765292171600923361522612285166173 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negbig_more_zero
	self assert: -251172765292171600923361522612285166173 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_big
	self assert: -7.5 d = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_double
	self assert: -7.5 d = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_fixed
	self assert: -7.5 d = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_float
	self assert: -7.5 d = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_fraction
	self assert: -7.5 d = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_int
	self assert: -7.5 d = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negbig
	self assert: -7.5 d = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negdouble
	self assert: -7.5 d = -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negfixed
	self assert: -7.5 d = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negfloat
	self assert: -7.5 d = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negfraction
	self assert: -7.5 d = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negint
	self assert: -7.5 d = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_negzero
	self assert: -7.5 d = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_equals_zero
	self assert: -7.5 d = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_less_big
	self assert: -7.5 d < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_double
	self assert: -7.5 d < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_fixed
	self assert: -7.5 d < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_float
	self assert: -7.5 d < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_fraction
	self assert: -7.5 d < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_int
	self assert: -7.5 d < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_negbig
	self assert: -7.5 d < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_less_negdouble
	self assert: -7.5 d < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_less_negfixed
	self assert: -7.5 d < -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_negfloat
	self assert: -7.5 d < -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_negfraction
	self assert: -7.5 d < (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_negint
	self assert: -7.5 d < -7 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_negzero
	self assert: -7.5 d < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_less_zero
	self assert: -7.5 d < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_more_big
	self assert: -7.5 d > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_double
	self assert: -7.5 d > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_fixed
	self assert: -7.5 d > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_float
	self assert: -7.5 d > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_fraction
	self assert: -7.5 d > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_int
	self assert: -7.5 d > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negbig
	self assert: -7.5 d > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negdouble_more_negdouble
	self assert: -7.5 d > -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negfixed
	self assert: -7.5 d > -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negfloat
	self assert: -7.5 d > -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negfraction
	self assert: -7.5 d > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negint
	self assert: -7.5 d > -7 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_negzero
	self assert: -7.5 d > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negdouble_more_zero
	self assert: -7.5 d > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_big
	self assert: -2.5s = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_double
	self assert: -2.5s = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_fixed
	self assert: -2.5s = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_float
	self assert: -2.5s = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_fraction
	self assert: -2.5s = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_int
	self assert: -2.5s = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negbig
	self assert: -2.5s = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negdouble
	self assert: -2.5s = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negfixed
	self assert: -2.5s = -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negfloat
	self assert: -2.5s = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negfraction
	self assert: -2.5s = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negint
	self assert: -2.5s = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_negzero
	self assert: -2.5s = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_equals_zero
	self assert: -2.5s = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_big
	self assert: -2.5s < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_double
	self assert: -2.5s < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_fixed
	self assert: -2.5s < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_float
	self assert: -2.5s < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_fraction
	self assert: -2.5s < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_int
	self assert: -2.5s < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_negbig
	self assert: -2.5s < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_negdouble
	self assert: -2.5s < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_negfixed
	self assert: -2.5s < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_negfloat
	self assert: -2.5s < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_negfraction
	self assert: -2.5s < (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_negint
	self assert: -2.5s < -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_less_negzero
	self assert: -2.5s < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_less_zero
	self assert: -2.5s < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_more_big
	self assert: -2.5s > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_double
	self assert: -2.5s > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_fixed
	self assert: -2.5s > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_float
	self assert: -2.5s > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_fraction
	self assert: -2.5s > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_int
	self assert: -2.5s > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_negbig
	self assert: -2.5s > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_more_negdouble
	self assert: -2.5s > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_more_negfixed
	self assert: -2.5s > -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_negfloat
	self assert: -2.5s > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_more_negfraction
	self assert: -2.5s > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_negint
	self assert: -2.5s > -7 equals: true
!
(reader addMethod: 'tests')
!
test_negfixed_more_negzero
	self assert: -2.5s > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfixed_more_zero
	self assert: -2.5s > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_big
	self assert: -7.5 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_double
	self assert: -7.5 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_fixed
	self assert: -7.5 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_float
	self assert: -7.5 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_fraction
	self assert: -7.5 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_int
	self assert: -7.5 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negbig
	self assert: -7.5 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negdouble
	self assert: -7.5 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negfixed
	self assert: -7.5 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negfloat
	self assert: -7.5 = -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negfraction
	self assert: -7.5 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negint
	self assert: -7.5 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_negzero
	self assert: -7.5 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_equals_zero
	self assert: -7.5 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_less_big
	self assert: -7.5 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_double
	self assert: -7.5 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_fixed
	self assert: -7.5 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_float
	self assert: -7.5 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_fraction
	self assert: -7.5 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_int
	self assert: -7.5 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_negbig
	self assert: -7.5 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_less_negdouble
	self assert: -7.5 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_less_negfixed
	self assert: -7.5 < -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_negfloat
	self assert: -7.5 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_less_negfraction
	self assert: -7.5 < (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_negint
	self assert: -7.5 < -7 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_negzero
	self assert: -7.5 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_less_zero
	self assert: -7.5 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_more_big
	self assert: -7.5 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_double
	self assert: -7.5 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_fixed
	self assert: -7.5 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_float
	self assert: -7.5 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_fraction
	self assert: -7.5 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_int
	self assert: -7.5 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_negbig
	self assert: -7.5 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_more_negdouble
	self assert: -7.5 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfloat_more_negfixed
	self assert: -7.5 > -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_negfloat
	self assert: -7.5 > -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_negfraction
	self assert: -7.5 > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_negint
	self assert: -7.5 > -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_negzero
	self assert: -7.5 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfloat_more_zero
	self assert: -7.5 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_big
	self assert: -2 / 3 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_double
	self assert: -2 / 3 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_fixed
	self assert: -2 / 3 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_float
	self assert: -2 / 3 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_fraction
	self assert: -2 / 3 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_int
	self assert: -2 / 3 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negbig
	self assert: -2 / 3 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negdouble
	self assert: -2 / 3 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negfixed
	self assert: -2 / 3 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negfloat
	self assert: -2 / 3 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negfraction
	self assert: -2 / 3 = (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negint
	self assert: -2 / 3 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_negzero
	self assert: -2 / 3 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_equals_zero
	self assert: -2 / 3 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_big
	self assert: -2 / 3 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_double
	self assert: -2 / 3 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_fixed
	self assert: -2 / 3 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_float
	self assert: -2 / 3 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_fraction
	self assert: -2 / 3 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_int
	self assert: -2 / 3 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_negbig
	self assert: -2 / 3 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negdouble
	self assert: -2 / 3 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negfixed
	self assert: -2 / 3 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negfloat
	self assert: -2 / 3 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negfraction
	self assert: -2 / 3 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negint
	self assert: -2 / 3 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_less_negzero
	self assert: -2 / 3 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_less_zero
	self assert: -2 / 3 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_big
	self assert: -2 / 3 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_double
	self assert: -2 / 3 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_fixed
	self assert: -2 / 3 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_float
	self assert: -2 / 3 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_fraction
	self assert: -2 / 3 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_int
	self assert: -2 / 3 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_negbig
	self assert: -2 / 3 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_negdouble
	self assert: -2 / 3 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_negfixed
	self assert: -2 / 3 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_negfloat
	self assert: -2 / 3 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_negfraction
	self assert: -2 / 3 > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_negint
	self assert: -2 / 3 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_negfraction_more_negzero
	self assert: -2 / 3 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negfraction_more_zero
	self assert: -2 / 3 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_big
	self assert: -7 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_double
	self assert: -7 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_fixed
	self assert: -7 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_float
	self assert: -7 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_fraction
	self assert: -7 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_int
	self assert: -7 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negbig
	self assert: -7 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negdouble
	self assert: -7 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negfixed
	self assert: -7 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negfloat
	self assert: -7 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negfraction
	self assert: -7 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_negint
	self assert: -7 = -7 equals: true
!
(reader addMethod: 'tests')
!
test_negint_equals_negzero
	self assert: -7 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negint_equals_zero
	self assert: -7 = 0 equals: false
!
(reader addMethod: 'tests')
!
test_negint_less_big
	self assert: -7 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_double
	self assert: -7 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_fixed
	self assert: -7 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_float
	self assert: -7 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_fraction
	self assert: -7 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_int
	self assert: -7 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_negbig
	self assert: -7 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negint_less_negdouble
	self assert: -7 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negint_less_negfixed
	self assert: -7 < -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_negfloat
	self assert: -7 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negint_less_negfraction
	self assert: -7 < (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_negint
	self assert: -7 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_negint_less_negzero
	self assert: -7 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negint_less_zero
	self assert: -7 < 0 equals: true
!
(reader addMethod: 'tests')
!
test_negint_more_big
	self assert: -7 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_double
	self assert: -7 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_fixed
	self assert: -7 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_float
	self assert: -7 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_fraction
	self assert: -7 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_int
	self assert: -7 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_negbig
	self assert: -7 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negint_more_negdouble
	self assert: -7 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negint_more_negfixed
	self assert: -7 > -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_negfloat
	self assert: -7 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negint_more_negfraction
	self assert: -7 > (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_negint
	self assert: -7 > -7 equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_negzero
	self assert: -7 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negint_more_zero
	self assert: -7 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_big
	self assert: 0 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_double
	self assert: 0 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_fixed
	self assert: 0 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_float
	self assert: 0 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_fraction
	self assert: 0 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_int
	self assert: 0 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negbig
	self assert: 0 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negdouble
	self assert: 0 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negfixed
	self assert: 0 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negfloat
	self assert: 0 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negfraction
	self assert: 0 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negint
	self assert: 0 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_equals_negzero
	self assert: 0 = 0 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_equals_zero
	self assert: 0 = 0 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_big
	self assert: 0 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_double
	self assert: 0 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_fixed
	self assert: 0 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_float
	self assert: 0 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_fraction
	self assert: 0 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_int
	self assert: 0 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_less_negbig
	self assert: 0 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negdouble
	self assert: 0 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negfixed
	self assert: 0 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negfloat
	self assert: 0 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negfraction
	self assert: 0 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negint
	self assert: 0 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_negzero
	self assert: 0 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_less_zero
	self assert: 0 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_big
	self assert: 0 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_double
	self assert: 0 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_fixed
	self assert: 0 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_float
	self assert: 0 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_fraction
	self assert: 0 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_int
	self assert: 0 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_negbig
	self assert: 0 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negdouble
	self assert: 0 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negfixed
	self assert: 0 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negfloat
	self assert: 0 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negfraction
	self assert: 0 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negint
	self assert: 0 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_negzero_more_negzero
	self assert: 0 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_negzero_more_zero
	self assert: 0 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_big
	self assert: 0 = 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_double
	self assert: 0 = 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_fixed
	self assert: 0 = 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_float
	self assert: 0 = 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_fraction
	self assert: 0 = (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_int
	self assert: 0 = 7 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negbig
	self assert: 0 = -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negdouble
	self assert: 0 = -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negfixed
	self assert: 0 = -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negfloat
	self assert: 0 = -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negfraction
	self assert: 0 = (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negint
	self assert: 0 = -7 equals: false
!
(reader addMethod: 'tests')
!
test_zero_equals_negzero
	self assert: 0 = 0 equals: true
!
(reader addMethod: 'tests')
!
test_zero_equals_zero
	self assert: 0 = 0 equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_big
	self assert: 0 < 251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_double
	self assert: 0 < 7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_fixed
	self assert: 0 < 2.5s equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_float
	self assert: 0 < 7.5 equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_fraction
	self assert: 0 < (2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_int
	self assert: 0 < 7 equals: true
!
(reader addMethod: 'tests')
!
test_zero_less_negbig
	self assert: 0 < -251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negdouble
	self assert: 0 < -7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negfixed
	self assert: 0 < -2.5s equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negfloat
	self assert: 0 < -7.5 equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negfraction
	self assert: 0 < (-2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negint
	self assert: 0 < -7 equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_negzero
	self assert: 0 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_zero_less_zero
	self assert: 0 < 0 equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_big
	self assert: 0 > 251172765292171600923361522612285166173 equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_double
	self assert: 0 > 7.5 d equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_fixed
	self assert: 0 > 2.5s equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_float
	self assert: 0 > 7.5 equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_fraction
	self assert: 0 > (2 / 3) equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_int
	self assert: 0 > 7 equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_negbig
	self assert: 0 > -251172765292171600923361522612285166173 equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negdouble
	self assert: 0 > -7.5 d equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negfixed
	self assert: 0 > -2.5s equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negfloat
	self assert: 0 > -7.5 equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negfraction
	self assert: 0 > (-2 / 3) equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negint
	self assert: 0 > -7 equals: true
!
(reader addMethod: 'tests')
!
test_zero_more_negzero
	self assert: 0 > 0 equals: false
!
(reader addMethod: 'tests')
!
test_zero_more_zero
	self assert: 0 > 0 equals: false
!
(reader addClassMethod: 'As yet unclassified')
!
basicNamesAndValuesDo: aBlock
	#(#float #double #fixed #fraction #int #big #zero) with: (Core.Array
				with: 7.5
				with: 7.50000000000001 d
				with: 2.5s
				with: 2 / 3
				with: 7
				with: 251172765292171600923361522612285166173
				with: 0)
		do: aBlock
!
(reader addClassMethod: 'As yet unclassified')
!
generate
	self namesAndValuesDo: 
			[:an :a |
			self namesAndValuesDo: 
					[:bn :b |
					#(#< #> #=) do: 
							[:sel |
							self
								generateTest: an
								value: a
								op: sel
								arg: bn
								value: b]]]
!
(reader addClassMethod: 'As yet unclassified')
!
generateTest: an value: anInteger op: aSymbol arg: bn value: anInteger2
	| value |
	value := [anInteger perform: aSymbol with: anInteger2] on: Core.Error do: [:ex | ^self].
	self
		formatAndCompile: 'test_' , an , '_'
				, ((SP.SelectorConverter selectorAsFunctionName: aSymbol) reject: [:e | e = $$]) , '_'
				, bn , '

	self assert: ('
				, anInteger printString , ' '
				, aSymbol , ' '
				, anInteger2 printString , ') equals: '
				, value printString
		classified: 'tests'
!
(reader addClassMethod: 'As yet unclassified')
!
namesAndValuesDo: aBlock
	self basicNamesAndValuesDo: aBlock.
	self basicNamesAndValuesDo: [:n :v | aBlock value: 'neg' , n value: v negated]
!
