(reader defineTrait: 'SortedCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Removable class')
!
(reader addMethod: 'copying')
!
copyReplaceAll: oldSubCollection with: newSubCollection
	^(self asArray copyReplaceAll: oldSubCollection with: newSubCollection)
		asSortedCollection: self sortBlock
!
(reader addMethod: 'copying')
!
copyReplaceFrom: start to: stop with: replacementCollection
	^(self asArray copyReplaceFrom: start to: stop with: replacementCollection)
		asSortedCollection: self sortBlock
!
(reader addMethod: 'copying')
!
copyReplaceFrom: start to: stop withObject: replacementElement
	^(self asArray copyReplaceFrom: start to: stop withObject: replacementElement)
		asSortedCollection: self sortBlock
!
(reader addMethod: 'copying')
!
copyReplacing: sourceElement withObject: destElement
	^(self asArray replaceAll: sourceElement with: destElement)
		asSortedCollection: self sortBlock
!
(reader addMethod: 'gravel')
!
copySpecies
	^OrderedCollection
!
(reader addMethod: 'copying')
!
copyWithAll: aCollection
	^(self copy)
		addAll: aCollection;
		yourself
!
(reader addMethod: 'testing')
!
isSortedCollection
	^true
!
(reader addMethod: 'gravel')
!
reSort
	self traitRequirement
!
(reader addMethod: 'accessing')
!
sortBlock
	^self traitRequirement
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^SortedCollectionImpl
!
(reader addClassMethod: 'As yet unclassified')
!
sortBlock: aBlock
	^self defaultImplementation sortBlock: aBlock
!
