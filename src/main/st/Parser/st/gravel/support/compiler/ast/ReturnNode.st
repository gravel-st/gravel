(reader defineClass: 'ReturnNode' superclass: 'st.gravel.support.compiler.ast.Statement')
!
(reader addInstVar: 'value' type: 'Expression')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [value = anObject value]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitReturnNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'As yet unclassified')
!
hasReturnStatements {^Bool}
	^true
!
(reader addMethod: 'initialize-release')
!
initializeValue: aVariableNode {Expression} {^Self}
	value := aVariableNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $^.
	value sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
isReturnNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isTraitRequirementMessage {^Bool}
	^value isTraitRequirementMessage
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: value
!
(reader addMethod: 'testing')
!
returnValue {^Expression}
	^nil
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self innerSourceOn: aStream
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addClassMethod: 'instance creation')
!
value: aVariableNode {Expression} {^Instance}
	^self new initializeValue: aVariableNode
!
