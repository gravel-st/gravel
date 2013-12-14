(reader defineClass: 'EmptyDiff' superclass: 'org.gravel.parser.Diff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitEmptyDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
withAddMethodDiff: anAddMethodDiff {AddMethodDiff} {^AddMethodDiff}
	^anAddMethodDiff
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff
!
(reader addMethod: 'diff merging')
!
withUpdateMethodDiff: anUpdateMethodDiff {UpdateMethodDiff} {^UpdateMethodDiff}
	^anUpdateMethodDiff
!
