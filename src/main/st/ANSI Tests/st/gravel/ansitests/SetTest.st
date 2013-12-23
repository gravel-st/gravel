(reader defineClass: 'SetTest' superclass: 'st.gravel.ansitests.ANSITest')
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
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue collect: self parameterTransformer.
			self assert: (self valueIsKindOfSet: res)]
!
