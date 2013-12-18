(reader defineClass: 'NodeCopierWithLocals' superclass: 'org.gravel.support.compiler.ast.NodeCopier')
!
(reader addInstVar: 'localNames')
!
(reader addMethod: 'visiting')
!
addLocalName: name {Str} {^Self}
	localNames add: name
!
(reader addMethod: 'visiting')
!
includesLocalName: name {Str} {^Bool}
	^localNames includes: name
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	localNames := Set new
!
(reader addMethod: 'copying')
!
postCopy {^Self}
	super postCopy.
	localNames := localNames copy
!
(reader addMethod: 'visiting')
!
produceBlockNode: anObject {BlockNode} {^BlockNode}
	^super visitBlockNode: anObject
!
(reader addMethod: 'visiting')
!
produceBoundVariableDeclarationNode: anObject {BoundVariableDeclarationNode} {^BoundVariableDeclarationNode}
	^super visitBoundVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
produceHolderDeclarationNode: anObject {HolderDeclarationNode} {^HolderDeclarationNode}
	^super visitHolderDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
produceToDoNode: anObject {ToDoNode} {^ToDoNode}
	^super visitToDoNode: anObject
!
(reader addMethod: 'visiting')
!
produceVariableDeclarationNode: anObject {VariableDeclarationNode} {^VariableDeclarationNode}
	^super visitVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
subconverter {^Self}
	^self copy
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^BlockNode}
	^self subconverter produceBlockNode: anObject
!
(reader addMethod: 'visiting')
!
visitBoundVariableDeclarationNode: anObject {BoundVariableDeclarationNode} {^BoundVariableDeclarationNode}
	self addLocalName: anObject name.
	^self produceBoundVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitHolderDeclarationNode: anObject {HolderDeclarationNode} {^HolderDeclarationNode}
	self addLocalName: anObject name.
	^self produceHolderDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitToDoNode: anObject {ToDoNode} {^ToDoNode}
	^(self subconverter)
		addLocalName: anObject counterName;
		produceToDoNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableDeclarationNode: anObject {VariableDeclarationNode} {^VariableDeclarationNode}
	self addLocalName: anObject name.
	^self produceVariableDeclarationNode: anObject
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Set[Str]]}
	^#('localNames')
!
