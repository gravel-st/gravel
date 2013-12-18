(reader defineClass: 'MessageNode' superclass: 'org.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'receiver')
!
(reader addInstVar: 'selector')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [receiver = anObject receiver and: [selector = anObject selector]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitMessageNode: self
!
(reader addMethod: 'accessing')
!
argument {^Expression}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[Expression]}
	self subclassResponsibility
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: receiver hash) bitXor: selector hash
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anIntegerLiteralNode {Expression} selector: aString {String} {^Self}
	receiver := anIntegerLiteralNode.
	selector := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceSendOn: aStream {WStream[Char]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isMessageNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
keywords {^Arr[Str]}
	^selector asSymbol keywords
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
receiver {^Expression}
	^receiver
!
(reader addMethod: 'accessing')
!
selector {^String}
	^selector
!
(reader addMethod: 'As yet unclassified')
!
sourceSendOn: aStream {WStream[Char]} {^Self}
	aStream space.
	self innerSourceSendOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
withArguments: anArray {Arr[Expression]} {^Self}
	^self subclassResponsibility
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, String]}
	^#('receiver' 'selector')
!
(reader addClassMethod: 'instance creation')
!
receiver: aNode {Expression} selector: aString {String} {^Instance}
	^self new initializeReceiver: aNode selector: aString
!
