(reader defineClass: 'Reference' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isMeta {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'comparing')
!
meta {^Reference}
	^self subclassResponsibility
!
(reader addMethod: 'comparing')
!
namespace {^AbsoluteReference}
	^self subclassResponsibility
!
(reader addMethod: 'comparing')
!
nonmeta {^AbsoluteReference}
	^self subclassResponsibility
!
(reader addMethod: 'printing')
!
printOn: aStream {WStream[Char]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'printing')
!
printString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self printOn: aStream.
	^aStream contents
!
(reader addClassMethod: 'As yet unclassified')
!
value: aString {Str} {^Reference}
	(aString endsWith: ' class') ifTrue: [^(Reference value: (aString allButLast: 6)) meta].
	aString isEmpty ifTrue: [^AbsoluteReference path: #()].
	^AbsoluteReference
		path: ((aString tokensBasedOn: $.) collect: [:each {Str} | each asSymbol])
!
