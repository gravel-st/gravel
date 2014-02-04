(reader defineClass: 'VariableAccessToFieldAccessConverter' superclass: 'st.gravel.support.compiler.ast.NodeCopierWithLocals')
!
(reader addInstVar: 'instVars' type: 'Array[VariableDeclarationNode]')
!
(reader addInstVar: 'owner' type: 'Expression')
!
(reader addInstVar: 'namespace' type: 'AbsoluteReference')
!
(reader addInstVar: 'ownerReference' type: 'Reference')
!
(reader addMethod: 'initialize-release')
!
initializeInstVars: anArray {Arr[VariableDeclarationNode]} owner: anExpression {Expression} ownerReference: anObject2 {Reference} namespace: anObject {AbsoluteReference} {^Self}
	instVars := anArray.
	owner := anExpression.
	namespace := anObject.
	ownerReference := anObject2.
	self initialize
!
(reader addMethod: 'system primitives')
!
instVarAt: varName {Str} {^VariableDeclarationNode | Nil}
	^instVars detect: [:node {VariableDeclarationNode} | node name = varName] ifNone: [nil]
!
(reader addMethod: 'accessing')
!
instVars {^Arr[VariableDeclarationNode]}
	^instVars
!
(reader addMethod: 'accessing')
!
owner {^Expression}
	^owner
!
(reader addMethod: 'accessing')
!
ownerReference {^Reference}
	^ownerReference
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject {AssignmentNode} {^Expression}
	| instVar {VariableDeclarationNode | Nil} |
	(self includesLocalName: anObject variable name)
		ifTrue: [^LocalWriteNode name: anObject variable name value: (self visit: anObject value)].
	instVar := self instVarAt: anObject variable name.
	instVar isNil
		ifFalse: 
			[^FieldWriteNode
				owner: owner
				field: instVar name
				type: instVar type
				value: (self visit: anObject value)].
	^GlobalWriteNode
		namespace: namespace
		name: anObject variable name
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	| instVar {VariableDeclarationNode | Nil} |
	anObject name = 'self' ifTrue: [^SelfNode new].
	anObject name = 'super' ifTrue: [^SuperNode reference: ownerReference].
	(self includesLocalName: anObject name) ifTrue: [^LocalReadNode name: anObject name].
	instVar := self instVarAt: anObject name.
	instVar isNil
		ifFalse: 
			[^FieldReadNode
				owner: owner
				field: instVar name
				type: instVar type].
	^GlobalReadNode namespace: namespace name: anObject name
!
(reader addClassMethod: 'instance creation')
!
instVars: instVars {Arr[VariableDeclarationNode]} owner: owner {Expression} ownerReference: ownerReference {Reference} {^Instance}
	^self
		instVars: instVars
		owner: owner
		ownerReference: ownerReference
		namespace: ownerReference nonmeta
!
(reader addClassMethod: 'instance creation')
!
instVars: anArray {Arr[VariableDeclarationNode]} owner: anExpression {Expression} ownerReference: anObject1 {Reference} namespace: anObject {AbsoluteReference} {^Instance}
	^self new
		initializeInstVars: anArray
		owner: anExpression
		ownerReference: anObject1
		namespace: anObject
!
