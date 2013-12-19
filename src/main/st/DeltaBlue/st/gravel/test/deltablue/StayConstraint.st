(reader defineClass: 'StayConstraint' superclass: 'st.gravel.test.deltablue.UnaryConstraint')
!
(reader addMethod: 'gravel')
!
execute
	
!
(reader addClassMethod: 'gravel')
!
var: aVariable strength: strengthSymbol
	^self new var: aVariable strength: strengthSymbol
!
