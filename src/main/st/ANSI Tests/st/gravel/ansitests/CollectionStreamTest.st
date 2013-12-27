(reader defineClass: 'CollectionStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_contents
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue contents.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 'fromage' readStream
!
