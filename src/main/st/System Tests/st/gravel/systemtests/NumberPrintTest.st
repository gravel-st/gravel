(reader defineClass: 'NumberPrintTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_big_printString
	| value |
	value := 251172765292171600923361522612285166173.
	self assert: value printString equals: '251172765292171600923361522612285166173'
!
(reader addMethod: 'tests')
!
test_fixed_printString
	| value |
	value := 2.5s.
	self assert: value printString equals: '2.5s'
!
(reader addMethod: 'tests')
!
test_float_printString
	| value |
	value := 7.5.
	self assert: value printString equals: '7.5'
!
(reader addMethod: 'tests')
!
test_fraction_printString
	| value |
	value := 2 / 3.
	self assert: value printString equals: '(2 / 3)'
!
(reader addMethod: 'tests')
!
test_int_printString
	| value |
	value := 7.
	self assert: value printString equals: '7'
!
(reader addMethod: 'tests')
!
test_zero_printString
	| value |
	value := 0.
	self assert: value printString equals: '0'
!
(reader addClassMethod: 'As yet unclassified')
!
generate
	#(#float #fixed #fraction #int #big #zero) with: (Core.Array
				with: 7.5
				with: 2.5s
				with: 2 / 3
				with: 7
				with: 251172765292171600923361522612285166173
				with: 0)
		do: 
			[:an :num |
			| value |
			value := [num printString] on: Core.Error do: [:ex | ^self].
			self
				formatAndCompile: 'test_' , an , '_printString
	| value | value := ' , num printString
						, '.
self assert: value printString equals: ' , value storeString
				classified: 'tests']
!
