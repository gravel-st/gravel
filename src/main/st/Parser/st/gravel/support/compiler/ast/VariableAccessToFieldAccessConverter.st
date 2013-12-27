(reader defineClass: 'VariableAccessToFieldAccessConverter' superclass: 'st.gravel.support.compiler.ast.NodeCopierWithLocals')
!
(reader addInstVar: 'instVarNames')
!
(reader addInstVar: 'owner')
!
(reader addInstVar: 'namespace')
!
(reader addInstVar: 'ownerReference')
!
(reader addMethod: 'initialize-release')
!
initializeInstVarNames: anArray {Arr[Str]} owner: anExpression {Expression} ownerReference: anObject2 {Reference} namespace: anObject {AbsoluteReference} {^Self}
	instVarNames := anArray.
	owner := anExpression.
	namespace := anObject.
	ownerReference := anObject2.
	self initialize
!
(reader addMethod: 'accessing')
!
instVarNames {^Arr[Str]}
	^instVarNames
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
	(self includesLocalName: anObject variable name)
		ifTrue: [^LocalWriteNode name: anObject variable name value: (self visit: anObject value)].
	(instVarNames includes: anObject variable name)
		ifTrue: 
			[^FieldWriteNode
				owner: owner
				field: anObject variable name
				value: (self visit: anObject value)].
	^GlobalWriteNode
		namespace: namespace
		name: anObject variable name
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	anObject name = 'self' ifTrue: [^SelfNode new].
	anObject name = 'super' ifTrue: [^SuperNode reference: ownerReference].
	(self includesLocalName: anObject name) ifTrue: [^LocalReadNode name: anObject name].
	(instVarNames includes: anObject name)
		ifTrue: [^FieldReadNode owner: owner field: anObject name].
	^GlobalReadNode namespace: namespace name: anObject name
!
(reader addClassMethod: 'instance creation')
!
instVarNames: instVarNames {Arr[Str]} owner: owner {Expression} ownerReference: ownerReference {Reference} {^Instance}
	^self
		instVarNames: instVarNames
		owner: owner
		ownerReference: ownerReference
		namespace: ownerReference nonmeta
!
(reader addClassMethod: 'instance creation')
!
instVarNames: anArray {Arr[Str]} owner: anExpression {Expression} ownerReference: anObject1 {Reference} namespace: anObject {AbsoluteReference} {^Instance}
	^self new
		initializeInstVarNames: anArray
		owner: anExpression
		ownerReference: anObject1
		namespace: anObject
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[Str], Expression, Set[Str], AbsoluteReference, Reference]}
	^#('instVarNames' 'owner' 'localNames' 'namespace' 'ownerReference')
!
