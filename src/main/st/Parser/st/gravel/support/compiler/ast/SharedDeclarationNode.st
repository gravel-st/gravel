(reader defineClass: 'SharedDeclarationNode' superclass: 'st.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'initializer' type: 'Nil | Expression')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSharedDeclarationNode: self
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {Str} initializer: anUndefinedObject {Expression | Nil} {^Self}
	name := aString.
	initializer := anUndefinedObject.
	self initialize
!
(reader addMethod: 'accessing')
!
initializer {^Expression | Nil}
	^initializer
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	initializer isNil ifFalse: [aBlock value: initializer]
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: name
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} initializer: anUndefinedObject {Expression | Nil} {^SharedDeclarationNode}
	^self new initializeName: aString initializer: anUndefinedObject
!
