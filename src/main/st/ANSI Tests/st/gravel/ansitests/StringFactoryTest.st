(reader defineClass: 'StringFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterElement1
	^$a
!
(reader addMethod: 'As yet unclassified')
!
parameterElement2
	^$b
!
(reader addMethod: 'As yet unclassified')
!
parameterElement3
	^$c
!
(reader addMethod: 'As yet unclassified')
!
parameterElement4
	^$d
!
(reader addMethod: 'As yet unclassified')
!
parameterNewElements
	^#($a $b $c)
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_new_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new: self parameterCount.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_withAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue withAll: self parameterNewElements.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterElement1.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterElement1 with: self parameterElement2.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterElement2
						with: self parameterElement1
						with: self parameterElement3.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterElement2
						with: self parameterElement1
						with: self parameterElement3
						with: self parameterElement4.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: String
!
