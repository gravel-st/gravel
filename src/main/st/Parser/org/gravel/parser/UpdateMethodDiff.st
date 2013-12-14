(reader defineClass: 'UpdateMethodDiff' superclass: 'org.gravel.parser.MethodDiff')
!
(reader addMethod: 'As yet unclassified')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitUpdateMethodDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode withClassDescriptionNode: ((aSystemNode classNodeAt: reference)
				copyReplaceMethodNode: methodNode)
!
(reader addMethod: 'As yet unclassified')
!
asClassDiff {^UpdateClassDiff}
	^UpdateClassDiff
		reference: reference
		methodNodes: #()
		updatedMethodNodes: (Array with: methodNode)
		deletedSelectors: #()
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withUpdateMethodDiff: self
!
