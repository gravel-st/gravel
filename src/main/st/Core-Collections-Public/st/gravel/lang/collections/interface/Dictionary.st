(reader defineTrait: 'Dictionary' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Collection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Collection class')
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
(reader addMethod: 'requirements')
!
keysAndValuesDo: aBlock
	^self traitRequirement
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^DictionaryImpl
!
