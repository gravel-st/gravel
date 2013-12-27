(reader defineClass: 'SymbolTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #foo.
	aBlock value: #'Altijd is kortjakje ziek'
!
