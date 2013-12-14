(reader defineClass: 'RemoveClassDiff' superclass: 'org.gravel.parser.Diff')
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
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode
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
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: classNode reference printString
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff
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
