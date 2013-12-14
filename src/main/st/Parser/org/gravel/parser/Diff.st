(reader defineClass: 'Diff' superclass: 'org.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
classDiffsSize {^Int | Nil}
	^0
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'printing')
!
printString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	aStream nextPutAll: self class name asString.
	aStream nextPut: $[.
	self printDescriptionOn: aStream.
	aStream nextPut: $].
	^aStream contents
!
(reader addMethod: 'diff merging')
!
withAbstractClassDiff: aAbstractClassDiff {AbstractClassDiff} {^Diff}
	^self withDiff: aAbstractClassDiff
!
(reader addMethod: 'diff merging')
!
withAddClassDiff: anAddClassDiff {AddClassDiff} {^Diff}
	^self withNewClassDiff: anAddClassDiff
!
(reader addMethod: 'diff merging')
!
withAddClassDiffForClassNode: aClassNode {ClassNode} {^Diff}
	aClassNode javaClassPath isNil
		ifFalse: [^self withDiff: (WrapJavaclassDiff classNode: aClassNode)].
	^self withDiff: (AddClassDiff classNode: aClassNode)
!
(reader addMethod: 'diff merging')
!
withAddInstVarDiff: aAddInstVarDiff {AddInstVarDiff} {^Diff}
	^self withDiff: aAddInstVarDiff
!
(reader addMethod: 'diff merging')
!
withAddMethodDiff: aAddMethodDiff {AddMethodDiff} {^Diff}
	^self withMethodDiff: aAddMethodDiff
!
(reader addMethod: 'diff merging')
!
withBranchDiff: aBranchDiff {BranchDiff} {^Diff}
	^self withAbstractClassDiff: aBranchDiff
!
(reader addMethod: 'diff merging')
!
withClassDiffs: aClassDiffs {ClassDiffs} {^Diff}
	^self withAbstractClassDiff: aClassDiffs
!
(reader addMethod: 'diff merging')
!
withDiff: aDiff {Diff} {^Diff}
	^self subclassResponsibility
!
(reader addMethod: 'diff merging')
!
withEmptyDiff: aEmptyDiff {EmptyDiff} {^Diff}
	^self withDiff: aEmptyDiff
!
(reader addMethod: 'diff merging')
!
withMethodDiff: aMethodDiff {MethodDiff} {^Diff}
	^self withDiff: aMethodDiff
!
(reader addMethod: 'diff merging')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^Diff}
	^self withAbstractClassDiff: aNewClassDiff
!
(reader addMethod: 'diff merging')
!
withRemoveClassDiffForClassNode: aClassNode {ClassNode} {^Diff}
	^self withDiff: (RemoveClassDiff classNode: aClassNode)
!
(reader addMethod: 'diff merging')
!
withRemoveInstVarDiff: aRemoveInstVarDiff {RemoveInstVarDiff} {^Diff}
	^self withDiff: aRemoveInstVarDiff
!
(reader addMethod: 'diff merging')
!
withRemoveMethodDiff: aRemoveMethodDiff {RemoveMethodDiff} {^Diff}
	^self withDiff: aRemoveMethodDiff
!
(reader addMethod: 'diff merging')
!
withUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Diff}
	^self withAbstractClassDiff: anUpdateClassDiff
!
(reader addMethod: 'diff merging')
!
withUpdateMethodDiff: aUpdateMethodDiff {UpdateMethodDiff} {^Diff}
	^self withMethodDiff: aUpdateMethodDiff
!
(reader addMethod: 'diff merging')
!
withWrapJavaclassDiff: aWrapJavaclassDiff {WrapJavaclassDiff} {^Diff}
	^self withNewClassDiff: aWrapJavaclassDiff
!
