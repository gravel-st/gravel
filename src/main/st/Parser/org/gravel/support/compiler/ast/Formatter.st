(reader defineClass: 'Formatter' superclass: 'org.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
format: aNode {Node} {^Str}
	^self subclassResponsibility
!
