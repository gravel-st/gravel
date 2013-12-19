(reader defineClass: 'JVMInstruction' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitJVMInstruction: self
!
(reader addMethod: 'As yet unclassified')
!
asFrame {^Frame}
	^Frame empty withInstruction: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isCast {^Bool}
	^false
!
(reader addMethod: 'printing')
!
printOn: aStream {WStream[Char]} {^Self}
	| title {Str} |
	title := self class printString.
	aStream nextPutAll: ((title at: 1) isVowel ifTrue: ['an '] ifFalse: ['a ']).
	aStream nextPutAll: title.
	aStream nextPut: $[.
	self sourceOn: aStream.
	aStream nextPut: $]
!
(reader addMethod: 'printing')
!
printString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: (String new: 16).
	self printOn: aStream.
	^aStream contents
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^self error: 'Not supported'
!
(reader addMethod: 'As yet unclassified')
!
withReturnType: aType {JVMType} {^Self}
	self type = aType ifTrue: [^self].
	self error: 'niy'
!
(reader addClassMethod: 'accessing')
!
toolListIcon
	^Store.PackageModel toolListIcon
!
