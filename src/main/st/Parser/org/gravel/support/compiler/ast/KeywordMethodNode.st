(reader defineClass: 'KeywordMethodNode' superclass: 'org.gravel.support.compiler.ast.MethodNode')
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
	^visitor visitKeywordMethodNode: self
!
(reader addMethod: 'accessing')
!
arguments {^Array[VariableDeclarationNode]}
	^arguments
!
(reader addMethod: 'As yet unclassified')
!
argumentsDo: aBlock {[VariableDeclarationNode, ^Object]}
	arguments do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteArgumentSignature {^Boolean}
	^arguments allSatisfy: [:elem {VariableDeclarationNode} | elem type notNil]
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: arguments hash
!
(reader addMethod: 'initialize-release')
!
initializeSelector: aString {String} arguments: anArray {Array[VariableDeclarationNode]} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray2 {Array[PragmaNode]} protocol: protocolString {Str} nlrMarker: nlrMarkerString {Str} {^Self}
	selector := aString.
	arguments := anArray.
	body := aSequenceNode.
	returnType := anUndefinedObject.
	pragmas := anArray2.
	protocol := protocolString.
	nlrMarker := nlrMarkerString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: body.
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
sourceOn: aStream {WStream[Char]} {^Self}
	| keywords {Arr[Str]} |
	keywords := selector tokensBasedOn: $:.
	1 to: arguments size
		do: 
			[:i {Int} |
			| keyword {String} argument {VariableDeclarationNode} |
			keyword := keywords at: i.
			argument := arguments at: i.
			i = 1 ifFalse: [aStream space].
			aStream
				nextPutAll: keyword;
				nextPut: $:;
				space.
			argument sourceOn: aStream].
	self returnTypeAndBodySourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	arguments do: [:each {VariableDeclarationNode} | each typeDefsDo: aBlock].
	returnType isNil ifFalse: [returnType typeDefsDo: aBlock]
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Array[VariableDeclarationNode]]}
	^#('arguments')
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} arguments: anArray {Array[VariableDeclarationNode]} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray2 {Array[PragmaNode]} protocol: protocol {Str} {^Instance}
	^self
		selector: aString
		arguments: anArray
		body: aSequenceNode
		returnType: anUndefinedObject
		pragmas: anArray2
		protocol: protocol
		nlrMarker: nil
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} arguments: anArray {Array[VariableDeclarationNode]} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray2 {Array[PragmaNode]} protocol: protocol {Str} nlrMarker: nlrMarker {Str} {^Instance}
	^self new
		initializeSelector: aString
		arguments: anArray
		body: aSequenceNode
		returnType: anUndefinedObject
		pragmas: anArray2
		protocol: protocol
		nlrMarker: nlrMarker
!
