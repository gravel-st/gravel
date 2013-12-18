(reader defineClass: 'NewClassDiff' superclass: 'org.gravel.support.compiler.ast.ClassDiff')
!
(reader addInstVar: 'classNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitNewClassDiff: self
!
(reader addMethod: 'accessing')
!
classNode {^ClassNode}
	^classNode
!
(reader addMethod: 'initialize-release')
!
initializeClassNode: aClassNode {ClassNode} {^Self}
	classNode := aClassNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isNewClassDiff {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^classNode reference
!
(reader addMethod: 'As yet unclassified')
!
superclassReference {^Reference | Nil}
	^classNode superclassReference
!
(reader addClassMethod: 'instance creation')
!
classNode: aClassNode {ClassNode} {^Instance}
	^self new initializeClassNode: aClassNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[ClassNode]}
	^#('classNode')
!
