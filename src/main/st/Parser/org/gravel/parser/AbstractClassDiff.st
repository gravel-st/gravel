(reader defineClass: 'AbstractClassDiff' superclass: 'org.gravel.parser.Diff')
!
(reader addInstVar: 'isStatic')
!
(reader addInstVar: 'cache')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitAbstractClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	^self copy pvtSetStatic: true
!
(reader addMethod: 'As yet unclassified')
!
beStatic: aBoolean {Bool} {^Self}
	(aBoolean and: [self isStatic not]) ifTrue: [^self beStatic].
	^self
!
(reader addMethod: 'As yet unclassified')
!
cachedIsPrereqOrDependent: anAbstractClassDiff {AbstractClassDiff} {^Bool}
	^cache at: anAbstractClassDiff
		ifAbsentPut: [self isPrereqOrDependent: anAbstractClassDiff]
!
(reader addMethod: 'accessing')
!
classDiffsSize {^Int | Nil}
	^1
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	isStatic := self isStaticDefault.
	cache := IdentityDictionary new
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependent: anAbstractClassDiff {AbstractClassDiff} {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfAddClassDiff: aClassDiff {AddClassDiff} {^Bool}
	^self isPrereqOrDependentOfNewClassDiff: aClassDiff
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfBranchDiff: aBranchDiff {BranchDiff} {^Bool}
	^self isPrereqOrDependent: aBranchDiff
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfNewClassDiff: aClassDiff {NewClassDiff} {^Bool}
	^self isPrereqOrDependent: aClassDiff
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Bool}
	^self isPrereqOrDependent: anUpdateClassDiff
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependentOfWrapJavaclassDiff: aClassDiff {WrapJavaclassDiff} {^Bool}
	^self isPrereqOrDependentOfNewClassDiff: aClassDiff
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^isStatic
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
pvtSetStatic: aBoolean {Bool} {^Self}
	isStatic := aBoolean
!
(reader addMethod: 'As yet unclassified')
!
withClassDiffs: aClassDiffs {ClassDiffs} {^Diff}
	^aClassDiffs withAbstractClassDiff: self
!
(reader addMethod: 'diff merging')
!
withMethodDiff: aMethodDiff {MethodDiff} {^Diff}
	^self withDiff: aMethodDiff asClassDiff
!
(reader addMethod: 'As yet unclassified')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^AbstractClassDiff}
	^self subclassResponsibility
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Bool, IdentityDictionary[AbstractClassDiff, Bool | Nil]]}
	^#('isStatic' 'cache')
!
