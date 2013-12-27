(reader defineClass: 'ExtensibleCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterExceptionHandler
	^[Object new]
!
(reader addMethod: 'As yet unclassified')
!
parameterOldElement
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterOldElements
	^#(1)
!
(reader addMethod: 'tests')
!
test_addAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAll: self parameterNewElements]
!
(reader addMethod: 'tests')
!
test_add_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement]
!
(reader addMethod: 'tests')
!
test_removeAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeAll: self parameterOldElements]
!
(reader addMethod: 'tests')
!
test_remove_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue remove: self parameterOldElement.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_remove_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue remove: self parameterOldElement ifAbsent: self parameterExceptionHandler.
			self assert: (self valueIsKindOfObject: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (Set with: 1).
	aBlock value: (OrderedCollection with: 1)
!
