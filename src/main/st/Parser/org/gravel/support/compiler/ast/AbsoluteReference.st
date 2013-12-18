(reader defineClass: 'AbsoluteReference' superclass: 'org.gravel.support.compiler.ast.Reference')
!
(reader addInstVar: 'path')
!
(reader addMethod: 'comparing')
!
/ aSymbol {Sym} {^AbsoluteReference}
	^AbsoluteReference path: (path copyWith: aSymbol)
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	| other {Self} |
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	other := anObject.
	path size = other path size ifFalse: [^false].
	path with: other path do: [:a {Sym} :b {Sym} | a == b ifFalse: [^false]].
	^true
!
(reader addMethod: 'comparing')
!
hash {^Int}
	| hash {Int} |
	hash := 13.
	path do: [:elem {Sym} | hash := hash bitXor: elem hash].
	^hash
!
(reader addMethod: 'initialize-release')
!
initializePath: anArray {Arr[Sym]} {^Self}
	path := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isMeta {^Bool}
	^false
!
(reader addMethod: 'comparing')
!
meta {^Reference}
	^ClassReference reference: self
!
(reader addMethod: 'As yet unclassified')
!
name {^Sym}
	^path last
!
(reader addMethod: 'comparing')
!
namespace {^AbsoluteReference}
	^AbsoluteReference path: path copyWithoutLast
!
(reader addMethod: 'comparing')
!
nonmeta {^AbsoluteReference}
	^self
!
(reader addMethod: 'accessing')
!
path {^Arr[Sym]}
	^path
!
(reader addMethod: 'accessing')
!
printOn: aStream {WStream[Char]} {^Self}
	path do: [:elem {Sym} | aStream nextPutAll: elem asString]
		separatedBy: [aStream nextPut: $.]
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[Sym]]}
	^#('path')
!
(reader addClassMethod: 'instance creation')
!
path: anArray {Arr[Sym]} {^Instance}
	^self new initializePath: anArray
!
