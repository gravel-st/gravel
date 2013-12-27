(reader defineClass: 'NiladicBlockTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterAction
	^[:ex | ]
!
(reader addMethod: 'As yet unclassified')
!
parameterSelector
	^Error
!
(reader addMethod: 'As yet unclassified')
!
parameterTerminationBlock
	^[]
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: [3 + 4]
!
