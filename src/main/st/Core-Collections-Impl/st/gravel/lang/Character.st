(reader extendTrait: 'Character')
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addMethod: 'printing')
!
putOnStringBuilder: aJavaStringBuilder
	^self traitRequirement
!
