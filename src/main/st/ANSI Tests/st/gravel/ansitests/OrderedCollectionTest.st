(reader defineClass: 'OrderedCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterIndex
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterTarget
	^1
!
(reader addMethod: 'tests')
!
test_addAllFirst_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAllFirst: self parameterNewElements]
!
(reader addMethod: 'tests')
!
test_addAllLast_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAllLast: self parameterNewElements.
			self assert: res = self parameterNewElements]
!
(reader addMethod: 'tests')
!
test_addAll_afterIndex_
	| oc |
	oc := #(#a #b #c) asOrderedCollection.
	oc addAll: #(#x #y #z) afterIndex: 2.
	self assert: oc asArray = #(#a #b #x #y #z #c)
!
(reader addMethod: 'tests')
!
test_addAll_after_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAll: self parameterNewElements after: self parameterTarget]
!
(reader addMethod: 'tests')
!
test_addAll_beforeIndex_
	| oc |
	oc := #(#a #b #c) asOrderedCollection.
	oc addAll: #(#x #y #z) beforeIndex: 2.
	self assert: oc asArray = #(#a #x #y #z #b #c)
!
(reader addMethod: 'tests')
!
test_addAll_before_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAll: self parameterNewElements before: self parameterTarget]
!
(reader addMethod: 'tests')
!
test_addFirst_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addFirst: self parameterNewElement]
!
(reader addMethod: 'tests')
!
test_addLast_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addLast: self parameterNewElement]
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
test_add_afterIndex_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement afterIndex: self parameterIndex.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_add_after_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement after: self parameterTarget.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_add_beforeIndex_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement beforeIndex: self parameterIndex.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_add_before_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement before: self parameterTarget.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (OrderedCollection with: 1)
!
