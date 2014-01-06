(reader defineTrait: 'Dictionary' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Removable class')
!
(reader addMethod: 'accessing')
!
add: anAssociation
	self at: anAssociation key put: anAssociation value.
	^anAssociation
!
(reader addMethod: 'accessing')
!
addAll: aCollection
	aCollection addToDictionary: self.
	^aCollection
!
(reader addMethod: 'private')
!
addToDictionary: aDictionary
	self keysAndValuesDo: [:k :v | aDictionary at: k put: v]
!
(reader addMethod: 'As yet unclassified')
!
asJavaMap
	| dict |
	dict := JavaHashMap new.
	self keysAndValuesDo: [:k :v | dict at: k put: v].
	^dict
!
(reader addMethod: 'accessing')
!
at: key ifAbsent: aBlock
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
at: key ifAbsentPut: valueBlock
	^self at: key ifAbsent: [self at: key put: valueBlock value]
!
(reader addMethod: 'accessing')
!
at: key put: value
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isDictionary
	^true
!
(reader addMethod: 'requirements')
!
keysAndValuesDo: aBlock
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
removeAllKeys: keys
	keys do: [:k | self removeKey: k]
!
(reader addMethod: 'accessing')
!
removeAllKeys: keys ifAbsent: aBlock
	keys do: [:k | self removeKey: k ifAbsent: aBlock]
!
(reader addMethod: 'accessing')
!
removeKey: key
	^self removeKey: key ifAbsent: [self errorKeyNotFound: key]
!
(reader addMethod: 'accessing')
!
removeKey: key ifAbsent: aBlock
	^self traitRequirement
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^DictionaryImpl
!
