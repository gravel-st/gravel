(reader defineClass: 'MethodDiff' superclass: 'org.gravel.parser.Diff')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'methodNode')
!
(reader addMethod: 'As yet unclassified')
!
asClassDiff {^UpdateClassDiff}
	^self subclassResponsibility
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {Reference} methodNode: anUnaryMethodNode {MethodNode} {^Self}
	reference := anAbsoluteReference.
	methodNode := anUnaryMethodNode.
	self initialize
!
(reader addMethod: 'accessing')
!
methodNode {^MethodNode}
	^methodNode
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: reference printString
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^reference
!
(reader addMethod: 'diff merging')
!
withMethodDiff: aMethodDiff {MethodDiff} {^Diff}
	^self withDiff: aMethodDiff asClassDiff
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Reference, MethodNode]}
	^#('reference' 'methodNode')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} methodNode: anUnaryMethodNode {MethodNode} {^Instance}
	^self new initializeReference: anAbsoluteReference methodNode: anUnaryMethodNode
!
