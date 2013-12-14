(reader defineClass: 'AddMethodDiff' superclass: 'org.gravel.parser.MethodDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitAddMethodDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode
		withClassDescriptionNode: ((aSystemNode classNodeAt: reference) withMethodNode: methodNode)
!
(reader addMethod: 'As yet unclassified')
!
asClassDiff {^UpdateClassDiff}
	^UpdateClassDiff reference: reference methodNodes: (Array with: methodNode)
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withAddMethodDiff: self
!
