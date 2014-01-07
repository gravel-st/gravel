(reader defineClass: 'CrossTypeTruncationAndRoundingTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader addMethod: 'tests')
!
test_big_asFraction
	| t1 |
	t1 := 251172765292171600923361522612285166173 asFraction.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_big_ceiling
	| t1 |
	t1 := 251172765292171600923361522612285166173 ceiling.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_big_floor
	| t1 |
	t1 := 251172765292171600923361522612285166173 floor.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_big_fractionPart
	| t1 |
	t1 := 251172765292171600923361522612285166173 fractionPart.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_big_integerPart
	| t1 |
	t1 := 251172765292171600923361522612285166173 integerPart.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_big_rounded
	| t1 |
	t1 := 251172765292171600923361522612285166173 rounded.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_big_truncated
	| t1 |
	t1 := 251172765292171600923361522612285166173 truncated.
	self assert: t1 equals: 251172765292171600923361522612285166173 delta: 0
!
(reader addMethod: 'tests')
!
test_double_asFraction
	| t1 |
	t1 := 100.5000003d asFraction.
	self
		assert: t1
		equals: 7072058810965855 / 70368744177664
		delta: 0
!
(reader addMethod: 'tests')
!
test_double_ceiling
	| t1 |
	t1 := 100.5000003d ceiling.
	self assert: t1 equals: 101 delta: 0
!
(reader addMethod: 'tests')
!
test_double_floor
	| t1 |
	t1 := 100.5000003d floor.
	self assert: t1 equals: 100 delta: 0
!
(reader addMethod: 'tests')
!
test_double_fractionPart
	| t1 |
	t1 := 100.5000003d fractionPart.
	self assert: t1 equals: 0.5000003d delta: 7.10543e-15
!
(reader addMethod: 'tests')
!
test_double_integerPart
	| t1 |
	t1 := 100.5000003d integerPart.
	self assert: t1 equals: 100.0d delta: 0.0
!
(reader addMethod: 'tests')
!
test_double_rounded
	| t1 |
	t1 := 100.5000003d rounded.
	self assert: t1 equals: 101 delta: 0
!
(reader addMethod: 'tests')
!
test_double_truncated
	| t1 |
	t1 := 100.5000003d truncated.
	self assert: t1 equals: 100 delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_asFraction
	| t1 |
	t1 := 2.5s asFraction.
	self
		assert: t1
		equals: 5 / 2
		delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_ceiling
	| t1 |
	t1 := 2.5s ceiling.
	self assert: t1 equals: 3 delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_floor
	| t1 |
	t1 := 2.5s floor.
	self assert: t1 equals: 2 delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_fractionPart
	| t1 |
	t1 := 2.5s fractionPart.
	self assert: t1 equals: 0.5s delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_integerPart
	| t1 |
	t1 := 2.5s integerPart.
	self assert: t1 equals: 2 delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_rounded
	| t1 |
	t1 := 2.5s rounded.
	self assert: t1 equals: 3 delta: 0
!
(reader addMethod: 'tests')
!
test_fixed_truncated
	| t1 |
	t1 := 2.5s truncated.
	self assert: t1 equals: 2 delta: 0
!
(reader addMethod: 'tests')
!
test_float_asFraction
	| t1 |
	t1 := 7.5 asFraction.
	self
		assert: t1
		equals: 15 / 2
		delta: 0
!
(reader addMethod: 'tests')
!
test_float_ceiling
	| t1 |
	t1 := 7.5 ceiling.
	self assert: t1 equals: 8 delta: 0
!
(reader addMethod: 'tests')
!
test_float_floor
	| t1 |
	t1 := 7.5 floor.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_float_fractionPart
	| t1 |
	t1 := 7.5 fractionPart.
	self assert: t1 equals: 0.5 delta: 0.0
!
(reader addMethod: 'tests')
!
test_float_integerPart
	| t1 |
	t1 := 7.5 integerPart.
	self assert: t1 equals: 7.0 delta: 0.0
!
(reader addMethod: 'tests')
!
test_float_rounded
	| t1 |
	t1 := 7.5 rounded.
	self assert: t1 equals: 8 delta: 0
!
(reader addMethod: 'tests')
!
test_float_truncated
	| t1 |
	t1 := 7.5 truncated.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_asFraction
	| t1 |
	t1 := (2 / 3) asFraction.
	self
		assert: t1
		equals: 2 / 3
		delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_ceiling
	| t1 |
	t1 := (2 / 3) ceiling.
	self assert: t1 equals: 1 delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_floor
	| t1 |
	t1 := (2 / 3) floor.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_fractionPart
	| t1 |
	t1 := (2 / 3) fractionPart.
	self
		assert: t1
		equals: 2 / 3
		delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_integerPart
	| t1 |
	t1 := (2 / 3) integerPart.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_rounded
	| t1 |
	t1 := (2 / 3) rounded.
	self assert: t1 equals: 1 delta: 0
!
(reader addMethod: 'tests')
!
test_fraction_truncated
	| t1 |
	t1 := (2 / 3) truncated.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_int_asFraction
	| t1 |
	t1 := 7 asFraction.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_int_ceiling
	| t1 |
	t1 := 7 ceiling.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_int_floor
	| t1 |
	t1 := 7 floor.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_int_fractionPart
	| t1 |
	t1 := 7 fractionPart.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_int_integerPart
	| t1 |
	t1 := 7 integerPart.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_int_rounded
	| t1 |
	t1 := 7 rounded.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_int_truncated
	| t1 |
	t1 := 7 truncated.
	self assert: t1 equals: 7 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_asFraction
	| t1 |
	t1 := 0 asFraction.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_ceiling
	| t1 |
	t1 := 0 ceiling.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_floor
	| t1 |
	t1 := 0 floor.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_fractionPart
	| t1 |
	t1 := 0 fractionPart.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_integerPart
	| t1 |
	t1 := 0 integerPart.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_rounded
	| t1 |
	t1 := 0 rounded.
	self assert: t1 equals: 0 delta: 0
!
(reader addMethod: 'tests')
!
test_zero_truncated
	| t1 |
	t1 := 0 truncated.
	self assert: t1 equals: 0 delta: 0
!
(reader addClassMethod: 'As yet unclassified')
!
generate
	| selectors values |
	selectors := #(#ceiling #floor #rounded #truncated #fractionPart #integerPart #asFraction).
	values := (Core.Dictionary new)
				at: #float put: 7.5;
				at: #double put: 100.5000003d;
				at: #fixed put: 2.5s;
				at: #fraction put: 2 / 3;
				at: #int put: 7;
				at: #big put: 251172765292171600923361522612285166173;
				at: #zero put: 0;
				yourself.
	values keysAndValuesDo: 
			[:test :value |
			selectors do: [:selector | self generateTest: test value: value selector: selector]]
!
(reader addClassMethod: 'As yet unclassified')
!
generateTest: nameSymbol value: valueString selector: selector
	| resultValue renamedSelector delta testSelector |
	resultValue := valueString perform: selector.
	delta := (resultValue isZero not and: [resultValue isKindOf: Core.LimitedPrecisionReal])
				ifTrue: 
					[((Smalltalk.Compiler evaluate: resultValue printString) - resultValue) abs asFloat * 2]
				ifFalse: [0].
	renamedSelector := (SP.SelectorConverter selectorAsFunctionName: selector)
				reject: [:e | e = $$].
	testSelector := ('test_' , nameSymbol , '_' , renamedSelector) asSymbol.
	self formatAndCompile: (Pegon.PMethodBuilder selector: testSelector
				do: 
					[:builder |
					builder
						nextPut: (builder addTemporary assign: (valueString asProgramNode send: selector)).
					builder nextPut: ('self' asVariable
								_assert: builder temporary
								_equals: resultValue asProgramNode
								_delta: delta)])
		classified: #tests
!
