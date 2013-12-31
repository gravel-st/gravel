(reader defineClass: 'IntegerArithmeticTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_big
	self
		assert: 301434622508125532092685287301027586161 \\ 301434622508125532092685287301027586161
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_int
	self assert: 301434622508125532092685287301027586161 \\ 19 equals: 14
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_long
	self assert: 301434622508125532092685287301027586161 \\ 1239482337033371
		equals: 1125926804156929
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_negBig
	self assert: 301434622508125532092685287301027586161
				\\ -251172765292171600923361522612285166173
		equals: -200910908076217669754037757923542746185
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_negInt
	self assert: 301434622508125532092685287301027586161 \\ -234239 equals: -167020
!
(reader addMethod: 'tests')
!
test_big_backslashbackslash_negLong
	self assert: 301434622508125532092685287301027586161 \\ -123948723370333
		equals: -42803694410592
!
(reader addMethod: 'tests')
!
test_big_gcd__big
	self assert: (301434622508125532092685287301027586161
				gcd: 301434622508125532092685287301027586161)
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_big_gcd__int
	self assert: (301434622508125532092685287301027586161 gcd: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_big_gcd__long
	self assert: (301434622508125532092685287301027586161 gcd: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_big_gcd__negBig
	self assert: (301434622508125532092685287301027586161
				gcd: -251172765292171600923361522612285166173)
		equals: 1
!
(reader addMethod: 'tests')
!
test_big_gcd__negInt
	self assert: (301434622508125532092685287301027586161 gcd: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_big_gcd__negLong
	self assert: (301434622508125532092685287301027586161 gcd: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_big_gcd__zero
	self assert: (301434622508125532092685287301027586161 gcd: 0)
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_big_minus_big
	self
		assert: 301434622508125532092685287301027586161 - 301434622508125532092685287301027586161
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_minus_int
	self assert: 301434622508125532092685287301027586161 - 19
		equals: 301434622508125532092685287301027586142
!
(reader addMethod: 'tests')
!
test_big_minus_long
	self assert: 301434622508125532092685287301027586161 - 1239482337033371
		equals: 301434622508125532092684047818690552790
!
(reader addMethod: 'tests')
!
test_big_minus_negBig
	self
		assert: 301434622508125532092685287301027586161 - -251172765292171600923361522612285166173
		equals: 552607387800297133016046809913312752334
!
(reader addMethod: 'tests')
!
test_big_minus_negInt
	self assert: 301434622508125532092685287301027586161 - -234239
		equals: 301434622508125532092685287301027820400
!
(reader addMethod: 'tests')
!
test_big_minus_negLong
	self assert: 301434622508125532092685287301027586161 - -123948723370333
		equals: 301434622508125532092685411249750956494
!
(reader addMethod: 'tests')
!
test_big_minus_zero
	self assert: 301434622508125532092685287301027586161 - 0
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_big_plus_big
	self
		assert: 301434622508125532092685287301027586161 + 301434622508125532092685287301027586161
		equals: 602869245016251064185370574602055172322
!
(reader addMethod: 'tests')
!
test_big_plus_int
	self assert: 301434622508125532092685287301027586161 + 19
		equals: 301434622508125532092685287301027586180
!
(reader addMethod: 'tests')
!
test_big_plus_long
	self assert: 301434622508125532092685287301027586161 + 1239482337033371
		equals: 301434622508125532092686526783364619532
!
(reader addMethod: 'tests')
!
test_big_plus_negBig
	self
		assert: 301434622508125532092685287301027586161 + -251172765292171600923361522612285166173
		equals: 50261857215953931169323764688742419988
!
(reader addMethod: 'tests')
!
test_big_plus_negInt
	self assert: 301434622508125532092685287301027586161 + -234239
		equals: 301434622508125532092685287301027351922
!
(reader addMethod: 'tests')
!
test_big_plus_negLong
	self assert: 301434622508125532092685287301027586161 + -123948723370333
		equals: 301434622508125532092685163352304215828
!
(reader addMethod: 'tests')
!
test_big_plus_zero
	self assert: 301434622508125532092685287301027586161 + 0
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_big_quo__big
	self assert: (301434622508125532092685287301027586161
				quo: 301434622508125532092685287301027586161)
		equals: 1
!
(reader addMethod: 'tests')
!
test_big_quo__int
	self assert: (301434622508125532092685287301027586161 quo: 19)
		equals: 15864980132006606952246594068475136113
!
(reader addMethod: 'tests')
!
test_big_quo__long
	self assert: (301434622508125532092685287301027586161 quo: 1239482337033371)
		equals: 243193963723268374682192
!
(reader addMethod: 'tests')
!
test_big_quo__negBig
	self assert: (301434622508125532092685287301027586161
				quo: -251172765292171600923361522612285166173)
		equals: -1
!
(reader addMethod: 'tests')
!
test_big_quo__negInt
	self assert: (301434622508125532092685287301027586161 quo: -234239)
		equals: -1286867782513268636276133723679778
!
(reader addMethod: 'tests')
!
test_big_quo__negLong
	self assert: (301434622508125532092685287301027586161 quo: -123948723370333)
		equals: -2431930029706732746260740
!
(reader addMethod: 'tests')
!
test_big_rem__big
	self assert: (301434622508125532092685287301027586161
				rem: 301434622508125532092685287301027586161)
		equals: 0
!
(reader addMethod: 'tests')
!
test_big_rem__int
	self assert: (301434622508125532092685287301027586161 rem: 19) equals: 14
!
(reader addMethod: 'tests')
!
test_big_rem__long
	self assert: (301434622508125532092685287301027586161 rem: 1239482337033371)
		equals: 1125926804156929
!
(reader addMethod: 'tests')
!
test_big_rem__negBig
	self assert: (301434622508125532092685287301027586161
				rem: -251172765292171600923361522612285166173)
		equals: 50261857215953931169323764688742419988
!
(reader addMethod: 'tests')
!
test_big_rem__negInt
	self assert: (301434622508125532092685287301027586161 rem: -234239) equals: 67219
!
(reader addMethod: 'tests')
!
test_big_rem__negLong
	self assert: (301434622508125532092685287301027586161 rem: -123948723370333)
		equals: 81145028959741
!
(reader addMethod: 'tests')
!
test_big_slashslash_big
	self
		assert: 301434622508125532092685287301027586161 // 301434622508125532092685287301027586161
		equals: 1
!
(reader addMethod: 'tests')
!
test_big_slashslash_int
	self assert: 301434622508125532092685287301027586161 // 19
		equals: 15864980132006606952246594068475136113
!
(reader addMethod: 'tests')
!
test_big_slashslash_long
	self assert: 301434622508125532092685287301027586161 // 1239482337033371
		equals: 243193963723268374682192
!
(reader addMethod: 'tests')
!
test_big_slashslash_negBig
	self assert: 301434622508125532092685287301027586161
				// -251172765292171600923361522612285166173
		equals: -2
!
(reader addMethod: 'tests')
!
test_big_slashslash_negInt
	self assert: 301434622508125532092685287301027586161 // -234239
		equals: -1286867782513268636276133723679779
!
(reader addMethod: 'tests')
!
test_big_slashslash_negLong
	self assert: 301434622508125532092685287301027586161 // -123948723370333
		equals: -2431930029706732746260741
!
(reader addMethod: 'tests')
!
test_big_times_big
	self
		assert: 301434622508125532092685287301027586161 * 301434622508125532092685287301027586161
		equals: 90862831646616139648006473449567847137432467495541950831116634043918278717921
!
(reader addMethod: 'tests')
!
test_big_times_int
	self assert: 301434622508125532092685287301027586161 * 19
		equals: 5727257827654385109761020458719524137059
!
(reader addMethod: 'tests')
!
test_big_times_long
	self assert: 301434622508125532092685287301027586161 * 1239482337033371
		equals: 373622890369143410795328717640859095718827729834778731
!
(reader addMethod: 'tests')
!
test_big_times_negBig
	self
		assert: 301434622508125532092685287301027586161 * -251172765292171600923361522612285166173
		equals: -75712167690167761094744181605751891457379916067195187294509019308244960131853
!
(reader addMethod: 'tests')
!
test_big_times_negInt
	self assert: 301434622508125532092685287301027586161 * -234239
		equals: -70607744541680816511858509012105400754766479
!
(reader addMethod: 'tests')
!
test_big_times_negLong
	self assert: 301434622508125532092685287301027586161 * -123948723370333
		equals: -37362436639500404883885511678330906394479871468761613
!
(reader addMethod: 'tests')
!
test_big_times_zero
	self assert: 301434622508125532092685287301027586161 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_big
	self assert: 19 \\ 301434622508125532092685287301027586161 equals: 19
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_int
	self assert: 19 \\ 19 equals: 0
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_long
	self assert: 19 \\ 1239482337033371 equals: 19
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_negBig
	self assert: 19 \\ -251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166154
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_negInt
	self assert: 19 \\ -234239 equals: -234220
!
(reader addMethod: 'tests')
!
test_int_backslashbackslash_negLong
	self assert: 19 \\ -123948723370333 equals: -123948723370314
!
(reader addMethod: 'tests')
!
test_int_gcd__big
	self assert: (19 gcd: 301434622508125532092685287301027586161) equals: 1
!
(reader addMethod: 'tests')
!
test_int_gcd__int
	self assert: (19 gcd: 19) equals: 19
!
(reader addMethod: 'tests')
!
test_int_gcd__long
	self assert: (19 gcd: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_int_gcd__negBig
	self assert: (19 gcd: -251172765292171600923361522612285166173) equals: 1
!
(reader addMethod: 'tests')
!
test_int_gcd__negInt
	self assert: (19 gcd: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_int_gcd__negLong
	self assert: (19 gcd: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_int_gcd__zero
	self assert: (19 gcd: 0) equals: 19
!
(reader addMethod: 'tests')
!
test_int_minus_big
	self assert: 19 - 301434622508125532092685287301027586161
		equals: -301434622508125532092685287301027586142
!
(reader addMethod: 'tests')
!
test_int_minus_int
	self assert: 19 - 19 equals: 0
!
(reader addMethod: 'tests')
!
test_int_minus_long
	self assert: 19 - 1239482337033371 equals: -1239482337033352
!
(reader addMethod: 'tests')
!
test_int_minus_negBig
	self assert: 19 - -251172765292171600923361522612285166173
		equals: 251172765292171600923361522612285166192
!
(reader addMethod: 'tests')
!
test_int_minus_negInt
	self assert: 19 - -234239 equals: 234258
!
(reader addMethod: 'tests')
!
test_int_minus_negLong
	self assert: 19 - -123948723370333 equals: 123948723370352
!
(reader addMethod: 'tests')
!
test_int_minus_zero
	self assert: 19 - 0 equals: 19
!
(reader addMethod: 'tests')
!
test_int_plus_big
	self assert: 19 + 301434622508125532092685287301027586161
		equals: 301434622508125532092685287301027586180
!
(reader addMethod: 'tests')
!
test_int_plus_int
	self assert: 19 + 19 equals: 38
!
(reader addMethod: 'tests')
!
test_int_plus_long
	self assert: 19 + 1239482337033371 equals: 1239482337033390
!
(reader addMethod: 'tests')
!
test_int_plus_negBig
	self assert: 19 + -251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166154
!
(reader addMethod: 'tests')
!
test_int_plus_negInt
	self assert: 19 + -234239 equals: -234220
!
(reader addMethod: 'tests')
!
test_int_plus_negLong
	self assert: 19 + -123948723370333 equals: -123948723370314
!
(reader addMethod: 'tests')
!
test_int_plus_zero
	self assert: 19 + 0 equals: 19
!
(reader addMethod: 'tests')
!
test_int_quo__big
	self assert: (19 quo: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__int
	self assert: (19 quo: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_int_quo__long
	self assert: (19 quo: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__negBig
	self assert: (19 quo: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__negInt
	self assert: (19 quo: -234239) equals: 0
!
(reader addMethod: 'tests')
!
test_int_quo__negLong
	self assert: (19 quo: -123948723370333) equals: 0
!
(reader addMethod: 'tests')
!
test_int_rem__big
	self assert: (19 rem: 301434622508125532092685287301027586161) equals: 19
!
(reader addMethod: 'tests')
!
test_int_rem__int
	self assert: (19 rem: 19) equals: 0
!
(reader addMethod: 'tests')
!
test_int_rem__long
	self assert: (19 rem: 1239482337033371) equals: 19
!
(reader addMethod: 'tests')
!
test_int_rem__negBig
	self assert: (19 rem: -251172765292171600923361522612285166173) equals: 19
!
(reader addMethod: 'tests')
!
test_int_rem__negInt
	self assert: (19 rem: -234239) equals: 19
!
(reader addMethod: 'tests')
!
test_int_rem__negLong
	self assert: (19 rem: -123948723370333) equals: 19
!
(reader addMethod: 'tests')
!
test_int_slashslash_big
	self assert: 19 // 301434622508125532092685287301027586161 equals: 0
!
(reader addMethod: 'tests')
!
test_int_slashslash_int
	self assert: 19 // 19 equals: 1
!
(reader addMethod: 'tests')
!
test_int_slashslash_long
	self assert: 19 // 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_int_slashslash_negBig
	self assert: 19 // -251172765292171600923361522612285166173 equals: -1
!
(reader addMethod: 'tests')
!
test_int_slashslash_negInt
	self assert: 19 // -234239 equals: -1
!
(reader addMethod: 'tests')
!
test_int_slashslash_negLong
	self assert: 19 // -123948723370333 equals: -1
!
(reader addMethod: 'tests')
!
test_int_times_big
	self assert: 19 * 301434622508125532092685287301027586161
		equals: 5727257827654385109761020458719524137059
!
(reader addMethod: 'tests')
!
test_int_times_int
	self assert: 19 * 19 equals: 361
!
(reader addMethod: 'tests')
!
test_int_times_long
	self assert: 19 * 1239482337033371 equals: 23550164403634049
!
(reader addMethod: 'tests')
!
test_int_times_negBig
	self assert: 19 * -251172765292171600923361522612285166173
		equals: -4772282540551260417543868929633418157287
!
(reader addMethod: 'tests')
!
test_int_times_negInt
	self assert: 19 * -234239 equals: -4450541
!
(reader addMethod: 'tests')
!
test_int_times_negLong
	self assert: 19 * -123948723370333 equals: -2355025744036327
!
(reader addMethod: 'tests')
!
test_int_times_zero
	self assert: 19 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_big
	self assert: 1239482337033371 \\ 301434622508125532092685287301027586161
		equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_int
	self assert: 1239482337033371 \\ 19 equals: 11
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_long
	self assert: 1239482337033371 \\ 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_negBig
	self assert: 1239482337033371 \\ -251172765292171600923361522612285166173
		equals: -251172765292171600923360283129948132802
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_negInt
	self assert: 1239482337033371 \\ -234239 equals: -16720
!
(reader addMethod: 'tests')
!
test_long_backslashbackslash_negLong
	self assert: 1239482337033371 \\ -123948723370333 equals: -4896669959
!
(reader addMethod: 'tests')
!
test_long_gcd__big
	self assert: (1239482337033371 gcd: 301434622508125532092685287301027586161) equals: 1
!
(reader addMethod: 'tests')
!
test_long_gcd__int
	self assert: (1239482337033371 gcd: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_long_gcd__long
	self assert: (1239482337033371 gcd: 1239482337033371) equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_gcd__negBig
	self assert: (1239482337033371 gcd: -251172765292171600923361522612285166173) equals: 1
!
(reader addMethod: 'tests')
!
test_long_gcd__negInt
	self assert: (1239482337033371 gcd: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_long_gcd__negLong
	self assert: (1239482337033371 gcd: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_long_gcd__zero
	self assert: (1239482337033371 gcd: 0) equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_minus_big
	self assert: 1239482337033371 - 301434622508125532092685287301027586161
		equals: -301434622508125532092684047818690552790
!
(reader addMethod: 'tests')
!
test_long_minus_int
	self assert: 1239482337033371 - 19 equals: 1239482337033352
!
(reader addMethod: 'tests')
!
test_long_minus_long
	self assert: 1239482337033371 - 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_long_minus_negBig
	self assert: 1239482337033371 - -251172765292171600923361522612285166173
		equals: 251172765292171600923362762094622199544
!
(reader addMethod: 'tests')
!
test_long_minus_negInt
	self assert: 1239482337033371 - -234239 equals: 1239482337267610
!
(reader addMethod: 'tests')
!
test_long_minus_negLong
	self assert: 1239482337033371 - -123948723370333 equals: 1363431060403704
!
(reader addMethod: 'tests')
!
test_long_minus_zero
	self assert: 1239482337033371 - 0 equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_plus_big
	self assert: 1239482337033371 + 301434622508125532092685287301027586161
		equals: 301434622508125532092686526783364619532
!
(reader addMethod: 'tests')
!
test_long_plus_int
	self assert: 1239482337033371 + 19 equals: 1239482337033390
!
(reader addMethod: 'tests')
!
test_long_plus_long
	self assert: 1239482337033371 + 1239482337033371 equals: 2478964674066742
!
(reader addMethod: 'tests')
!
test_long_plus_negBig
	self assert: 1239482337033371 + -251172765292171600923361522612285166173
		equals: -251172765292171600923360283129948132802
!
(reader addMethod: 'tests')
!
test_long_plus_negInt
	self assert: 1239482337033371 + -234239 equals: 1239482336799132
!
(reader addMethod: 'tests')
!
test_long_plus_negLong
	self assert: 1239482337033371 + -123948723370333 equals: 1115533613663038
!
(reader addMethod: 'tests')
!
test_long_plus_zero
	self assert: 1239482337033371 + 0 equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_quo__big
	self assert: (1239482337033371 quo: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_long_quo__int
	self assert: (1239482337033371 quo: 19) equals: 65235912475440
!
(reader addMethod: 'tests')
!
test_long_quo__long
	self assert: (1239482337033371 quo: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_long_quo__negBig
	self assert: (1239482337033371 quo: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_long_quo__negInt
	self assert: (1239482337033371 quo: -234239) equals: -5291528468
!
(reader addMethod: 'tests')
!
test_long_quo__negLong
	self assert: (1239482337033371 quo: -123948723370333) equals: -9
!
(reader addMethod: 'tests')
!
test_long_rem__big
	self assert: (1239482337033371 rem: 301434622508125532092685287301027586161)
		equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_rem__int
	self assert: (1239482337033371 rem: 19) equals: 11
!
(reader addMethod: 'tests')
!
test_long_rem__long
	self assert: (1239482337033371 rem: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_long_rem__negBig
	self assert: (1239482337033371 rem: -251172765292171600923361522612285166173)
		equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_long_rem__negInt
	self assert: (1239482337033371 rem: -234239) equals: 217519
!
(reader addMethod: 'tests')
!
test_long_rem__negLong
	self assert: (1239482337033371 rem: -123948723370333) equals: 123943826700374
!
(reader addMethod: 'tests')
!
test_long_slashslash_big
	self assert: 1239482337033371 // 301434622508125532092685287301027586161 equals: 0
!
(reader addMethod: 'tests')
!
test_long_slashslash_int
	self assert: 1239482337033371 // 19 equals: 65235912475440
!
(reader addMethod: 'tests')
!
test_long_slashslash_long
	self assert: 1239482337033371 // 1239482337033371 equals: 1
!
(reader addMethod: 'tests')
!
test_long_slashslash_negBig
	self assert: 1239482337033371 // -251172765292171600923361522612285166173 equals: -1
!
(reader addMethod: 'tests')
!
test_long_slashslash_negInt
	self assert: 1239482337033371 // -234239 equals: -5291528469
!
(reader addMethod: 'tests')
!
test_long_slashslash_negLong
	self assert: 1239482337033371 // -123948723370333 equals: -10
!
(reader addMethod: 'tests')
!
test_long_times_big
	self assert: 1239482337033371 * 301434622508125532092685287301027586161
		equals: 373622890369143410795328717640859095718827729834778731
!
(reader addMethod: 'tests')
!
test_long_times_int
	self assert: 1239482337033371 * 19 equals: 23550164403634049
!
(reader addMethod: 'tests')
!
test_long_times_long
	self assert: 1239482337033371 * 1239482337033371 equals: 1536316463817707099137167623641
!
(reader addMethod: 'tests')
!
test_long_times_negBig
	self assert: 1239482337033371 * -251172765292171600923361522612285166173
		equals: -311324206123475230068084556437767060049637954581359183
!
(reader addMethod: 'tests')
!
test_long_times_negInt
	self assert: 1239482337033371 * -234239 equals: -290335103144359789669
!
(reader addMethod: 'tests')
!
test_long_times_negLong
	self assert: 1239482337033371 * -123948723370333 equals: -153632253315363156155812382543
!
(reader addMethod: 'tests')
!
test_long_times_zero
	self assert: 1239482337033371 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_big
	self assert: -251172765292171600923361522612285166173
				\\ 301434622508125532092685287301027586161
		equals: 50261857215953931169323764688742419988
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_int
	self assert: -251172765292171600923361522612285166173 \\ 19 equals: 6
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_long
	self assert: -251172765292171600923361522612285166173 \\ 1239482337033371
		equals: 268498789173032
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_negBig
	self assert: -251172765292171600923361522612285166173
				\\ -251172765292171600923361522612285166173
		equals: 0
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_negInt
	self assert: -251172765292171600923361522612285166173 \\ -234239 equals: -209076
!
(reader addMethod: 'tests')
!
test_negBig_backslashbackslash_negLong
	self assert: -251172765292171600923361522612285166173 \\ -123948723370333
		equals: -82729736657494
!
(reader addMethod: 'tests')
!
test_negBig_gcd__big
	self assert: (-251172765292171600923361522612285166173
				gcd: 301434622508125532092685287301027586161)
		equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_gcd__int
	self assert: (-251172765292171600923361522612285166173 gcd: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_gcd__long
	self assert: (-251172765292171600923361522612285166173 gcd: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_gcd__negBig
	self assert: (-251172765292171600923361522612285166173
				gcd: -251172765292171600923361522612285166173)
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_negBig_gcd__negInt
	self assert: (-251172765292171600923361522612285166173 gcd: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_gcd__negLong
	self assert: (-251172765292171600923361522612285166173 gcd: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_gcd__zero
	self assert: (-251172765292171600923361522612285166173 gcd: 0)
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_negBig_minus_big
	self
		assert: -251172765292171600923361522612285166173 - 301434622508125532092685287301027586161
		equals: -552607387800297133016046809913312752334
!
(reader addMethod: 'tests')
!
test_negBig_minus_int
	self assert: -251172765292171600923361522612285166173 - 19
		equals: -251172765292171600923361522612285166192
!
(reader addMethod: 'tests')
!
test_negBig_minus_long
	self assert: -251172765292171600923361522612285166173 - 1239482337033371
		equals: -251172765292171600923362762094622199544
!
(reader addMethod: 'tests')
!
test_negBig_minus_negBig
	self assert: -251172765292171600923361522612285166173
				- -251172765292171600923361522612285166173
		equals: 0
!
(reader addMethod: 'tests')
!
test_negBig_minus_negInt
	self assert: -251172765292171600923361522612285166173 - -234239
		equals: -251172765292171600923361522612284931934
!
(reader addMethod: 'tests')
!
test_negBig_minus_negLong
	self assert: -251172765292171600923361522612285166173 - -123948723370333
		equals: -251172765292171600923361398663561795840
!
(reader addMethod: 'tests')
!
test_negBig_minus_zero
	self assert: -251172765292171600923361522612285166173 - 0
		equals: -251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_negBig_plus_big
	self
		assert: -251172765292171600923361522612285166173 + 301434622508125532092685287301027586161
		equals: 50261857215953931169323764688742419988
!
(reader addMethod: 'tests')
!
test_negBig_plus_int
	self assert: -251172765292171600923361522612285166173 + 19
		equals: -251172765292171600923361522612285166154
!
(reader addMethod: 'tests')
!
test_negBig_plus_long
	self assert: -251172765292171600923361522612285166173 + 1239482337033371
		equals: -251172765292171600923360283129948132802
!
(reader addMethod: 'tests')
!
test_negBig_plus_negBig
	self assert: -251172765292171600923361522612285166173
				+ -251172765292171600923361522612285166173
		equals: -502345530584343201846723045224570332346
!
(reader addMethod: 'tests')
!
test_negBig_plus_negInt
	self assert: -251172765292171600923361522612285166173 + -234239
		equals: -251172765292171600923361522612285400412
!
(reader addMethod: 'tests')
!
test_negBig_plus_negLong
	self assert: -251172765292171600923361522612285166173 + -123948723370333
		equals: -251172765292171600923361646561008536506
!
(reader addMethod: 'tests')
!
test_negBig_plus_zero
	self assert: -251172765292171600923361522612285166173 + 0
		equals: -251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_negBig_quo__big
	self assert: (-251172765292171600923361522612285166173
				quo: 301434622508125532092685287301027586161)
		equals: 0
!
(reader addMethod: 'tests')
!
test_negBig_quo__int
	self assert: (-251172765292171600923361522612285166173 quo: 19)
		equals: -13219619225903768469650606453278166640
!
(reader addMethod: 'tests')
!
test_negBig_quo__long
	self assert: (-251172765292171600923361522612285166173 quo: 1239482337033371)
		equals: -202643279204235398517854
!
(reader addMethod: 'tests')
!
test_negBig_quo__negBig
	self assert: (-251172765292171600923361522612285166173
				quo: -251172765292171600923361522612285166173)
		equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_quo__negInt
	self assert: (-251172765292171600923361522612285166173 quo: -234239)
		equals: 1072292680946262581907203849966423
!
(reader addMethod: 'tests')
!
test_negBig_quo__negLong
	self assert: (-251172765292171600923361522612285166173 quo: -123948723370333)
		equals: 2026424786495941797366963
!
(reader addMethod: 'tests')
!
test_negBig_rem__big
	self assert: (-251172765292171600923361522612285166173
				rem: 301434622508125532092685287301027586161)
		equals: -251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_negBig_rem__int
	self assert: (-251172765292171600923361522612285166173 rem: 19) equals: -13
!
(reader addMethod: 'tests')
!
test_negBig_rem__long
	self assert: (-251172765292171600923361522612285166173 rem: 1239482337033371)
		equals: -970983547860339
!
(reader addMethod: 'tests')
!
test_negBig_rem__negBig
	self assert: (-251172765292171600923361522612285166173
				rem: -251172765292171600923361522612285166173)
		equals: 0
!
(reader addMethod: 'tests')
!
test_negBig_rem__negInt
	self assert: (-251172765292171600923361522612285166173 rem: -234239) equals: -209076
!
(reader addMethod: 'tests')
!
test_negBig_rem__negLong
	self assert: (-251172765292171600923361522612285166173 rem: -123948723370333)
		equals: -82729736657494
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_big
	self assert: -251172765292171600923361522612285166173
				// 301434622508125532092685287301027586161
		equals: -1
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_int
	self assert: -251172765292171600923361522612285166173 // 19
		equals: -13219619225903768469650606453278166641
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_long
	self assert: -251172765292171600923361522612285166173 // 1239482337033371
		equals: -202643279204235398517855
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_negBig
	self assert: -251172765292171600923361522612285166173
				// -251172765292171600923361522612285166173
		equals: 1
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_negInt
	self assert: -251172765292171600923361522612285166173 // -234239
		equals: 1072292680946262581907203849966423
!
(reader addMethod: 'tests')
!
test_negBig_slashslash_negLong
	self assert: -251172765292171600923361522612285166173 // -123948723370333
		equals: 2026424786495941797366963
!
(reader addMethod: 'tests')
!
test_negBig_times_big
	self
		assert: -251172765292171600923361522612285166173 * 301434622508125532092685287301027586161
		equals: -75712167690167761094744181605751891457379916067195187294509019308244960131853
!
(reader addMethod: 'tests')
!
test_negBig_times_int
	self assert: -251172765292171600923361522612285166173 * 19
		equals: -4772282540551260417543868929633418157287
!
(reader addMethod: 'tests')
!
test_negBig_times_long
	self assert: -251172765292171600923361522612285166173 * 1239482337033371
		equals: -311324206123475230068084556437767060049637954581359183
!
(reader addMethod: 'tests')
!
test_negBig_times_negBig
	self assert: -251172765292171600923361522612285166173
				* -251172765292171600923361522612285166173
		equals: 63087758024516322802158777844395404045045331444940183845941515327498223465929
!
(reader addMethod: 'tests')
!
test_negBig_times_negInt
	self assert: -251172765292171600923361522612285166173 * -234239
		equals: 58834457369272983628687279695179065039197347
!
(reader addMethod: 'tests')
!
test_negBig_times_negLong
	self assert: -251172765292171600923361522612285166173 * -123948723370333
		equals: 31132543603360955520262067079879613212561549523345609
!
(reader addMethod: 'tests')
!
test_negBig_times_zero
	self assert: -251172765292171600923361522612285166173 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_big
	self assert: -234239 \\ 301434622508125532092685287301027586161
		equals: 301434622508125532092685287301027351922
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_int
	self assert: -234239 \\ 19 equals: 12
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_long
	self assert: -234239 \\ 1239482337033371 equals: 1239482336799132
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_negBig
	self assert: -234239 \\ -251172765292171600923361522612285166173 equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_negInt
	self assert: -234239 \\ -234239 equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_backslashbackslash_negLong
	self assert: -234239 \\ -123948723370333 equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_gcd__big
	self assert: (-234239 gcd: 301434622508125532092685287301027586161) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_gcd__int
	self assert: (-234239 gcd: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_gcd__long
	self assert: (-234239 gcd: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_gcd__negBig
	self assert: (-234239 gcd: -251172765292171600923361522612285166173) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_gcd__negInt
	self assert: (-234239 gcd: -234239) equals: 234239
!
(reader addMethod: 'tests')
!
test_negInt_gcd__negLong
	self assert: (-234239 gcd: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_gcd__zero
	self assert: (-234239 gcd: 0) equals: 234239
!
(reader addMethod: 'tests')
!
test_negInt_minus_big
	self assert: -234239 - 301434622508125532092685287301027586161
		equals: -301434622508125532092685287301027820400
!
(reader addMethod: 'tests')
!
test_negInt_minus_int
	self assert: -234239 - 19 equals: -234258
!
(reader addMethod: 'tests')
!
test_negInt_minus_long
	self assert: -234239 - 1239482337033371 equals: -1239482337267610
!
(reader addMethod: 'tests')
!
test_negInt_minus_negBig
	self assert: -234239 - -251172765292171600923361522612285166173
		equals: 251172765292171600923361522612284931934
!
(reader addMethod: 'tests')
!
test_negInt_minus_negInt
	self assert: -234239 - -234239 equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_minus_negLong
	self assert: -234239 - -123948723370333 equals: 123948723136094
!
(reader addMethod: 'tests')
!
test_negInt_minus_zero
	self assert: -234239 - 0 equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_plus_big
	self assert: -234239 + 301434622508125532092685287301027586161
		equals: 301434622508125532092685287301027351922
!
(reader addMethod: 'tests')
!
test_negInt_plus_int
	self assert: -234239 + 19 equals: -234220
!
(reader addMethod: 'tests')
!
test_negInt_plus_long
	self assert: -234239 + 1239482337033371 equals: 1239482336799132
!
(reader addMethod: 'tests')
!
test_negInt_plus_negBig
	self assert: -234239 + -251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285400412
!
(reader addMethod: 'tests')
!
test_negInt_plus_negInt
	self assert: -234239 + -234239 equals: -468478
!
(reader addMethod: 'tests')
!
test_negInt_plus_negLong
	self assert: -234239 + -123948723370333 equals: -123948723604572
!
(reader addMethod: 'tests')
!
test_negInt_plus_zero
	self assert: -234239 + 0 equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_quo__big
	self assert: (-234239 quo: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_quo__int
	self assert: (-234239 quo: 19) equals: -12328
!
(reader addMethod: 'tests')
!
test_negInt_quo__long
	self assert: (-234239 quo: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_quo__negBig
	self assert: (-234239 quo: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_quo__negInt
	self assert: (-234239 quo: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_quo__negLong
	self assert: (-234239 quo: -123948723370333) equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_rem__big
	self assert: (-234239 rem: 301434622508125532092685287301027586161) equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_rem__int
	self assert: (-234239 rem: 19) equals: -7
!
(reader addMethod: 'tests')
!
test_negInt_rem__long
	self assert: (-234239 rem: 1239482337033371) equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_rem__negBig
	self assert: (-234239 rem: -251172765292171600923361522612285166173) equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_rem__negInt
	self assert: (-234239 rem: -234239) equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_rem__negLong
	self assert: (-234239 rem: -123948723370333) equals: -234239
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_big
	self assert: -234239 // 301434622508125532092685287301027586161 equals: -1
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_int
	self assert: -234239 // 19 equals: -12329
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_long
	self assert: -234239 // 1239482337033371 equals: -1
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_negBig
	self assert: -234239 // -251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_negInt
	self assert: -234239 // -234239 equals: 1
!
(reader addMethod: 'tests')
!
test_negInt_slashslash_negLong
	self assert: -234239 // -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_negInt_times_big
	self assert: -234239 * 301434622508125532092685287301027586161
		equals: -70607744541680816511858509012105400754766479
!
(reader addMethod: 'tests')
!
test_negInt_times_int
	self assert: -234239 * 19 equals: -4450541
!
(reader addMethod: 'tests')
!
test_negInt_times_long
	self assert: -234239 * 1239482337033371 equals: -290335103144359789669
!
(reader addMethod: 'tests')
!
test_negInt_times_negBig
	self assert: -234239 * -251172765292171600923361522612285166173
		equals: 58834457369272983628687279695179065039197347
!
(reader addMethod: 'tests')
!
test_negInt_times_negInt
	self assert: -234239 * -234239 equals: 54867909121
!
(reader addMethod: 'tests')
!
test_negInt_times_negLong
	self assert: -234239 * -123948723370333 equals: 29033625013543431587
!
(reader addMethod: 'tests')
!
test_negInt_times_zero
	self assert: -234239 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_big
	self assert: -123948723370333 \\ 301434622508125532092685287301027586161
		equals: 301434622508125532092685163352304215828
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_int
	self assert: -123948723370333 \\ 19 equals: 15
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_long
	self assert: -123948723370333 \\ 1239482337033371 equals: 1115533613663038
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_negBig
	self assert: -123948723370333 \\ -251172765292171600923361522612285166173
		equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_negInt
	self assert: -123948723370333 \\ -234239 equals: -82390
!
(reader addMethod: 'tests')
!
test_negLong_backslashbackslash_negLong
	self assert: -123948723370333 \\ -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_gcd__big
	self assert: (-123948723370333 gcd: 301434622508125532092685287301027586161) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_gcd__int
	self assert: (-123948723370333 gcd: 19) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_gcd__long
	self assert: (-123948723370333 gcd: 1239482337033371) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_gcd__negBig
	self assert: (-123948723370333 gcd: -251172765292171600923361522612285166173) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_gcd__negInt
	self assert: (-123948723370333 gcd: -234239) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_gcd__negLong
	self assert: (-123948723370333 gcd: -123948723370333) equals: 123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_gcd__zero
	self assert: (-123948723370333 gcd: 0) equals: 123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_minus_big
	self assert: -123948723370333 - 301434622508125532092685287301027586161
		equals: -301434622508125532092685411249750956494
!
(reader addMethod: 'tests')
!
test_negLong_minus_int
	self assert: -123948723370333 - 19 equals: -123948723370352
!
(reader addMethod: 'tests')
!
test_negLong_minus_long
	self assert: -123948723370333 - 1239482337033371 equals: -1363431060403704
!
(reader addMethod: 'tests')
!
test_negLong_minus_negBig
	self assert: -123948723370333 - -251172765292171600923361522612285166173
		equals: 251172765292171600923361398663561795840
!
(reader addMethod: 'tests')
!
test_negLong_minus_negInt
	self assert: -123948723370333 - -234239 equals: -123948723136094
!
(reader addMethod: 'tests')
!
test_negLong_minus_negLong
	self assert: -123948723370333 - -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_minus_zero
	self assert: -123948723370333 - 0 equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_plus_big
	self assert: -123948723370333 + 301434622508125532092685287301027586161
		equals: 301434622508125532092685163352304215828
!
(reader addMethod: 'tests')
!
test_negLong_plus_int
	self assert: -123948723370333 + 19 equals: -123948723370314
!
(reader addMethod: 'tests')
!
test_negLong_plus_long
	self assert: -123948723370333 + 1239482337033371 equals: 1115533613663038
!
(reader addMethod: 'tests')
!
test_negLong_plus_negBig
	self assert: -123948723370333 + -251172765292171600923361522612285166173
		equals: -251172765292171600923361646561008536506
!
(reader addMethod: 'tests')
!
test_negLong_plus_negInt
	self assert: -123948723370333 + -234239 equals: -123948723604572
!
(reader addMethod: 'tests')
!
test_negLong_plus_negLong
	self assert: -123948723370333 + -123948723370333 equals: -247897446740666
!
(reader addMethod: 'tests')
!
test_negLong_plus_zero
	self assert: -123948723370333 + 0 equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_quo__big
	self assert: (-123948723370333 quo: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_quo__int
	self assert: (-123948723370333 quo: 19) equals: -6523617019491
!
(reader addMethod: 'tests')
!
test_negLong_quo__long
	self assert: (-123948723370333 quo: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_quo__negBig
	self assert: (-123948723370333 quo: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_quo__negInt
	self assert: (-123948723370333 quo: -234239) equals: 529154937
!
(reader addMethod: 'tests')
!
test_negLong_quo__negLong
	self assert: (-123948723370333 quo: -123948723370333) equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_rem__big
	self assert: (-123948723370333 rem: 301434622508125532092685287301027586161)
		equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_rem__int
	self assert: (-123948723370333 rem: 19) equals: -4
!
(reader addMethod: 'tests')
!
test_negLong_rem__long
	self assert: (-123948723370333 rem: 1239482337033371) equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_rem__negBig
	self assert: (-123948723370333 rem: -251172765292171600923361522612285166173)
		equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_negLong_rem__negInt
	self assert: (-123948723370333 rem: -234239) equals: -82390
!
(reader addMethod: 'tests')
!
test_negLong_rem__negLong
	self assert: (-123948723370333 rem: -123948723370333) equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_big
	self assert: -123948723370333 // 301434622508125532092685287301027586161 equals: -1
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_int
	self assert: -123948723370333 // 19 equals: -6523617019492
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_long
	self assert: -123948723370333 // 1239482337033371 equals: -1
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_negBig
	self assert: -123948723370333 // -251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_negInt
	self assert: -123948723370333 // -234239 equals: 529154937
!
(reader addMethod: 'tests')
!
test_negLong_slashslash_negLong
	self assert: -123948723370333 // -123948723370333 equals: 1
!
(reader addMethod: 'tests')
!
test_negLong_times_big
	self assert: -123948723370333 * 301434622508125532092685287301027586161
		equals: -37362436639500404883885511678330906394479871468761613
!
(reader addMethod: 'tests')
!
test_negLong_times_int
	self assert: -123948723370333 * 19 equals: -2355025744036327
!
(reader addMethod: 'tests')
!
test_negLong_times_long
	self assert: -123948723370333 * 1239482337033371 equals: -153632253315363156155812382543
!
(reader addMethod: 'tests')
!
test_negLong_times_negBig
	self assert: -123948723370333 * -251172765292171600923361522612285166173
		equals: 31132543603360955520262067079879613212561549523345609
!
(reader addMethod: 'tests')
!
test_negLong_times_negInt
	self assert: -123948723370333 * -234239 equals: 29033625013543431587
!
(reader addMethod: 'tests')
!
test_negLong_times_negLong
	self assert: -123948723370333 * -123948723370333 equals: 15363286025135334006664530889
!
(reader addMethod: 'tests')
!
test_negLong_times_zero
	self assert: -123948723370333 * 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_big
	self assert: 0 \\ 301434622508125532092685287301027586161 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_int
	self assert: 0 \\ 19 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_long
	self assert: 0 \\ 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_negBig
	self assert: 0 \\ -251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_negInt
	self assert: 0 \\ -234239 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_backslashbackslash_negLong
	self assert: 0 \\ -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_gcd__big
	self assert: (0 gcd: 301434622508125532092685287301027586161)
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_zero_gcd__int
	self assert: (0 gcd: 19) equals: 19
!
(reader addMethod: 'tests')
!
test_zero_gcd__long
	self assert: (0 gcd: 1239482337033371) equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_zero_gcd__negBig
	self assert: (0 gcd: -251172765292171600923361522612285166173)
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_zero_gcd__negInt
	self assert: (0 gcd: -234239) equals: 234239
!
(reader addMethod: 'tests')
!
test_zero_gcd__negLong
	self assert: (0 gcd: -123948723370333) equals: 123948723370333
!
(reader addMethod: 'tests')
!
test_zero_gcd__zero
	self assert: (0 gcd: 0) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_minus_big
	self assert: 0 - 301434622508125532092685287301027586161
		equals: -301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_zero_minus_int
	self assert: 0 - 19 equals: -19
!
(reader addMethod: 'tests')
!
test_zero_minus_long
	self assert: 0 - 1239482337033371 equals: -1239482337033371
!
(reader addMethod: 'tests')
!
test_zero_minus_negBig
	self assert: 0 - -251172765292171600923361522612285166173
		equals: 251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_zero_minus_negInt
	self assert: 0 - -234239 equals: 234239
!
(reader addMethod: 'tests')
!
test_zero_minus_negLong
	self assert: 0 - -123948723370333 equals: 123948723370333
!
(reader addMethod: 'tests')
!
test_zero_minus_zero
	self assert: 0 - 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_plus_big
	self assert: 0 + 301434622508125532092685287301027586161
		equals: 301434622508125532092685287301027586161
!
(reader addMethod: 'tests')
!
test_zero_plus_int
	self assert: 0 + 19 equals: 19
!
(reader addMethod: 'tests')
!
test_zero_plus_long
	self assert: 0 + 1239482337033371 equals: 1239482337033371
!
(reader addMethod: 'tests')
!
test_zero_plus_negBig
	self assert: 0 + -251172765292171600923361522612285166173
		equals: -251172765292171600923361522612285166173
!
(reader addMethod: 'tests')
!
test_zero_plus_negInt
	self assert: 0 + -234239 equals: -234239
!
(reader addMethod: 'tests')
!
test_zero_plus_negLong
	self assert: 0 + -123948723370333 equals: -123948723370333
!
(reader addMethod: 'tests')
!
test_zero_plus_zero
	self assert: 0 + 0 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__big
	self assert: (0 quo: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__int
	self assert: (0 quo: 19) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__long
	self assert: (0 quo: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__negBig
	self assert: (0 quo: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__negInt
	self assert: (0 quo: -234239) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_quo__negLong
	self assert: (0 quo: -123948723370333) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__big
	self assert: (0 rem: 301434622508125532092685287301027586161) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__int
	self assert: (0 rem: 19) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__long
	self assert: (0 rem: 1239482337033371) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__negBig
	self assert: (0 rem: -251172765292171600923361522612285166173) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__negInt
	self assert: (0 rem: -234239) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_rem__negLong
	self assert: (0 rem: -123948723370333) equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_big
	self assert: 0 // 301434622508125532092685287301027586161 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_int
	self assert: 0 // 19 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_long
	self assert: 0 // 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_negBig
	self assert: 0 // -251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_negInt
	self assert: 0 // -234239 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_slashslash_negLong
	self assert: 0 // -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_big
	self assert: 0 * 301434622508125532092685287301027586161 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_int
	self assert: 0 * 19 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_long
	self assert: 0 * 1239482337033371 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_negBig
	self assert: 0 * -251172765292171600923361522612285166173 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_negInt
	self assert: 0 * -234239 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_negLong
	self assert: 0 * -123948723370333 equals: 0
!
(reader addMethod: 'tests')
!
test_zero_times_zero
	self assert: 0 * 0 equals: 0
!
(reader addClassMethod: 'As yet unclassified')
!
generate
	#(#negBig #negLong #negInt #zero #int #long #big)
		with: #(-251172765292171600923361522612285166173 -123948723370333 -234239 0 19 1239482337033371 301434622508125532092685287301027586161)
		do: 
			[:an :a |
			#(#negBig #negLong #negInt #zero #int #long #big)
				with: #(-251172765292171600923361522612285166173 -123948723370333 -234239 0 19 1239482337033371 301434622508125532092685287301027586161)
				do: 
					[:bn :b |
					#(#* #+ #- #// #quo: #rem: #\\ #gcd:) do: 
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
