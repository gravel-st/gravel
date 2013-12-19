(reader defineClass: 'ScaleConstraint' superclass: 'st.gravel.test.deltablue.BinaryConstraint')
!
(reader addInstVar: 'scale')
!
(reader addInstVar: 'offset')
!
(reader addMethod: 'gravel')
!
addToGraph
	v1 addConstraint: self.
	v2 addConstraint: self.
	scale addConstraint: self.
	offset addConstraint: self.
	direction := nil
!
(reader addMethod: 'gravel')
!
execute
	direction == #forward
		ifTrue: [v2 value: v1 value * scale value + offset value]
		ifFalse: [v1 value: (v2 value - offset value) // scale value]
!
(reader addMethod: 'gravel')
!
inputsDo: aBlock
	direction == #forward
		ifTrue: 
			[aBlock
				value: v1;
				value: scale;
				value: offset]
		ifFalse: 
			[aBlock
				value: v2;
				value: scale;
				value: offset]
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
			[out := v1.
			in := v2].
	out walkStrength: (strength weakest: in walkStrength).
	out stay: (in stay and: [scale stay and: [offset stay]]).
	out stay ifTrue: [self execute]
!
(reader addMethod: 'gravel')
!
removeFromGraph
	v1 == nil ifFalse: [v1 removeConstraint: self].
	v2 == nil ifFalse: [v2 removeConstraint: self].
	scale == nil ifFalse: [scale removeConstraint: self].
	offset == nil ifFalse: [offset removeConstraint: self].
	direction := nil
!
(reader addMethod: 'gravel')
!
src: srcVar scale: scaleVar offset: offsetVar dst: dstVar strength: strengthSymbol
	strength := Strength of: strengthSymbol.
	v1 := srcVar.
	v2 := dstVar.
	scale := scaleVar.
	offset := offsetVar.
	direction := nil.
	self addConstraint
!
(reader addClassMethod: 'gravel')
!
var: src var: scale var: offset var: dst strength: strengthSymbol
	^self new
		src: src
		scale: scale
		offset: offset
		dst: dst
		strength: strengthSymbol
!
