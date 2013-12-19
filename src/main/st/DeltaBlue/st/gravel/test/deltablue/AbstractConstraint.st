(reader defineClass: 'AbstractConstraint' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'strength')
!
(reader addMethod: 'gravel')
!
addConstraint
	self addToGraph.
	Planner current incrementalAdd: self
!
(reader addMethod: 'gravel')
!
addToGraph
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
chooseMethod: mark
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
destroyConstraint
	self isSatisfied ifTrue: [Planner current incrementalRemove: self].
	self removeFromGraph.
	self release
!
(reader addMethod: 'gravel')
!
execute
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
inputsDo: aBlock
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
inputsKnown: mark
	self
		inputsDo: [:v | (v mark = mark or: [v stay or: [v determinedBy == nil]]) ifFalse: [^false]].
	^true
!
(reader addMethod: 'gravel')
!
isInput
	^false
!
(reader addMethod: 'gravel')
!
isSatisfied
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
longPrintOn: aStream
	| bindings |
	aStream nextPut: $(.
	self shortPrintOn: aStream.
	aStream
		space;
		nextPutAll: self strength printString.
	self isSatisfied
		ifTrue: 
			[aStream
				cr;
				space;
				space;
				space.
			self inputsDo: [:in | aStream nextPutAll: 'v' , in asOop printString , ' '].
			aStream nextPutAll: '-> '.
			aStream nextPutAll: 'v' , self output asOop printString]
		ifFalse: 
			[aStream
				space;
				nextPutAll: 'UNSATISFIED'].
	aStream
		nextPut: $);
		cr
!
(reader addMethod: 'gravel')
!
markUnsatisfied
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
output
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self shortPrintOn: aStream
!
(reader addMethod: 'gravel')
!
recalculate
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
removeFromGraph
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
satisfy: mark
	| overridden out |
	self chooseMethod: mark.
	self isSatisfied
		ifTrue: 
			[self inputsDo: [:in | in mark: mark].
			out := self output.
			overridden := out determinedBy.
			overridden == nil ifFalse: [overridden markUnsatisfied].
			out determinedBy: self.
			(Planner current addPropagate: self mark: mark)
				ifFalse: 
					[self
						notify: ('Cycle encountered adding:\   ' , self printString , '\Constraint removed.')
								withCRs.
					^nil].
			out mark: mark]
		ifFalse: 
			[overridden := nil.
			(strength sameAs: Strength required)
				ifTrue: [self notify: 'Failed to satisfy a required constraint']].
	^overridden
!
(reader addMethod: 'gravel')
!
shortPrintOn: aStream
	aStream nextPutAll: self class name , '(' , self asOop printString , ')'
!
(reader addMethod: 'gravel')
!
strength
	^strength
!
(reader addMethod: 'gravel')
!
strength: strengthSymbol
	strength := Strength of: strengthSymbol
!
