(reader defineClass: 'CrossTypeArithmeticTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_big
	self
		assert: 251172765292171600923361522612285166173 \\ 251172765292171600923361522612285166173
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_fixed
	self assert: 251172765292171600923361522612285166173 \\ 3s equals: 1s
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_float
	self assert: 251172765292171600923361522612285166173 \\ 7.5 equals: 0.0
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_fraction
	self assert: 251172765292171600923361522612285166173 \\ (2 / 3) equals: 1 / 3
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_int
	self assert: 251172765292171600923361522612285166173 \\ 7 equals: 5
!
(reader addMethod: 'tests')
!
test_big_minus_big
	self
		assert: 251172765292171600923361522612285166173 - 251172765292171600923361522612285166173
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_minus_fixed
	self assert: 251172765292171600923361522612285166173 - 3s
		equals: 251172765292171600923361522612285166171s
!
(reader addMethod: 'tests')
!
test_big_minus_float
	self
		assert: 251172765292171600923361522612285166173 - 7.5
		equals: 2.51173e38
		delta: 2.23129e32
!
(reader addMethod: 'tests')
!
test_big_minus_fraction
	self assert: 251172765292171600923361522612285166173 - (2 / 3)
		equals: 753518295876514802770084567836855498517 / 3
!
(reader addMethod: 'tests')
!
test_big_minus_int
	self assert: 251172765292171600923361522612285166173 - 7
		equals: 251172765292171600923361522612285166166
!
(reader addMethod: 'tests')
!
test_big_minus_zero
	self assert: 251172765292171600923361522612285166173 - 0
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_big_plus_big
	self
		assert: 251172765292171600923361522612285166173 + 251172765292171600923361522612285166173
		equals: 502345530584343201846723045224570332346
!
(reader addMethod: 'tests')
!
test_big_plus_fixed
	self assert: 251172765292171600923361522612285166173 + 3s
		equals: 251172765292171600923361522612285166176s
!
(reader addMethod: 'tests')
!
test_big_plus_float
	self
		assert: 251172765292171600923361522612285166173 + 7.5
		equals: 2.51173e38
		delta: 2.23129e32
!
(reader addMethod: 'tests')
!
test_big_plus_fraction
	self assert: 251172765292171600923361522612285166173 + (2 / 3)
		equals: 753518295876514802770084567836855498521 / 3
!
(reader addMethod: 'tests')
!
test_big_plus_int
	self assert: 251172765292171600923361522612285166173 + 7
		equals: 251172765292171600923361522612285166180
!
(reader addMethod: 'tests')
!
test_big_plus_zero
	self assert: 251172765292171600923361522612285166173 + 0
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_big_quo__big
	self assert: (251172765292171600923361522612285166173
				quo: 251172765292171600923361522612285166173)
		equals: 1
!
(reader addMethod: 'tests')
!
test_big_quo__fixed
	self assert: (251172765292171600923361522612285166173 quo: 3s)
		equals: 100469106116868640369344609044914066469
!
(reader addMethod: 'tests')
!
test_big_quo__float
	self assert: (251172765292171600923361522612285166173 quo: 7.5)
		equals: 33489701194659127740991376919118217216
!
(reader addMethod: 'tests')
!
test_big_quo__fraction
	self assert: (251172765292171600923361522612285166173 quo: 2 / 3)
		equals: 376759147938257401385042283918427749259
!
(reader addMethod: 'tests')
!
test_big_quo__int
	self assert: (251172765292171600923361522612285166173 quo: 7)
		equals: 35881823613167371560480217516040738024
!
(reader addMethod: 'tests')
!
test_big_rem__big
	self assert: (251172765292171600923361522612285166173
				rem: 251172765292171600923361522612285166173)
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_rem__fixed
	self assert: (251172765292171600923361522612285166173 rem: 3s) equals: 1s
!
(reader addMethod: 'tests')
!
test_big_rem__float
	self assert: (251172765292171600923361522612285166173 rem: 7.5) equals: 0.0
!
(reader addMethod: 'tests')
!
test_big_rem__fraction
	self assert: (251172765292171600923361522612285166173 rem: 2 / 3) equals: 1 / 3
!
(reader addMethod: 'tests')
!
test_big_rem__int
	self assert: (251172765292171600923361522612285166173 rem: 7) equals: 5
!
(reader addMethod: 'tests')
!
test_big_slashslash_big
	self
		assert: 251172765292171600923361522612285166173 // 251172765292171600923361522612285166173
		equals: 1
!
(reader addMethod: 'tests')
!
test_big_slashslash_fixed
	self assert: 251172765292171600923361522612285166173 // 3s
		equals: 100469106116868640369344609044914066469
!
(reader addMethod: 'tests')
!
test_big_slashslash_float
	self assert: 251172765292171600923361522612285166173 // 7.5
		equals: 33489701194659127740991376919118217216
!
(reader addMethod: 'tests')
!
test_big_slashslash_fraction
	self assert: 251172765292171600923361522612285166173 // (2 / 3)
		equals: 376759147938257401385042283918427749259
!
(reader addMethod: 'tests')
!
test_big_slashslash_int
	self assert: 251172765292171600923361522612285166173 // 7
		equals: 35881823613167371560480217516040738024
!
(reader addMethod: 'tests')
!
test_big_times_big
	self
		assert: 251172765292171600923361522612285166173 * 251172765292171600923361522612285166173
		equals: 63087758024516322802158777844395404045045331444940183845941515327498223465929
!
(reader addMethod: 'tests')
!
test_big_times_fixed
	self assert: 251172765292171600923361522612285166173 * 3s
		equals: 627931913230429002308403806530712915433s
!
(reader addMethod: 'tests')
!
test_big_times_fraction
	self assert: 251172765292171600923361522612285166173 * (2 / 3)
		equals: 502345530584343201846723045224570332346 / 3
!
(reader addMethod: 'tests')
!
test_big_times_int
	self assert: 251172765292171600923361522612285166173 * 7
		equals: 1758209357045201206463530658285996163211
!
(reader addMethod: 'tests')
!
test_big_times_zero
	self assert: 251172765292171600923361522612285166173 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_backslashbackslash_big
	self assert: 3s \\ 251172765292171600923361522612285166173 equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_backslashbackslash_fixed
	self assert: 3s \\ 3s equals: 0s
!
(reader addMethod: 'tests')
!
test_fixed_backslashbackslash_float
	self assert: 3s \\ 7.5 equals: 2.5
!
(reader addMethod: 'tests')
!
test_fixed_backslashbackslash_fraction
	self assert: 3s \\ (2 / 3) equals: 1s
!
(reader addMethod: 'tests')
!
test_fixed_backslashbackslash_int
	self assert: 3s \\ 7 equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_minus_big
	self assert: 3s - 251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166170s
!
(reader addMethod: 'tests')
!
test_fixed_minus_fixed
	self assert: 3s - 3s equals: 0s
!
(reader addMethod: 'tests')
!
test_fixed_minus_float
	self assert: 3s - 7.5 equals: -5.0
!
(reader addMethod: 'tests')
!
test_fixed_minus_fraction
	self
		assert: 3s - (2 / 3)
		equals: 2s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fixed_minus_int
	self assert: 3s - 7 equals: -4s
!
(reader addMethod: 'tests')
!
test_fixed_minus_zero
	self assert: 3s - 0 equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_plus_big
	self assert: 3s + 251172765292171600923361522612285166173
		equals: 251172765292171600923361522612285166176s
!
(reader addMethod: 'tests')
!
test_fixed_plus_fixed
	self assert: 3s + 3s equals: 5s
!
(reader addMethod: 'tests')
!
test_fixed_plus_float
	self assert: 3s + 7.5 equals: 10.0
!
(reader addMethod: 'tests')
!
test_fixed_plus_fraction
	self
		assert: 3s + (2 / 3)
		equals: 3s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fixed_plus_int
	self assert: 3s + 7 equals: 10s
!
(reader addMethod: 'tests')
!
test_fixed_plus_zero
	self assert: 3s + 0 equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_quo__big
	self assert: (3s quo: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_quo__fixed
	self assert: (3s quo: 3s) equals: 1
!
(reader addMethod: 'tests')
!
test_fixed_quo__float
	self assert: (3s quo: 7.5) equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_quo__fraction
	self assert: (3s quo: 2 / 3) equals: 3
!
(reader addMethod: 'tests')
!
test_fixed_quo__int
	self assert: (3s quo: 7) equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_rem__big
	self assert: (3s rem: 251172765292171600923361522612285166173) equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_rem__fixed
	self assert: (3s rem: 3s) equals: 0s
!
(reader addMethod: 'tests')
!
test_fixed_rem__float
	self assert: (3s rem: 7.5) equals: 2.5
!
(reader addMethod: 'tests')
!
test_fixed_rem__fraction
	self assert: (3s rem: 2 / 3) equals: 1s
!
(reader addMethod: 'tests')
!
test_fixed_rem__int
	self assert: (3s rem: 7) equals: 3s
!
(reader addMethod: 'tests')
!
test_fixed_slashslash_big
	self assert: 3s // 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_slashslash_fixed
	self assert: 3s // 3s equals: 1
!
(reader addMethod: 'tests')
!
test_fixed_slashslash_float
	self assert: 3s // 7.5 equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_slashslash_fraction
	self assert: 3s // (2 / 3) equals: 3
!
(reader addMethod: 'tests')
!
test_fixed_slashslash_int
	self assert: 3s // 7 equals: 0
!
(reader addMethod: 'tests')
!
test_fixed_times_big
	self assert: 3s * 251172765292171600923361522612285166173
		equals: 627931913230429002308403806530712915433s
!
(reader addMethod: 'tests')
!
test_fixed_times_fixed
	self
		assert: 3s * 3s
		equals: 6s
		delta: 0.050005
!
(reader addMethod: 'tests')
!
test_fixed_times_float
	self assert: 3s * 7.5 equals: 18.75
!
(reader addMethod: 'tests')
!
test_fixed_times_fraction
	self
		assert: 3s * (2 / 3)
		equals: 2s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fixed_times_int
	self assert: 3s * 7 equals: 18s
!
(reader addMethod: 'tests')
!
test_fixed_times_zero
	self assert: 3s * 0 equals: 0s
!
(reader addMethod: 'tests')
!
test_float_backslashbackslash_big
	self assert: 7.5 \\ 251172765292171600923361522612285166173 equals: 7.5
!
(reader addMethod: 'tests')
!
test_float_backslashbackslash_fixed
	self assert: 7.5 \\ 3s equals: 0.0
!
(reader addMethod: 'tests')
!
test_float_backslashbackslash_float
	self assert: 7.5 \\ 7.5 equals: 0.0
!
(reader addMethod: 'tests')
!
test_float_backslashbackslash_fraction
	self
		assert: 7.5 \\ (2 / 3)
		equals: 0.166667
		delta: 4.91787e-7
!
(reader addMethod: 'tests')
!
test_float_backslashbackslash_int
	self assert: 7.5 \\ 7 equals: 0.5
!
(reader addMethod: 'tests')
!
test_float_minus_big
	self
		assert: 7.5 - 251172765292171600923361522612285166173
		equals: -2.51173e38
		delta: 2.23129e32
!
(reader addMethod: 'tests')
!
test_float_minus_fixed
	self assert: 7.5 - 3s equals: 5.0
!
(reader addMethod: 'tests')
!
test_float_minus_float
	self assert: 7.5 - 7.5 equals: 0.0
!
(reader addMethod: 'tests')
!
test_float_minus_fraction
	self
		assert: 7.5 - (2 / 3)
		equals: 6.83333
		delta: 3.33819e-6
!
(reader addMethod: 'tests')
!
test_float_minus_int
	self assert: 7.5 - 7 equals: 0.5
!
(reader addMethod: 'tests')
!
test_float_minus_zero
	self assert: 7.5 - 0 equals: 7.5
!
(reader addMethod: 'tests')
!
test_float_plus_big
	self
		assert: 7.5 + 251172765292171600923361522612285166173
		equals: 2.51173e38
		delta: 2.23129e32
!
(reader addMethod: 'tests')
!
test_float_plus_fixed
	self assert: 7.5 + 3s equals: 10.0
!
(reader addMethod: 'tests')
!
test_float_plus_float
	self assert: 7.5 + 7.5 equals: 15.0
!
(reader addMethod: 'tests')
!
test_float_plus_fraction
	self
		assert: 7.5 + (2 / 3)
		equals: 8.16667
		delta: 2.86131e-6
!
(reader addMethod: 'tests')
!
test_float_plus_int
	self assert: 7.5 + 7 equals: 14.5
!
(reader addMethod: 'tests')
!
test_float_plus_zero
	self assert: 7.5 + 0 equals: 7.5
!
(reader addMethod: 'tests')
!
test_float_quo__big
	self assert: (7.5 quo: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_float_quo__fixed
	self assert: (7.5 quo: 3s) equals: 3
!
(reader addMethod: 'tests')
!
test_float_quo__float
	self assert: (7.5 quo: 7.5) equals: 1
!
(reader addMethod: 'tests')
!
test_float_quo__fraction
	self assert: (7.5 quo: 2 / 3) equals: 11
!
(reader addMethod: 'tests')
!
test_float_quo__int
	self assert: (7.5 quo: 7) equals: 1
!
(reader addMethod: 'tests')
!
test_float_rem__big
	self assert: (7.5 rem: 251172765292171600923361522612285166173) equals: 7.5
!
(reader addMethod: 'tests')
!
test_float_rem__fixed
	self assert: (7.5 rem: 3s) equals: 0.0
!
(reader addMethod: 'tests')
!
test_float_rem__float
	self assert: (7.5 rem: 7.5) equals: 0.0
!
(reader addMethod: 'tests')
!
test_float_rem__fraction
	self
		assert: (7.5 rem: 2 / 3)
		equals: 0.166667
		delta: 4.91787e-7
!
(reader addMethod: 'tests')
!
test_float_rem__int
	self assert: (7.5 rem: 7) equals: 0.5
!
(reader addMethod: 'tests')
!
test_float_slashslash_big
	self assert: 7.5 // 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_float_slashslash_fixed
	self assert: 7.5 // 3s equals: 3
!
(reader addMethod: 'tests')
!
test_float_slashslash_float
	self assert: 7.5 // 7.5 equals: 1
!
(reader addMethod: 'tests')
!
test_float_slashslash_fraction
	self assert: 7.5 // (2 / 3) equals: 11
!
(reader addMethod: 'tests')
!
test_float_slashslash_int
	self assert: 7.5 // 7 equals: 1
!
(reader addMethod: 'tests')
!
test_float_times_fixed
	self assert: 7.5 * 3s equals: 18.75
!
(reader addMethod: 'tests')
!
test_float_times_float
	self assert: 7.5 * 7.5 equals: 56.25
!
(reader addMethod: 'tests')
!
test_float_times_fraction
	self assert: 7.5 * (2 / 3) equals: 5.0
!
(reader addMethod: 'tests')
!
test_float_times_int
	self assert: 7.5 * 7 equals: 52.5
!
(reader addMethod: 'tests')
!
test_float_times_zero
	self assert: 7.5 * 0 equals: 0.0
!
(reader addMethod: 'tests')
!
test_fraction_backslashbackslash_big
	self assert: 2 / 3 \\ 251172765292171600923361522612285166173 equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_backslashbackslash_fixed
	self
		assert: 2 / 3 \\ 3s
		equals: 1s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fraction_backslashbackslash_float
	self
		assert: 2 / 3 \\ 7.5
		equals: 0.666667
		delta: 2.98053e-7
!
(reader addMethod: 'tests')
!
test_fraction_backslashbackslash_fraction
	self assert: 2 / 3 \\ (2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_backslashbackslash_int
	self assert: 2 / 3 \\ 7 equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_minus_big
	self assert: 2 / 3 - 251172765292171600923361522612285166173
		equals: -753518295876514802770084567836855498517 / 3
!
(reader addMethod: 'tests')
!
test_fraction_minus_fixed
	self
		assert: 2 / 3 - 3s
		equals: -2s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fraction_minus_float
	self
		assert: 2 / 3 - 7.5
		equals: -6.83333
		delta: 3.33819e-6
!
(reader addMethod: 'tests')
!
test_fraction_minus_fraction
	self assert: 2 / 3 - (2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_minus_int
	self assert: 2 / 3 - 7 equals: -19 / 3
!
(reader addMethod: 'tests')
!
test_fraction_minus_zero
	self assert: 2 / 3 - 0 equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_plus_big
	self assert: 2 / 3 + 251172765292171600923361522612285166173
		equals: 753518295876514802770084567836855498521 / 3
!
(reader addMethod: 'tests')
!
test_fraction_plus_fixed
	self
		assert: 2 / 3 + 3s
		equals: 3s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fraction_plus_float
	self
		assert: 2 / 3 + 7.5
		equals: 8.16667
		delta: 2.86131e-6
!
(reader addMethod: 'tests')
!
test_fraction_plus_fraction
	self assert: 2 / 3 + (2 / 3) equals: 4 / 3
!
(reader addMethod: 'tests')
!
test_fraction_plus_int
	self assert: 2 / 3 + 7 equals: 23 / 3
!
(reader addMethod: 'tests')
!
test_fraction_plus_zero
	self assert: 2 / 3 + 0 equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_quo__big
	self assert: (2 / 3 quo: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_quo__fixed
	self assert: (2 / 3 quo: 3s) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_quo__float
	self assert: (2 / 3 quo: 7.5) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_quo__fraction
	self assert: (2 / 3 quo: 2 / 3) equals: 1
!
(reader addMethod: 'tests')
!
test_fraction_quo__int
	self assert: (2 / 3 quo: 7) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_rem__big
	self assert: (2 / 3 rem: 251172765292171600923361522612285166173) equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_rem__fixed
	self
		assert: (2 / 3 rem: 3s)
		equals: 1s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fraction_rem__float
	self
		assert: (2 / 3 rem: 7.5)
		equals: 0.666667
		delta: 2.98053e-7
!
(reader addMethod: 'tests')
!
test_fraction_rem__fraction
	self assert: (2 / 3 rem: 2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_rem__int
	self assert: (2 / 3 rem: 7) equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_fraction_slashslash_big
	self assert: 2 / 3 // 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_slashslash_fixed
	self assert: 2 / 3 // 3s equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_slashslash_float
	self assert: 2 / 3 // 7.5 equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_slashslash_fraction
	self assert: 2 / 3 // (2 / 3) equals: 1
!
(reader addMethod: 'tests')
!
test_fraction_slashslash_int
	self assert: 2 / 3 // 7 equals: 0
!
(reader addMethod: 'tests')
!
test_fraction_times_big
	self assert: 2 / 3 * 251172765292171600923361522612285166173
		equals: 502345530584343201846723045224570332346 / 3
!
(reader addMethod: 'tests')
!
test_fraction_times_fixed
	self
		assert: 2 / 3 * 3s
		equals: 2s
		delta: 0.0333367
!
(reader addMethod: 'tests')
!
test_fraction_times_float
	self assert: 2 / 3 * 7.5 equals: 5.0
!
(reader addMethod: 'tests')
!
test_fraction_times_fraction
	self assert: 2 / 3 * (2 / 3) equals: 4 / 9
!
(reader addMethod: 'tests')
!
test_fraction_times_int
	self assert: 2 / 3 * 7 equals: 14 / 3
!
(reader addMethod: 'tests')
!
test_fraction_times_zero
	self assert: 2 / 3 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_big
	self assert: 7 \\ 251172765292171600923361522612285166173 equals: 7
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_fixed
	self assert: 7 \\ 3s equals: 2s
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_float
	self assert: 7 \\ 7.5 equals: 7.0
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_fraction
	self assert: 7 \\ (2 / 3) equals: 1 / 3
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_int
	self assert: 7 \\ 7 equals: 0
!
(reader addMethod: 'tests')
!
test_int_minus_big
	self assert: 7 - 251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166166
!
(reader addMethod: 'tests')
!
test_int_minus_fixed
	self assert: 7 - 3s equals: 5s
!
(reader addMethod: 'tests')
!
test_int_minus_float
	self assert: 7 - 7.5 equals: -0.5
!
(reader addMethod: 'tests')
!
test_int_minus_fraction
	self assert: 7 - (2 / 3) equals: 19 / 3
!
(reader addMethod: 'tests')
!
test_int_minus_int
	self assert: 7 - 7 equals: 0
!
(reader addMethod: 'tests')
!
test_int_minus_zero
	self assert: 7 - 0 equals: 7
!
(reader addMethod: 'tests')
!
test_int_plus_big
	self assert: 7 + 251172765292171600923361522612285166173
		equals: 251172765292171600923361522612285166180
!
(reader addMethod: 'tests')
!
test_int_plus_fixed
	self assert: 7 + 3s equals: 10s
!
(reader addMethod: 'tests')
!
test_int_plus_float
	self assert: 7 + 7.5 equals: 14.5
!
(reader addMethod: 'tests')
!
test_int_plus_fraction
	self assert: 7 + (2 / 3) equals: 23 / 3
!
(reader addMethod: 'tests')
!
test_int_plus_int
	self assert: 7 + 7 equals: 14
!
(reader addMethod: 'tests')
!
test_int_plus_zero
	self assert: 7 + 0 equals: 7
!
(reader addMethod: 'tests')
!
test_int_quo__big
	self assert: (7 quo: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__fixed
	self assert: (7 quo: 3s) equals: 2
!
(reader addMethod: 'tests')
!
test_int_quo__float
	self assert: (7 quo: 7.5) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__fraction
	self assert: (7 quo: 2 / 3) equals: 10
!
(reader addMethod: 'tests')
!
test_int_quo__int
	self assert: (7 quo: 7) equals: 1
!
(reader addMethod: 'tests')
!
test_int_rem__big
	self assert: (7 rem: 251172765292171600923361522612285166173) equals: 7
!
(reader addMethod: 'tests')
!
test_int_rem__fixed
	self assert: (7 rem: 3s) equals: 2s
!
(reader addMethod: 'tests')
!
test_int_rem__float
	self assert: (7 rem: 7.5) equals: 7.0
!
(reader addMethod: 'tests')
!
test_int_rem__fraction
	self assert: (7 rem: 2 / 3) equals: 1 / 3
!
(reader addMethod: 'tests')
!
test_int_rem__int
	self assert: (7 rem: 7) equals: 0
!
(reader addMethod: 'tests')
!
test_int_slashslash_big
	self assert: 7 // 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_int_slashslash_fixed
	self assert: 7 // 3s equals: 2
!
(reader addMethod: 'tests')
!
test_int_slashslash_float
	self assert: 7 // 7.5 equals: 0
!
(reader addMethod: 'tests')
!
test_int_slashslash_fraction
	self assert: 7 // (2 / 3) equals: 10
!
(reader addMethod: 'tests')
!
test_int_slashslash_int
	self assert: 7 // 7 equals: 1
!
(reader addMethod: 'tests')
!
test_int_times_big
	self assert: 7 * 251172765292171600923361522612285166173
		equals: 1758209357045201206463530658285996163211
!
(reader addMethod: 'tests')
!
test_int_times_fixed
	self assert: 7 * 3s equals: 18s
!
(reader addMethod: 'tests')
!
test_int_times_float
	self assert: 7 * 7.5 equals: 52.5
!
(reader addMethod: 'tests')
!
test_int_times_fraction
	self assert: 7 * (2 / 3) equals: 14 / 3
!
(reader addMethod: 'tests')
!
test_int_times_int
	self assert: 7 * 7 equals: 49
!
(reader addMethod: 'tests')
!
test_int_times_zero
	self assert: 7 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_big
	self assert: 0 \\ 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_fixed
	self assert: 0 \\ 3s equals: 0s
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_float
	self assert: 0 \\ 7.5 equals: 0.0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_fraction
	self assert: 0 \\ (2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_int
	self assert: 0 \\ 7 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_minus_big
	self assert: 0 - 251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_zero_minus_fixed
	self assert: 0 - 3s equals: -2s
!
(reader addMethod: 'tests')
!
test_zero_minus_float
	self assert: 0 - 7.5 equals: -7.5
!
(reader addMethod: 'tests')
!
test_zero_minus_fraction
	self assert: 0 - (2 / 3) equals: -2 / 3
!
(reader addMethod: 'tests')
!
test_zero_minus_int
	self assert: 0 - 7 equals: -7
!
(reader addMethod: 'tests')
!
test_zero_minus_zero
	self assert: 0 - 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_plus_big
	self assert: 0 + 251172765292171600923361522612285166173
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_zero_plus_fixed
	self assert: 0 + 3s equals: 3s
!
(reader addMethod: 'tests')
!
test_zero_plus_float
	self assert: 0 + 7.5 equals: 7.5
!
(reader addMethod: 'tests')
!
test_zero_plus_fraction
	self assert: 0 + (2 / 3) equals: 2 / 3
!
(reader addMethod: 'tests')
!
test_zero_plus_int
	self assert: 0 + 7 equals: 7
!
(reader addMethod: 'tests')
!
test_zero_plus_zero
	self assert: 0 + 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__big
	self assert: (0 quo: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__fixed
	self assert: (0 quo: 3s) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__float
	self assert: (0 quo: 7.5) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__fraction
	self assert: (0 quo: 2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__int
	self assert: (0 quo: 7) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__big
	self assert: (0 rem: 251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__fixed
	self assert: (0 rem: 3s) equals: 0s
!
(reader addMethod: 'tests')
!
test_zero_rem__float
	self assert: (0 rem: 7.5) equals: 0.0
!
(reader addMethod: 'tests')
!
test_zero_rem__fraction
	self assert: (0 rem: 2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__int
	self assert: (0 rem: 7) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_big
	self assert: 0 // 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_fixed
	self assert: 0 // 3s equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_float
	self assert: 0 // 7.5 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_fraction
	self assert: 0 // (2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_int
	self assert: 0 // 7 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_big
	self assert: 0 * 251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_fixed
	self assert: 0 * 3s equals: 0s
!
(reader addMethod: 'tests')
!
test_zero_times_float
	self assert: 0 * 7.5 equals: 0.0
!
(reader addMethod: 'tests')
!
test_zero_times_fraction
	self assert: 0 * (2 / 3) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_int
	self assert: 0 * 7 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_zero
	self assert: 0 * 0 equals: 0
!
(reader addClassMethod: 'As yet unclassified')
!
generate
	#(#float #fixed #fraction #int #big #zero) with: (Core.Array
				with: 7.5
				with: 3s
				with: 2 / 3
				with: 7
				with: 251172765292171600923361522612285166173
				with: 0)
		do: 
			[:an :a |
			#(#float #fixed #fraction #int #big #zero) with: (Core.Array
						with: 7.5
						with: 3s
						with: 2 / 3
						with: 7
						with: 251172765292171600923361522612285166173
						with: 0)
				do: 
					[:bn :b |
					#(#* #+ #- #// #quo: #rem: #\\) do: 
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
	| value delta |
	value := [anInteger perform: aSymbol with: anInteger2] on: Core.Error do: [:ex | ^self].
	delta := ((Smalltalk.Compiler evaluate: value printString) - value) abs asFloat * 1.0001.
	self
		formatAndCompile: 'test_' , an , '_'
				, ((SP.SelectorConverter selectorAsFunctionName: aSymbol) reject: [:e | e = $$]) , '_'
				, bn , '

	self assert: ('
				, anInteger printString , ' '
				, aSymbol , ' '
				, anInteger2 printString , ') equals: '
				, value printString
					, (delta isZero ifTrue: [''] ifFalse: [' delta: ' , delta printString])
		classified: 'tests'
!
