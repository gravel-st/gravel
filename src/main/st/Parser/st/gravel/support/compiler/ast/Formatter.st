(reader defineClass: 'Formatter' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
format: aNode {Node} {^Str}
	^self subclassResponsibility
!
