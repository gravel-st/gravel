(reader defineClass: 'SymbolTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_asString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asString.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_asSymbol
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSymbol.
			self assert: (self valueIsKindOfSymbol: res)]
!
