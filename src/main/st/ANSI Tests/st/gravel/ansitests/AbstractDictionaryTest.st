(reader defineClass: 'AbstractDictionaryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
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
	| key value |
	self valuesDo: 
			[:testValue |
			| res |
			key := self parameterKey.
			value := self parameterNewElement.
			testValue at: key put: value.
			res := testValue at: key.
			self assert: res == value.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_ifAbsentPut_
	| n |
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey ifAbsentPut: [n := Object new].
			self assert: res == n.
			self assert: (testValue at: self parameterKey) == n.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_ifAbsent_
	| n |
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey ifAbsent: [n := Object new].
			self assert: res == n.
			self deny: (testValue includesKey: self parameterKey).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_put_
	| n |
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterKey put: (n := self parameterNewElement).
			self assert: (testValue at: self parameterKey) == n.
			self assert: res == n.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			res := testValue collect: [:e | e printString].
			self assert: (res at: #foo) = '1'.
			self assert: (self valueIsKindOfAbstractDictionary: res)]
!
(reader addMethod: 'tests')
!
test_includesKey_
	self valuesDo: 
			[:testValue |
			testValue at: #foo put: 1.
			self assert: (testValue includesKey: #foo).
			self deny: (testValue includesKey: #bar)]
!
(reader addMethod: 'tests')
!
test_keyAtValue_
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			res := testValue keyAtValue: 1.
			self assert: res = #foo]
!
(reader addMethod: 'tests')
!
test_keyAtValue_ifAbsent_
	| n |
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			res := testValue keyAtValue: 1 ifAbsent: [Object new].
			self assert: res = #foo.
			res := testValue keyAtValue: 2 ifAbsent: [n := Object new].
			self assert: res = n.
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
			self assert: res isEmpty.
			testValue at: #foo put: #bar.
			res := testValue keys.
			self assert: res size = 1]
!
(reader addMethod: 'tests')
!
test_keysAndValuesDo_
	self valuesDo: 
			[:testValue |
			| res blockRuns |
			testValue at: #foo put: #bar.
			blockRuns := 0.
			res := testValue keysAndValuesDo: 
							[:k :v |
							self assert: k = #foo.
							self assert: v = #bar.
							blockRuns := blockRuns + 1].
			self assert: blockRuns = 1.
			self assert: res == testValue]
!
(reader addMethod: 'tests')
!
test_keysDo_
	self valuesDo: 
			[:testValue |
			| res blockRuns |
			testValue at: #foo put: #bar.
			blockRuns := 0.
			res := testValue keysDo: 
							[:k |
							self assert: k = #foo.
							blockRuns := blockRuns + 1].
			self assert: blockRuns = 1.
			self assert: res == testValue]
!
(reader addMethod: 'tests')
!
test_reject_
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			res := testValue reject: [:e | e even].
			self assert: (res includesKey: #foo).
			self deny: (res includesKey: #bar).
			self assert: (self valueIsKindOfAbstractDictionary: res)]
!
(reader addMethod: 'tests')
!
test_removeAllKeys_
	self valuesDo: 
			[:testValue |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			testValue at: #baz put: 3.
			testValue removeAllKeys: #(#foo #bar).
			self deny: (testValue includesKey: #foo).
			self deny: (testValue includesKey: #bar).
			self assert: (testValue includesKey: #baz).
			self assert: testValue size = 1]
!
(reader addMethod: 'tests')
!
test_removeAllKeys_ifAbsent_
	self valuesDo: 
			[:testValue |
			| blockRuns |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			testValue at: #baz put: 3.
			blockRuns := 0.
			testValue removeAllKeys: #(#foo #bar #zuurkool) ifAbsent: [blockRuns := blockRuns + 1].
			self deny: (testValue includesKey: #foo).
			self deny: (testValue includesKey: #bar).
			self assert: (testValue includesKey: #baz).
			self assert: testValue size = 1.
			self assert: blockRuns = 1]
!
(reader addMethod: 'tests')
!
test_removeKey_
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			res := testValue removeKey: #foo.
			self assert: res = 1.
			self deny: (testValue includesKey: #foo).
			self assert: (testValue includesKey: #bar)]
!
(reader addMethod: 'tests')
!
test_removeKey_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res n |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			res := testValue removeKey: #foo ifAbsent: [Object new].
			self assert: res = 1.
			self deny: (testValue includesKey: #foo).
			self assert: (testValue includesKey: #bar).
			res := testValue removeKey: #fromage ifAbsent: [n := Object new].
			self assert: res == n]
!
(reader addMethod: 'tests')
!
test_select_
	self valuesDo: 
			[:testValue |
			| res |
			testValue at: #foo put: 1.
			testValue at: #bar put: 2.
			res := testValue select: [:e | e even].
			self deny: (res includesKey: #foo).
			self assert: (res includesKey: #bar).
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
	aBlock value: Dictionary new.
	aBlock value: IdentityDictionary new
!
