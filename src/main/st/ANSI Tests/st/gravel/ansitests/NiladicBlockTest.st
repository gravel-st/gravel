(reader defineClass: 'NiladicBlockTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_ensure_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ensure: self parameterTerminationBlock.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_ifCurtailed_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ifCurtailed: self parameterTerminationBlock.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_on_do_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue on: self parameterSelector do: self parameterAction.
			self assert: (self valueIsKindOfANY: res)]
!
