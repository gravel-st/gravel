(reader defineTrait: 'Set' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.AddableCollection class')
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
