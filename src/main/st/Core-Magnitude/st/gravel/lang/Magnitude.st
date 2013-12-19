(reader defineClass: 'Magnitude' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addMethod: 'gravel')
!
< aMagnitude
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
asString
	^self printString
!
