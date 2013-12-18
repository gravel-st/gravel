(reader defineClass: 'RemoveClassDiff' superclass: 'org.gravel.support.compiler.ast.ClassDiff')
!
(reader addInstVar: 'classNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitRemoveClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	
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
reference {^Reference | Nil}
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
