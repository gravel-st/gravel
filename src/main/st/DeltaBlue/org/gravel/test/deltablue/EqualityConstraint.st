(reader defineClass: 'EqualityConstraint' superclass: 'org.gravel.test.deltablue.BinaryConstraint')
!
(reader addMethod: 'gravel')
!
execute
	direction == #forward ifTrue: [v2 value: v1 value] ifFalse: [v1 value: v2 value]
!
(reader addClassMethod: 'gravel')
!
var: variable1 var: variable2 strength: strengthSymbol
	^self new var: variable1 var: variable2 strength: strengthSymbol
!
