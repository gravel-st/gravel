(reader defineClass: 'ByteArrayLiteralNode' superclass: 'org.gravel.parser.LiteralNode')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [value = anObject value]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitByteArrayLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeValue: aByteArray {ByteArray} {^Self}
	value := aByteArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '#['.
	value do: [:each {Int} | aStream print: (each bitAnd: 255)] separatedBy: [aStream space].
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
isByteArrayLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^ByteArray}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[ByteArray]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aByteArray {ByteArray} {^Instance}
	^self new initializeValue: aByteArray
!
