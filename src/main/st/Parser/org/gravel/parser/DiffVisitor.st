(reader defineClass: 'DiffVisitor' superclass: 'org.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visit: anObject {Diff} {^Self}
	anObject accept: self
!
(reader addMethod: 'visiting')
!
visitAbstractClassDiff: anObject {AbstractClassDiff} {^Self}
	^self visitDiff: anObject
!
(reader addMethod: 'visiting')
!
visitAddClassDiff: anObject {AddClassDiff} {^Self}
	^self visitNewClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitAddInstVarDiff: anObject {AddInstVarDiff} {^Self}
	^self visitInstVarDiff: anObject
!
(reader addMethod: 'visiting')
!
visitAddMethodDiff: anObject {AddMethodDiff} {^Self}
	^self visitMethodDiff: anObject
!
(reader addMethod: 'visiting')
!
visitBranchDiff: anObject {BranchDiff} {^Self}
	^self visitAbstractClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitClassDiffs: anObject {ClassDiffs} {^Self}
	^self visitAbstractClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitDiff: anObject {Diff} {^Self}
	^DiffVisitorError raise
!
(reader addMethod: 'visiting')
!
visitEmptyDiff: anObject {EmptyDiff} {^Self}
	^self visitDiff: anObject
!
(reader addMethod: 'visiting')
!
visitInstVarDiff: anObject {InstVarDiff} {^Self}
	^self visitDiff: anObject
!
(reader addMethod: 'visiting')
!
visitMethodDiff: anObject {MethodDiff} {^Self}
	^self visitDiff: anObject
!
(reader addMethod: 'visiting')
!
visitNewClassDiff: anObject {NewClassDiff} {^Self}
	^self visitAbstractClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitRemoveClassDiff: anObject {RemoveClassDiff} {^Self}
	^self visitDiff: anObject
!
(reader addMethod: 'visiting')
!
visitRemoveInstVarDiff: anObject {RemoveInstVarDiff} {^Self}
	^self visitInstVarDiff: anObject
!
(reader addMethod: 'visiting')
!
visitRemoveMethodDiff: anObject {RemoveMethodDiff} {^Self}
	^self visitMethodDiff: anObject
!
(reader addMethod: 'visiting')
!
visitUpdateClassDiff: anObject {UpdateClassDiff} {^Self}
	^self visitAbstractClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitUpdateMethodDiff: anObject {UpdateMethodDiff} {^Self}
	^self visitMethodDiff: anObject
!
(reader addMethod: 'visiting')
!
visitWrapJavaclassDiff: anObject {WrapJavaclassDiff} {^Self}
	^self visitNewClassDiff: anObject
!
(reader addClassMethod: 'As yet unclassified')
!
visit: aDiff {Diff} {^Instance}
	^self new visit: aDiff
!
