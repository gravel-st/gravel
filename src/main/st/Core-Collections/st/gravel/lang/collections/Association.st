(reader defineTrait: 'Association' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addMethod: 'As yet unclassified')
!
key
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
value
	^self traitRequirement
!
(reader addClassMethod: 'instance creation')
!
key: key value: value
	^AssociationImpl key: key value: value
!
