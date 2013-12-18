(reader defineClass: 'PragmaNode' superclass: 'org.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'expression')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [expression = anObject expression]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitPragmaNode: self
!
(reader addMethod: 'accessing')
!
expression {^MessageNode}
	^expression
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: expression hash
!
(reader addMethod: 'initialize-release')
!
initializeExpression: aKeywordMessageNode {MessageNode} {^Self}
	expression := aKeywordMessageNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isPropertyPragmaAt: aKey {Sym} {^Bool}
	^expression selector = 'propertyAt:put:' and: 
			[expression arguments first isSymbolLiteralNode
				and: [({SymbolLiteralNode} expression arguments first) value = aKey]]
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
pvtSetExpression: aMessageNode {MessageNode} {^Self}
	expression := aMessageNode
!
(reader addMethod: 'As yet unclassified')
!
selector {^Str}
	^expression selector
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $<.
	expression innerSourceSendOn: aStream.
	aStream nextPut: $>
!
(reader addMethod: 'As yet unclassified')
!
withArguments: anArray {Arr[Expression]} {^Self}
	^self withExpression: (expression withArguments: anArray)
!
(reader addMethod: 'As yet unclassified')
!
withExpression: aMessageNode {MessageNode} {^Self}
	^self copy pvtSetExpression: aMessageNode
!
(reader addClassMethod: 'instance creation')
!
expression: aMessageNode {MessageNode} {^Instance}
	^self new initializeExpression: aMessageNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[MessageNode]}
	^#('expression')
!
