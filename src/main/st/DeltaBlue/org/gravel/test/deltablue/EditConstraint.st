(reader defineClass: 'EditConstraint' superclass: 'org.gravel.test.deltablue.UnaryConstraint')
!
(reader addMethod: 'gravel')
!
execute
	
!
(reader addMethod: 'gravel')
!
isInput
	^true
!
(reader addClassMethod: 'gravel')
!
var: aVariable strength: strengthSymbol
	^self new var: aVariable strength: strengthSymbol
!
