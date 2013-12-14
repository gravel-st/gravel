(reader defineClass: 'Plan' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'constraints')
!
(reader addMethod: 'gravel')
!
addLast: anObject
	constraints addLast: anObject
!
(reader addMethod: 'gravel')
!
execute
	constraints do: [:c | c execute]
!
(reader addMethod: 'gravel')
!
initialize
	constraints := OrderedCollection new
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
