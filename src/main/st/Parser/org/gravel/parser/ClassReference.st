(reader defineClass: 'ClassReference' superclass: 'org.gravel.parser.Reference')
!
(reader addInstVar: 'reference')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	| other {Self} |
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	other := anObject.
	^other reference = reference
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^7 bitXor: reference hash
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {AbsoluteReference} {^Self}
	reference := anAbsoluteReference.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isMeta {^Bool}
	^true
!
(reader addMethod: 'comparing')
!
meta {^Reference}
	^self error: 'niy'
!
(reader addMethod: 'comparing')
!
namespace {^AbsoluteReference}
	^reference namespace
!
(reader addMethod: 'comparing')
!
nonmeta {^AbsoluteReference}
	^reference
!
(reader addMethod: 'accessing')
!
printOn: aStream {WStream[Char]} {^Self}
	reference printOn: aStream.
	aStream nextPutAll: ' class'
!
(reader addMethod: 'accessing')
!
reference {^AbsoluteReference}
	^reference
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[AbsoluteReference]}
	^#('reference')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {AbsoluteReference} {^ClassReference}
	^self new initializeReference: anAbsoluteReference
!
