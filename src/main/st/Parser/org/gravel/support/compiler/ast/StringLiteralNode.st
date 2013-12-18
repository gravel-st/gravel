(reader defineClass: 'StringLiteralNode' superclass: 'org.gravel.support.compiler.ast.LiteralNode')
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
	^visitor visitStringLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeValue: aString {String} {^Self}
	value := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $'.
	value do: 
			[:ch {Character} |
			aStream nextPut: ch.
			ch == $' ifTrue: [aStream nextPut: $']].
	aStream nextPut: $'
!
(reader addMethod: 'As yet unclassified')
!
isStringLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^String}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aString {String} {^Instance}
	^self new initializeValue: aString
!
