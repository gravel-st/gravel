(reader defineClass: 'BoundVariableDeclarationNode' superclass: 'st.gravel.support.compiler.ast.VariableDeclarationNode')
!
(reader addInstVar: 'ownerType' type: 'Reference')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBoundVariableDeclarationNode: self
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {Str} type: aTypeNode {TypeNode} ownerType: aReference {Reference} {^Self}
	name := aString.
	type := aTypeNode.
	ownerType := aReference.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^String}
	^name
!
(reader addMethod: 'accessing')
!
ownerType {^Reference}
	^ownerType
!
(reader addMethod: 'accessing')
!
type {^TypeNode}
	^type
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} type: aTypeNode {TypeNode} ownerType: aReference {Reference} {^BoundVariableDeclarationNode}
	^self new initializeName: aString type: aTypeNode ownerType: aReference
!
