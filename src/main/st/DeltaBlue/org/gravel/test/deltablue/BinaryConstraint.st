(reader defineClass: 'BinaryConstraint' superclass: 'org.gravel.test.deltablue.AbstractConstraint')
!
(reader addInstVar: 'v1')
!
(reader addInstVar: 'v2')
!
(reader addInstVar: 'direction')
!
(reader addMethod: 'gravel')
!
addToGraph
	v1 addConstraint: self.
	v2 addConstraint: self.
	direction := nil
!
(reader addMethod: 'gravel')
!
chooseMethod: mark
	v1 mark == mark
		ifTrue: 
			[(v2 mark ~= mark and: [strength stronger: v2 walkStrength])
				ifTrue: [^direction := #forward]
				ifFalse: [^direction := nil]].
	v2 mark == mark
		ifTrue: 
			[(v1 mark ~= mark and: [strength stronger: v1 walkStrength])
				ifTrue: [^direction := #backward]
				ifFalse: [^direction := nil]].
	(v1 walkStrength weaker: v2 walkStrength)
		ifTrue: 
			[(strength stronger: v1 walkStrength)
				ifTrue: [^direction := #backward]
				ifFalse: [^direction := nil]]
		ifFalse: 
			[(strength stronger: v2 walkStrength)
				ifTrue: [^direction := #forward]
				ifFalse: [^direction := nil]]
!
(reader addMethod: 'gravel')
!
execute
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
inputsDo: aBlock
	direction == #forward ifTrue: [aBlock value: v1] ifFalse: [aBlock value: v2]
!
(reader addMethod: 'gravel')
!
isSatisfied
	^direction notNil
!
(reader addMethod: 'gravel')
!
markUnsatisfied
	direction := nil
!
(reader addMethod: 'gravel')
!
output
	direction == #forward ifTrue: [^v2] ifFalse: [^v1]
!
(reader addMethod: 'gravel')
!
recalculate
	| in out |
	direction == #forward
		ifTrue: 
			[in := v1.
			out := v2]
		ifFalse: 
			[in := v2.
			out := v1].
	out walkStrength: (strength weakest: in walkStrength).
	out stay: in stay.
	out stay ifTrue: [self execute]
!
(reader addMethod: 'gravel')
!
removeFromGraph
	v1 == nil ifFalse: [v1 removeConstraint: self].
	v2 == nil ifFalse: [v2 removeConstraint: self].
	direction := nil
!
(reader addMethod: 'gravel')
!
var: variable1 var: variable2 strength: strengthSymbol
	strength := Strength of: strengthSymbol.
	v1 := variable1.
	v2 := variable2.
	direction := nil.
	self addConstraint
!
