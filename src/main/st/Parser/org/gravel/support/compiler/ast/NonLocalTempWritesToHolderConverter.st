(reader defineClass: 'NonLocalTempWritesToHolderConverter' superclass: 'org.gravel.support.compiler.ast.NodeCopier')
!
(reader addInstVar: 'temps')
!
(reader addInstVar: 'parent')
!
(reader addMethod: 'As yet unclassified')
!
addBlockVariableRead: aString {Str} {^Self}
	(temps includesKey: aString)
		ifFalse: 
			[parent isNil ifTrue: [^self].
			parent addBlockVariableRead: aString.
			^self].
	temps at: aString put: (temps at: aString) withBlockRead
!
(reader addMethod: 'As yet unclassified')
!
addBlockVariableWrite: aString {Str} {^Self}
	(temps includesKey: aString)
		ifFalse: 
			[parent isNil ifTrue: [^self].
			parent addBlockVariableWrite: aString.
			^self].
	temps at: aString put: (temps at: aString) withBlockWrite
!
(reader addMethod: 'As yet unclassified')
!
addVariableRead: aString {Str} {^Self}
	(temps includesKey: aString)
		ifFalse: 
			[parent isNil ifTrue: [^self].
			parent addBlockVariableRead: aString.
			^self].
	temps at: aString put: (temps at: aString) withLocalRead
!
(reader addMethod: 'As yet unclassified')
!
addVariableWrite: aString {Str} {^Self}
	(temps includesKey: aString)
		ifFalse: 
			[parent isNil ifTrue: [^self].
			parent addBlockVariableWrite: aString.
			^self].
	temps at: aString put: (temps at: aString) withLocalWrite
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	temps := Dictionary new
!
(reader addMethod: 'initialize-release')
!
initializeParent: aVariableScopeAnalyzer {NonLocalTempWritesToHolderConverter | Nil} {^Self}
	parent := aVariableScopeAnalyzer.
	self initialize
!
(reader addMethod: 'accessing')
!
parent {^NonLocalTempWritesToHolderConverter | Nil}
	^parent
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject {AssignmentNode} {^Expression}
	self addVariableWrite: anObject variable name.
	^AssignmentNode variable: (VariableNode name: anObject variable name)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^BlockNode}
	| sub {NonLocalTempWritesToHolderConverter} |
	sub := NonLocalTempWritesToHolderConverter parent: self.
	^BlockNode
		arguments: (anObject arguments
				collect: [:each {VariableDeclarationNode} | sub visit: each])
		body: (sub visit: anObject body)
		returnType: (sub visit: anObject returnType)
!
(reader addMethod: 'visiting')
!
visitSequenceNode: anObject {SequenceNode} {^SequenceNode}
	| node {SequenceNode} |
	node := SequenceNode
				temporaries: (anObject temporaries collect: 
							[:each {VariableDeclarationNode} |
							temps at: each name put: VariableScopeAnalyzerStateDefined new.
							self visit: each])
				statements: (anObject statements collect: [:each {Statement} | self visit: each]).
	temps keysAndValuesDo: 
			[:varName {Str} :state {VariableScopeAnalyzerState} |
			state isUndecided
				ifTrue: [node := (VariableToHolderRewriter varName: varName) visit: node]].
	^node
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	self addVariableRead: anObject name.
	^VariableNode name: anObject name
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Dict[String, VariableScopeAnalyzerState], NonLocalTempWritesToHolderConverter | Nil]}
	^#('temps' 'parent')
!
(reader addClassMethod: 'instance creation')
!
parent: aVariableScopeAnalyzer {NonLocalTempWritesToHolderConverter | Nil} {^NonLocalTempWritesToHolderConverter}
	^self new initializeParent: aVariableScopeAnalyzer
!
