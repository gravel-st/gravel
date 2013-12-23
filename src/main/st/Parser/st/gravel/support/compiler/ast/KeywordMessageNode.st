(reader defineClass: 'KeywordMessageNode' superclass: 'st.gravel.support.compiler.ast.MessageNode')
!
(reader addInstVar: 'arguments')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [arguments = anObject arguments]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitKeywordMessageNode: self
!
(reader addMethod: 'As yet unclassified')
!
argument {^Expression}
	^arguments first
!
(reader addMethod: 'accessing')
!
arguments {^Array[Expression]}
	^arguments
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: arguments hash
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anIntegerLiteralNode {Expression} selector: aString {String} arguments: anArray {Array[Expression]} {^Self}
	receiver := anIntegerLiteralNode.
	selector := aString.
	arguments := anArray.
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
	| keywords {Arr[Str]} |
	keywords := selector tokensBasedOn: $:.
	1 to: arguments size
		do: 
			[:i {Int} |
			| keyword {Str} argument {Expression} |
			keyword := keywords at: i.
			argument := arguments at: i.
			i = 1 ifFalse: [aStream space].
			aStream
				nextPutAll: keyword;
				nextPut: $:;
				space.
			argument sourceOn: aStream]
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: receiver.
	arguments do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^arguments size
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^3
!
(reader addMethod: 'As yet unclassified')
!
pvtSetArguments: anArray {Arr[Expression]} {^Self}
	arguments := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetSelector: aString {Str} {^Self}
	selector := aString
!
(reader addMethod: 'As yet unclassified')
!
withArguments: anArray {Arr[Expression]} {^Self}
	self assert: anArray size = arguments size.
	^self copy pvtSetArguments: anArray
!
(reader addMethod: 'As yet unclassified')
!
withSelector: aString {Str} {^Self}
	^self copy pvtSetSelector: aString
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, String, Array[Expression]]}
	^#('receiver' 'selector' 'arguments')
!
(reader addClassMethod: 'instance creation')
!
receiver: aNode {Expression} selector: aSymbol {Str} argument: argNode1 {Expression} {^Instance}
	^self
		receiver: aNode
		selector: aSymbol
		arguments: (Array with: argNode1)
!
(reader addClassMethod: 'instance creation')
!
receiver: aNode {Expression} selector: aString {String} arguments: anArray {Arr[Expression]} {^Instance}
	^self new initializeReceiver: aNode selector: aString arguments: anArray
!
