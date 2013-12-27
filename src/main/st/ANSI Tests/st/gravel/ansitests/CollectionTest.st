(reader defineClass: 'CollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
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
parameterInitialValue
	^nil
!
(reader addMethod: 'As yet unclassified')
!
parameterOperation
	^[:each | each printString]
!
(reader addMethod: 'As yet unclassified')
!
parameterSeparator
	^[1 + 2]
!
(reader addMethod: 'As yet unclassified')
!
parameterTarget
	^Object new
!
(reader addMethod: 'tests')
!
test_allSatisfy_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue allSatisfy: self parameterDiscriminator.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_anySatisfy_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue anySatisfy: self parameterDiscriminator.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_asArray
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asArray.
			self assert: (self valueIsKindOfArray: res)]
!
(reader addMethod: 'tests')
!
test_asBag
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asBag.
			self assert: (self valueIsKindOfBag: res)]
!
(reader addMethod: 'tests')
!
test_asByteArray
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asByteArray.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_asOrderedCollection
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asOrderedCollection.
			self assert: (self valueIsKindOfOrderedCollection: res)]
!
(reader addMethod: 'tests')
!
test_asSet
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSet.
			self assert: (self valueIsKindOfSet: res)]
!
(reader addMethod: 'tests')
!
test_asSortedCollection
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSortedCollection.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_asSortedCollection_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSortedCollection: self parameterSortBlock.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue collect: self parameterTransformer.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_detect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue detect: self parameterDiscriminator.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_detect_ifNone_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue detect: self parameterDiscriminator
						ifNone: self parameterExceptionHandler.
			self assert: (self valueIsKindOfObject: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_do_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue do: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_do_separatedBy_
	self
		valuesDo: [:testValue | testValue do: self parameterOperation separatedBy: self parameterSeparator]
!
(reader addMethod: 'tests')
!
test_includes_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue includes: self parameterTarget.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_inject_into_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue inject: self parameterInitialValue
						into: [:s :e | s isNil ifTrue: [e] ifFalse: [s + e]].
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_isEmpty
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isEmpty.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_notEmpty
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue notEmpty.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_occurrencesOf_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue occurrencesOf: self parameterTarget.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_rehash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue rehash]
!
(reader addMethod: 'tests')
!
test_reject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reject: self parameterDiscriminator.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_select_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue select: self parameterDiscriminator.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_size
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue size.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (OrderedCollection with: 1 with: 255).
	aBlock value: (Set with: 1)
!
