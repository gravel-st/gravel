(reader defineClass: 'BooleanLiteralNode' superclass: 'org.gravel.support.compiler.ast.LiteralNode')
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
	^visitor visitBooleanLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeValue: aBoolean {Boolean} {^Self}
	value := aBoolean.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	value ifTrue: [aStream nextPutAll: 'true'] ifFalse: [aStream nextPutAll: 'false']
!
(reader addMethod: 'As yet unclassified')
!
isBooleanLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^Boolean}
	^value
!
(reader addClassMethod: 'instance creation')
!
false {^BooleanLiteralNode}
	^self value: false
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Boolean]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
true {^BooleanLiteralNode}
	^self value: true
!
(reader addClassMethod: 'instance creation')
!
value: aBoolean {Boolean} {^Instance}
	^self new initializeValue: aBoolean
!
