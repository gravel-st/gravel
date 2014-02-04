(reader defineClass: 'VariableToHolderRewriter' superclass: 'st.gravel.support.compiler.ast.NodeCopier')
!
(reader addInstVar: 'varName' type: 'String')
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {Str} {^Self}
	varName := aString.
	self initialize
!
(reader addMethod: 'accessing')
!
varName {^Str}
	^varName
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject {AssignmentNode} {^Expression}
	anObject varName = varName
		ifTrue: [^WriteHolderNode varName: varName value: (self visit: anObject value)].
	^AssignmentNode variable: (self visit: anObject variable)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitSequenceNode: anObject {SequenceNode} {^SequenceNode}
	| found {OrderedCollection[VariableDeclarationNode]} stmts {Arr[Statement]} temporaries {Arr[VariableDeclarationNode]} |
	found := OrderedCollection new.
	stmts := anObject statements collect: [:each {Statement} | self visit: each].
	temporaries := anObject temporaries collect: 
					[:each {VariableDeclarationNode} |
					| newDecl {VariableDeclarationNode} |
					each name = varName
						ifTrue: 
							[found add: each.
							newDecl := HolderDeclarationNode name: each name type: (self visit: each type)]
						ifFalse: [newDecl := self visit: each].
					newDecl].
	found isEmpty
		ifFalse: 
			[stmts := stmts copyWithFirst: (AssignmentNode variable: (VariableNode name: varName)
								value: CreateHolderNode new)].
	^SequenceNode temporaries: temporaries statements: stmts
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	anObject name = varName ifTrue: [^ReadHolderNode varName: varName].
	^VariableNode name: anObject name
!
(reader addClassMethod: 'instance creation')
!
varName: aString {Str} {^VariableToHolderRewriter}
	^self new initializeVarName: aString
!
