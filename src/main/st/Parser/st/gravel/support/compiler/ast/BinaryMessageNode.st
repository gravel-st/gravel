(reader defineClass: 'BinaryMessageNode' superclass: 'st.gravel.support.compiler.ast.MessageNode')
!
(reader addInstVar: 'argument')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [argument = anObject argument]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBinaryMessageNode: self
!
(reader addMethod: 'accessing')
!
argument {^Expression}
	^argument
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[Expression]}
	^Array with: argument
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: argument hash
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anIntegerLiteralNode {Expression} selector: aString {String} argument: anIntegerLiteralNode2 {Expression} {^Self}
	receiver := anIntegerLiteralNode.
	selector := aString.
	argument := anIntegerLiteralNode2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	receiver sourceOn: aStream.
	self sourceSendOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
innerSourceSendOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: selector;
		space.
	argument sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: receiver.
	aBlock value: argument
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^1
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^2
!
(reader addMethod: 'As yet unclassified')
!
pvtSetArgument: anExpression {Expression} {^Self}
	argument := anExpression
!
(reader addMethod: 'As yet unclassified')
!
withArgument: anExpression {Expression} {^Self}
	^self copy pvtSetArgument: anExpression
!
(reader addMethod: 'As yet unclassified')
!
withArguments: anArray {Arr[Expression]} {^Self}
	self assert: anArray size = 1.
	^self withArgument: anArray first
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, String, Expression]}
	^#('receiver' 'selector' 'argument')
!
(reader addClassMethod: 'instance creation')
!
receiver: anIntegerLiteralNode {Expression} selector: aString {String} argument: anIntegerLiteralNode2 {Expression} {^Instance}
	^self new
		initializeReceiver: anIntegerLiteralNode
		selector: aString
		argument: anIntegerLiteralNode2
!
