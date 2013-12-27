(reader defineClass: 'FloatCharacterizationTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_denormalized
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue denormalized.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_e
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue e.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_emax
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue emax.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_emin
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue emin.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_epsilon
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue epsilon.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_fmax
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue fmax.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_fmin
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue fmin.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_fminDenormalized
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue fminDenormalized.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_fminNormalized
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue fminNormalized.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_pi
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue pi.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_precision
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue precision.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_radix
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue radix.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Float
!
