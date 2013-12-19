(reader defineClass: 'Planner' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'currentMark')
!
(reader addClassInstVar: 'currentPlanner')
!
(reader addMethod: 'gravel')
!
addConstraintsConsuming: v to: aCollection
	| determiningC |
	determiningC := v determinedBy.
	v constraints
		do: [:c | (c == determiningC or: [c isSatisfied not]) ifFalse: [aCollection add: c]]
!
(reader addMethod: 'gravel')
!
addPropagate: c mark: mark
	| todo d |
	todo := OrderedCollection with: c.
	[todo isEmpty] whileFalse: 
			[d := todo removeFirst.
			d output mark = mark
				ifTrue: 
					[self incrementalRemove: c.
					^false].
			d recalculate.
			self addConstraintsConsuming: d output to: todo].
	^true
!
(reader addMethod: 'gravel')
!
changeVar: aVariable newValue: newValue
	| editConstraint plan |
	editConstraint := EditConstraint var: aVariable strength: #preferred.
	plan := self extractPlanFromConstraints: (Array with: editConstraint).
	10 timesRepeat: 
			[aVariable value: newValue.
			plan execute].
	editConstraint destroyConstraint
!
(reader addMethod: 'gravel')
!
constraintsConsuming: v do: aBlock
	| determiningC |
	determiningC := v determinedBy.
	v constraints
		do: [:c | (c == determiningC or: [c isSatisfied not]) ifFalse: [aBlock value: c]]
!
(reader addMethod: 'gravel')
!
extractPlanFromConstraints: constraints
	| sources |
	sources := OrderedCollection new.
	constraints do: [:c | (c isInput and: [c isSatisfied]) ifTrue: [sources add: c]].
	^self makePlan: sources
!
(reader addMethod: 'gravel')
!
extractPlanFromVariables: variables
	| sources |
	sources := OrderedCollection new.
	variables
		do: [:v | v constraints do: [:c | (c isInput and: [c isSatisfied]) ifTrue: [sources add: c]]].
	^self makePlan: sources
!
(reader addMethod: 'gravel')
!
incrementalAdd: c
	| mark overridden |
	mark := self newMark.
	overridden := c satisfy: mark.
	[overridden == nil] whileFalse: [overridden := overridden satisfy: mark]
!
(reader addMethod: 'gravel')
!
incrementalRemove: c
	| out unsatisfied |
	out := c output.
	c markUnsatisfied.
	c removeFromGraph.
	unsatisfied := self removePropagateFrom: out.
	unsatisfied do: [:u | self incrementalAdd: u]
!
(reader addMethod: 'gravel')
!
initialize
	currentMark := 1
!
(reader addMethod: 'gravel')
!
makePlan: sources
	| mark plan todo c |
	mark := self newMark.
	plan := Plan new.
	todo := sources.
	[todo isEmpty] whileFalse: 
			[c := todo removeFirst.
			(c output mark ~= mark and: [c inputsKnown: mark])
				ifTrue: 
					[plan addLast: c.
					c output mark: mark.
					self addConstraintsConsuming: c output to: todo]].
	^plan
!
(reader addMethod: 'gravel')
!
newMark
	^currentMark := currentMark + 1
!
(reader addMethod: 'gravel')
!
propagateFrom: v
	| todo c |
	todo := OrderedCollection new.
	self addConstraintsConsuming: v to: todo.
	[todo isEmpty] whileFalse: 
			[c := todo removeFirst.
			c execute.
			self addConstraintsConsuming: c output to: todo]
!
(reader addMethod: 'gravel')
!
removePropagateFrom: out
	| unsatisfied todo v nextC |
	unsatisfied := SortedCollection sortBlock: [:c1 :c2 | c1 strength stronger: c2 strength].
	out determinedBy: nil.
	out walkStrength: Strength absoluteWeakest.
	out stay: true.
	todo := OrderedCollection with: out.
	[todo isEmpty] whileFalse: 
			[v := todo removeFirst.
			v constraints do: [:c | c isSatisfied ifFalse: [unsatisfied add: c]].
			self constraintsConsuming: v
				do: 
					[:c |
					c recalculate.
					todo add: c output]].
	^unsatisfied
!
(reader addClassMethod: 'gravel')
!
chainTest: n
	| vars editConstraint plan planner |
	planner := Planner new.
	vars := (1 to: n + 1) collect: [:i | Variable new].
	1 to: n
		do: 
			[:i |
			| v1 v2 |
			v1 := vars at: i.
			v2 := vars at: i + 1.
			EqualityConstraint var: v1 var: v2 strength: #required].
	StayConstraint var: vars last strength: #strongDefault.
	editConstraint := EditConstraint var: vars first strength: #preferred.
	plan := planner extractPlanFromConstraints: (Array with: editConstraint).
	1 to: 100
		do: 
			[:v |
			vars first value: v.
			plan execute.
			vars last value ~= v ifTrue: [self error: 'Chain test failed!']].
	editConstraint destroyConstraint
!
(reader addClassMethod: 'gravel')
!
current
	^currentPlanner
!
(reader addClassMethod: 'gravel')
!
longBenchmark
	self
		report: 'Chain and projection tests'
		times: 10
		run: 
			[self chainTest: 20000.
			self projectionTest: 20000]
!
(reader addClassMethod: 'gravel')
!
new
	^currentPlanner := super new initialize
!
(reader addClassMethod: 'gravel')
!
projectionTest: n
	| scale offset src dst planner dests |
	planner := Planner new.
	dests := OrderedCollection new.
	scale := Variable value: 10.
	offset := Variable value: 1000.
	1 to: n
		do: 
			[:i |
			src := Variable value: i.
			dst := Variable value: i.
			dests add: dst.
			StayConstraint var: src strength: #default.
			ScaleConstraint
				var: src
				var: scale
				var: offset
				var: dst
				strength: #required].
	planner changeVar: src newValue: 17.
	dst value ~= 1170 ifTrue: [self error: 'Projection test 1 failed!'].
	planner changeVar: dst newValue: 1050.
	src value ~= 5 ifTrue: [self error: 'Projection test 2 failed!'].
	planner changeVar: scale newValue: 5.
	1 to: n - 1
		do: [:i | (dests at: i) value ~= (i * 5 + 1000) ifTrue: [self error: 'Projection test 3 failed!']].
	planner changeVar: offset newValue: 2000.
	1 to: n - 1
		do: [:i | (dests at: i) value ~= (i * 5 + 2000) ifTrue: [self error: 'Projection test 4 failed!']]
!
(reader addClassMethod: 'gravel')
!
report: string times: count run: aBlock
	| time |
	time := Time millisecondsToRun: [count timesRepeat: aBlock].
	Transcript
		show: string , ' ' , (time // count) printString , ' milliseconds';
		cr
!
(reader addClassMethod: 'gravel')
!
standardBenchmark
	self
		report: 'Chain and projection tests'
		times: 100
		run: 
			[self chainTest: 100.
			self projectionTest: 100]
!
