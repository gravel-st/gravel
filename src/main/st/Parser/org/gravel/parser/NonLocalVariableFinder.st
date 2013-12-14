(reader defineClass: 'NonLocalVariableFinder' superclass: 'org.gravel.parser.NodeCopier')
!
(reader addInstVar: 'locals')
!
(reader addInstVar: 'nonLocals')
!
(reader addMethod: 'visiting')
!
addVarAccess: varName {Str} {^Self}
	((locals includes: varName) or: [nonLocals includes: varName])
		ifFalse: [nonLocals add: varName]
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	locals := Set new.
	nonLocals := OrderedCollection new
!
(reader addMethod: 'As yet unclassified')
!
nonLocals {^Arr[Str]}
	^nonLocals asArray
!
(reader addMethod: 'visiting')
!
visitBoundVariableDeclarationNode: anObject {BoundVariableDeclarationNode} {^BoundVariableDeclarationNode}
	locals add: anObject name.
	^super visitBoundVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitLocalReadNode: anObject {LocalReadNode} {^Expression}
	self addVarAccess: anObject name.
	^super visitLocalReadNode: anObject
!
(reader addMethod: 'visiting')
!
visitLocalWriteNode: anObject {LocalWriteNode} {^LocalWriteNode}
	self addVarAccess: anObject name.
	^super visitLocalWriteNode: anObject
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^Statement}
	self addVarAccess: anObject marker.
	^super visitNonLocalReturnNode: anObject
!
(reader addMethod: 'visiting')
!
visitReadHolderNode: anObject {ReadHolderNode} {^ReadHolderNode}
	self addVarAccess: anObject varName.
	^super visitReadHolderNode: anObject
!
(reader addMethod: 'visiting')
!
visitSelfNode: anObject {SelfNode} {^Expression}
	self addVarAccess: 'self'.
	^super visitSelfNode: anObject
!
(reader addMethod: 'visiting')
!
visitSuperNode: anObject {SuperNode} {^SuperNode}
	self addVarAccess: 'self'.
	^super visitSuperNode: anObject
!
(reader addMethod: 'visiting')
!
visitToDoNode: anObject {ToDoNode} {^ToDoNode}
	locals add: anObject counterName.
	^super visitToDoNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableDeclarationNode: anObject {VariableDeclarationNode} {^VariableDeclarationNode}
	locals add: anObject name.
	^super visitVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	NodeVisitorError raise
!
(reader addMethod: 'visiting')
!
visitWriteHolderNode: anObject {WriteHolderNode} {^WriteHolderNode}
	self addVarAccess: anObject varName.
	^super visitWriteHolderNode: anObject
!
(reader addClassMethod: 'As yet unclassified')
!
analyze: aNode {Node} {^Arr[Str]}
	^(self new)
		visit: aNode;
		nonLocals
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Set[Str], OrderedCollection[Str]]}
	^#('locals' 'nonLocals')
!
