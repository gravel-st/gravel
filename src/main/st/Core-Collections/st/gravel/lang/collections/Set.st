(reader defineTrait: 'Set' superclass: nil)
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
(reader addMethod: 'testing')
!
isSet
	^true
!
(reader addMethod: 'accessing')
!
occurrencesOf: anObject
	^(self includes: anObject) ifTrue: [1] ifFalse: [0]
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^SetImpl
!
