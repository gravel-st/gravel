(reader defineClass: 'UpdateClassDiff' superclass: 'org.gravel.parser.AbstractClassDiff')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'methodNodes')
!
(reader addInstVar: 'updatedMethodNodes')
!
(reader addInstVar: 'deletedSelectors')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitUpdateClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnClassNode: startClassNode {ClassDescriptionNode} {^ClassDescriptionNode}
	| classNode {ClassDescriptionNode} |
	classNode := methodNodes inject: startClassNode
				into: [:cn {ClassDescriptionNode} :m {MethodNode} | cn withMethodNode: m].
	classNode := updatedMethodNodes inject: classNode
				into: [:cn {ClassDescriptionNode} :m {MethodNode} | cn copyReplaceMethodNode: m].
	^deletedSelectors inject: classNode
		into: [:cn {ClassDescriptionNode} :sel {Str} | cn copyRemoveSelector: sel]
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	| classNode {ClassDescriptionNode} |
	classNode := self applyOnClassNode: (aSystemNode classNodeAt: reference).
	^aSystemNode withClassDescriptionNode: classNode
!
(reader addMethod: 'accessing')
!
deletedSelectors {^Arr[Str]}
	^deletedSelectors
!
(reader addMethod: 'initialize-release')
!
initializeReference: aReference {Reference} methodNodes: anArray {Arr[MethodNode]} updatedMethodNodes: anArray2 {Arr[MethodNode]} deletedSelectors: anArray3 {Arr[Str]} {^Self}
	reference := aReference.
	methodNodes := anArray.
	updatedMethodNodes := anArray2.
	deletedSelectors := anArray3.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependent: aDiff {AbstractClassDiff} {^Bool}
	^aDiff isPrereqOrDependentOfUpdateClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfNewClassDiff: aClassDiff {NewClassDiff} {^Bool}
	^reference = aClassDiff reference
!
(reader addMethod: 'accessing')
!
methodNodes {^Arr[MethodNode]}
	^methodNodes
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
(reader addMethod: 'accessing')
!
updatedMethodNodes {^Arr[MethodNode]}
	^updatedMethodNodes
!
(reader addMethod: 'As yet unclassified')
!
withBranchDiff: aBranchDiff {BranchDiff} {^Diff}
	^aBranchDiff withUpdateClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withUpdateClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^AbstractClassDiff}
	aNewClassDiff reference = reference ifTrue: [^aNewClassDiff withMethodNodes: methodNodes].
	^ClassDiffs with: self with: aNewClassDiff
!
(reader addMethod: 'diff merging')
!
withUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Diff}
	reference = anUpdateClassDiff reference ifTrue: [^self halt].
	self halt
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Reference, Arr[MethodNode], Arr[MethodNode], Arr[Str]]}
	^#('reference' 'methodNodes' 'updatedMethodNodes' 'deletedSelectors')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} methodNodes: anArray {Arr[MethodNode]} {^Instance}
	^self
		reference: anAbsoluteReference
		methodNodes: anArray
		updatedMethodNodes: #()
		deletedSelectors: #()
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} methodNodes: anArray {Arr[MethodNode]} updatedMethodNodes: updatedMethodNodes {Arr[MethodNode]} deletedSelectors: deletedSelectors {Arr[Str]} {^Instance}
	^self new
		initializeReference: anAbsoluteReference
		methodNodes: anArray
		updatedMethodNodes: updatedMethodNodes
		deletedSelectors: deletedSelectors
!
