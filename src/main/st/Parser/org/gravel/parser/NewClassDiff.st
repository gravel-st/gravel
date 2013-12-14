(reader defineClass: 'NewClassDiff' superclass: 'org.gravel.parser.AbstractClassDiff')
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
isPrereqOrDependent: aDiff {AbstractClassDiff} {^Bool}
	^aDiff isPrereqOrDependentOfNewClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfNewClassDiff: aClassDiff {NewClassDiff} {^Bool}
	^classNode superclassReference = aClassDiff reference
		or: [self reference = aClassDiff classNode superclassReference]
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: classNode printString
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^classNode reference
!
(reader addMethod: 'As yet unclassified')
!
withBranchDiff: aBranchDiff {BranchDiff} {^Diff}
	^aBranchDiff withNewClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withNewClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
withMethodNodes: anArray {Arr[MethodNode]} {^Self}
	^self class classNode: (classNode mergedWithMethods: anArray)
!
(reader addMethod: 'As yet unclassified')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^AbstractClassDiff}
	(self cachedIsPrereqOrDependent: aNewClassDiff)
		ifTrue: 
			[aNewClassDiff classNode superclassReference = self reference
				ifTrue: [^self withSubclassDiff: aNewClassDiff].
			classNode superclassReference = aNewClassDiff reference
				ifTrue: [^aNewClassDiff withSubclassDiff: self].
			self halt].
	^ClassDiffs with: self with: aNewClassDiff
!
(reader addMethod: 'As yet unclassified')
!
withSubclassDiff: anAbstractClassDiff {AbstractClassDiff} {^Diff}
	^BranchDiff root: self children: (Array with: anAbstractClassDiff)
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
