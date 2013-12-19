(reader defineClass: 'UnaryConstraint' superclass: 'st.gravel.test.deltablue.AbstractConstraint')
!
(reader addInstVar: 'output')
!
(reader addInstVar: 'satisfied')
!
(reader addMethod: 'gravel')
!
addToGraph
	output addConstraint: self.
	satisfied := false
!
(reader addMethod: 'gravel')
!
chooseMethod: mark
	satisfied := output mark ~= mark and: [strength stronger: output walkStrength]
!
(reader addMethod: 'gravel')
!
execute
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
inputsDo: aBlock
	
!
(reader addMethod: 'gravel')
!
isSatisfied
	^satisfied
!
(reader addMethod: 'gravel')
!
markUnsatisfied
	satisfied := false
!
(reader addMethod: 'gravel')
!
output
	^output
!
(reader addMethod: 'gravel')
!
recalculate
	output walkStrength: strength.
	output stay: self isInput not.
	output stay ifTrue: [self execute]
!
(reader addMethod: 'gravel')
!
removeFromGraph
	output == nil ifFalse: [output removeConstraint: self].
	satisfied := false
!
(reader addMethod: 'gravel')
!
var: aVariable strength: strengthSymbol
	strength := Strength of: strengthSymbol.
	output := aVariable.
	satisfied := false.
	self addConstraint
!
