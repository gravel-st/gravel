(reader defineClass: 'BinaryMethodNode' superclass: 'org.gravel.support.compiler.ast.MethodNode')
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
	^visitor visitBinaryMethodNode: self
!
(reader addMethod: 'accessing')
!
argument {^VariableDeclarationNode}
	^argument
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[VariableDeclarationNode]}
	^Array with: argument
!
(reader addMethod: 'As yet unclassified')
!
argumentsDo: aBlock {[VariableDeclarationNode, ^Object]}
	aBlock value: argument
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteArgumentSignature {^Boolean}
	^argument type notNil
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: argument hash
!
(reader addMethod: 'initialize-release')
!
initializeSelector: aString {String} argument: aVariableDeclarationNode {VariableDeclarationNode} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocolString {Str} nlrMarker: nlrMarkerString {Str} {^Self}
	selector := aString.
	argument := aVariableDeclarationNode.
	body := aSequenceNode.
	returnType := anUndefinedObject.
	pragmas := anArray.
	protocol := protocolString.
	nlrMarker := nlrMarkerString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: body.
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
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: selector;
		space.
	argument sourceOn: aStream.
	self returnTypeAndBodySourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	argument typeDefsDo: aBlock.
	returnType isNil ifFalse: [returnType typeDefsDo: aBlock]
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[VariableDeclarationNode]}
	^#('argument')
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} argument: aVariableDeclarationNode {VariableDeclarationNode} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocol {Str} {^Instance}
	^self
		selector: aString
		argument: aVariableDeclarationNode
		body: aSequenceNode
		returnType: anUndefinedObject
		pragmas: anArray
		protocol: protocol
		nlrMarker: nil
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} argument: aVariableDeclarationNode {VariableDeclarationNode} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocol {Str} nlrMarker: nlrMarker {Str} {^Instance}
	^self new
		initializeSelector: aString
		argument: aVariableDeclarationNode
		body: aSequenceNode
		returnType: anUndefinedObject
		pragmas: anArray
		protocol: protocol
		nlrMarker: nlrMarker
!
