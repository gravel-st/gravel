(reader defineClass: 'AbstractVariableRenamer' superclass: 'st.gravel.support.compiler.ast.NodeCopierWithLocals')
!
(reader addInstVar: 'oldName' type: 'String')
!
(reader addInstVar: 'newName' type: 'String')
!
(reader addMethod: 'initialize-release')
!
initializeOldName: aString {Str} newName: aString2 {Str} {^Self}
	oldName := aString.
	newName := aString2.
	self initialize
!
(reader addMethod: 'accessing')
!
newName {^Str}
	^newName
!
(reader addMethod: 'accessing')
!
oldName {^Str}
	^oldName
!
(reader addMethod: 'visiting')
!
produceHolderDeclarationNode: anObject {HolderDeclarationNode} {^HolderDeclarationNode}
	^HolderDeclarationNode name: (self renameDefinition: anObject name)
		type: (self visit: anObject type)
!
(reader addMethod: 'visiting')
!
produceToDoNode: anObject {ToDoNode} {^ToDoNode}
	^ToDoNode
		start: (self visit: anObject start)
		stop: (self visit: anObject stop)
		step: (self visit: anObject step)
		counterName: (self renameDefinition: anObject counterName)
		doSequence: (self visit: anObject doSequence)
!
(reader addMethod: 'visiting')
!
produceVariableDeclarationNode: anObject {VariableDeclarationNode} {^VariableDeclarationNode}
	^VariableDeclarationNode name: (self renameDefinition: anObject name)
		type: (self visit: anObject type)
!
(reader addMethod: 'visiting')
!
rename: aString {Str} {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'visiting')
!
renameDefinition: aString {Str} {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'visiting')
!
visitFieldReadNode: anObject {FieldReadNode} {^FieldReadNode}
	^FieldReadNode owner: (self visit: anObject owner) field: (self rename: anObject field)
!
(reader addMethod: 'visiting')
!
visitFieldWriteNode: anObject {FieldWriteNode} {^FieldWriteNode}
	^FieldWriteNode
		owner: (self visit: anObject owner)
		field: (self rename: anObject field)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitGlobalReadNode: anObject {GlobalReadNode} {^GlobalReadNode}
	^GlobalReadNode namespace: anObject namespace name: (self rename: anObject name)
!
(reader addMethod: 'visiting')
!
visitGlobalWriteNode: anObject {GlobalWriteNode} {^GlobalWriteNode}
	^GlobalWriteNode
		namespace: anObject namespace
		name: (self rename: anObject name)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitLocalReadNode: anObject {LocalReadNode} {^LocalReadNode}
	^LocalReadNode name: (self rename: anObject name)
!
(reader addMethod: 'visiting')
!
visitLocalWriteNode: anObject {LocalWriteNode} {^LocalWriteNode}
	^LocalWriteNode name: (self rename: anObject name) value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^Statement}
	^NonLocalReturnNode marker: (self rename: anObject marker)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitReadHolderNode: anObject {ReadHolderNode} {^ReadHolderNode}
	^ReadHolderNode varName: (self rename: anObject varName)
!
(reader addMethod: 'visiting')
!
visitSelfNode: anObject {SelfNode} {^Expression}
	oldName = 'self' ifTrue: [^VariableNode name: newName].
	^anObject
!
(reader addMethod: 'visiting')
!
visitSuperNode: anObject {SuperNode} {^SuperNode}
	oldName = 'self' ifTrue: [self error: 'Cant rename super'].
	^super visitSuperNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	^VariableNode name: (self rename: anObject name)
!
(reader addMethod: 'visiting')
!
visitWriteHolderNode: anObject {WriteHolderNode} {^WriteHolderNode}
	^WriteHolderNode varName: (self rename: anObject varName)
		value: (self visit: anObject value)
!
(reader addClassMethod: 'instance creation')
!
in: aNode {Node} rename: oldName {String} to: newName {String} {^Node}
	oldName = newName ifTrue: [^aNode].
	^(self oldName: oldName newName: newName) visit: aNode
!
(reader addClassMethod: 'instance creation')
!
oldName: aString {Str} newName: aString2 {Str} {^Instance}
	^self new initializeOldName: aString newName: aString2
!
