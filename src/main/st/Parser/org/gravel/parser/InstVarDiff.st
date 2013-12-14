(reader defineClass: 'InstVarDiff' superclass: 'org.gravel.parser.Diff')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'instVar')
!
(reader addMethod: 'As yet unclassified')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitInstVarDiff: self
!
(reader addMethod: 'initialize-release')
!
initializeReference: aReference {Reference} instVar: aVariableDeclarationNode {VariableDeclarationNode} {^Self}
	reference := aReference.
	instVar := aVariableDeclarationNode.
	self initialize
!
(reader addMethod: 'accessing')
!
instVar {^VariableDeclarationNode}
	^instVar
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
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Reference, VariableDeclarationNode]}
	^#('reference' 'instVar')
!
(reader addClassMethod: 'instance creation')
!
reference: aReference {Reference} instVar: instVar {VariableDeclarationNode} {^Instance}
	^self new initializeReference: aReference instVar: instVar
!
