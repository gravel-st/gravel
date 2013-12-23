(reader defineClass: 'ClassDescriptionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_allSubclasses
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue allSubclasses]
!
(reader addMethod: 'tests')
!
test_allSuperclasses
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue allSuperclasses.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_name
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue name.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_subclasses
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue subclasses.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_superclass
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue superclass.
			self assert: (self valueIsKindOfClassDescription: res).
			self assert: (self valueIsKindOfNil: res)]
!
