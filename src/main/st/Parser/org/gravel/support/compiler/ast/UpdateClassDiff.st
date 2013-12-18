(reader defineClass: 'UpdateClassDiff' superclass: 'org.gravel.support.compiler.ast.ClassDiff')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'thisDiff')
!
(reader addInstVar: 'metaDiff')
!
(reader addInstVar: 'superclassReference')
!
(reader addInstVar: 'isStatic')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitUpdateClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	isStatic := true
!
(reader addMethod: 'As yet unclassified')
!
initialize {^Self}
	super initialize.
	isStatic := false
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {AbsoluteReference} superclassReference: anAbsoluteReference2 {AbsoluteReference} thisDiff: anUpdateClassDescriptorDiff {UpdateClassDescriptorDiff} metaDiff: anUpdateClassDescriptorDiff2 {UpdateClassDescriptorDiff} {^Self}
	reference := anAbsoluteReference.
	superclassReference := anAbsoluteReference2.
	thisDiff := anUpdateClassDescriptorDiff.
	metaDiff := anUpdateClassDescriptorDiff2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^thisDiff isEmpty and: [metaDiff isEmpty]
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^isStatic
!
(reader addMethod: 'accessing')
!
metaDiff {^UpdateClassDescriptorDiff}
	^metaDiff
!
(reader addMethod: 'accessing')
!
reference {^AbsoluteReference}
	^reference
!
(reader addMethod: 'accessing')
!
superclassReference {^Reference | Nil}
	^superclassReference
!
(reader addMethod: 'accessing')
!
thisDiff {^UpdateClassDescriptorDiff}
	^thisDiff
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[AbsoluteReference, UpdateClassDescriptorDiff, UpdateClassDescriptorDiff, AbsoluteReference, Bool]}
	^#('reference' 'thisDiff' 'metaDiff' 'superclassReference' 'isStatic')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {AbsoluteReference} superclassReference: anAbsoluteReference2 {AbsoluteReference} thisDiff: anUpdateClassDescriptorDiff {UpdateClassDescriptorDiff} metaDiff: anUpdateClassDescriptorDiff2 {UpdateClassDescriptorDiff} {^UpdateClassDiff}
	^self new
		initializeReference: anAbsoluteReference
		superclassReference: anAbsoluteReference2
		thisDiff: anUpdateClassDescriptorDiff
		metaDiff: anUpdateClassDescriptorDiff2
!
