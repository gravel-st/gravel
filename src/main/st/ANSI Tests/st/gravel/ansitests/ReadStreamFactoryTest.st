(reader defineClass: 'ReadStreamFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterACollection
	^'abc'
!
(reader addMethod: 'tests')
!
test_on_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue on: self parameterACollection.
			self assert: (self valueIsKindOfReadStream: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: ReadStream
!
