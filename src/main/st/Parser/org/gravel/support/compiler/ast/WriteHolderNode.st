(reader defineClass: 'WriteHolderNode' superclass: 'org.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'varName')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [varName = anObject varName and: [value = anObject value]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitWriteHolderNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: varName hash) bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {String} value: anIntegerLiteralNode {Expression} {^Self}
	varName := aString.
	value := anIntegerLiteralNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: '{';
		nextPutAll: varName;
		nextPutAll: ' value: '.
	value sourceOn: aStream.
	aStream nextPutAll: '}'
!
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	aBlock value: varName
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^varName
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: value
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^varName = aString
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^AssignmentNode variable: (VariableNode name: self name) value: value
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addMethod: 'accessing')
!
varName {^String}
	^varName
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String, Expression]}
	^#('varName' 'value')
!
(reader addClassMethod: 'instance creation')
!
varName: aString {String} value: anIntegerLiteralNode {Expression} {^Instance}
	^self new initializeVarName: aString value: anIntegerLiteralNode
!
