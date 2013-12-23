(reader defineClass: 'AbstractDictionaryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'As yet unclassified')
!
parameterDictionary
	^Dictionary new
!
(reader addMethod: 'tests')
!
parameterDiscriminator
	^[:each | true]
!
(reader addMethod: 'As yet unclassified')
!
parameterKey
	^#fromage
!
(reader addMethod: 'tests')
!
test_addAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue addAll: self parameterDictionary]
!
(reader addMethod: 'tests')
!
test_at_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_ifAbsentPut_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey ifAbsentPut: self parameterOperation.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey ifAbsent: self parameterOperation.
			self assert: (self valueIsKindOfANY: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_put_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterNewElement put: self parameterKey.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue collect: self parameterTransformer.
			self assert: (self valueIsKindOfAbstractDictionary: res)]
!
(reader addMethod: 'tests')
!
test_includesKey_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue includesKey: self parameterKey.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_keyAtValue_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keyAtValue: self parameterValue.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_keyAtValue_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keyAtValue: self parameterValue ifAbsent: self parameterOperation.
			self assert: (self valueIsKindOfANY: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_keys
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keys.
			self assert: (self valueIsKindOfCollection: res)]
!
(reader addMethod: 'tests')
!
test_keysAndValuesDo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keysAndValuesDo: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_keysDo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keysDo: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_reject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reject: self parameterDiscriminator.
			self assert: (self valueIsKindOfAbstractDictionary: res)]
!
(reader addMethod: 'tests')
!
test_removeAllKeys_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeAllKeys: self parameterKeys]
!
(reader addMethod: 'tests')
!
test_removeAllKeys_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeAllKeys: self parameterKeys ifAbsent: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_removeKey_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeKey: self parameterKey.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_removeKey_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeKey: self parameterOperation ifAbsent: self parameterKey.
			self assert: (self valueIsKindOfANY: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_select_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue select: self parameterDiscriminator.
			self assert: (self valueIsKindOfAbstractDictionary: res)]
!
(reader addMethod: 'tests')
!
test_values
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue values.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
valuesDo: aBlock
	aBlock value: Dictionary new
!
