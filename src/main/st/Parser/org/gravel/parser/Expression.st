(reader defineClass: 'Expression' superclass: 'org.gravel.parser.Statement')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitExpression: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
needsBrackets {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
precedence {^Int}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
send: aSelector {Str} {^UnaryMessageNode}
	^UnaryMessageNode receiver: self selector: aSelector
!
(reader addMethod: 'As yet unclassified')
!
send: aSymbol {Str} with: argNode1 {Expression} {^Expression}
	^self send: aSymbol withAll: (Array with: argNode1)
!
(reader addMethod: 'As yet unclassified')
!
send: aSymbol {Str} with: argNode1 {Expression} with: argNode2 {Expression} {^Expression}
	^self send: aSymbol withAll: (Array with: argNode1 with: argNode2)
!
(reader addMethod: 'As yet unclassified')
!
send: aSymbol {Str} with: argNode1 {Expression} with: argNode2 {Expression} with: argNode3 {Expression} {^Expression}
	^self send: aSymbol withAll: (Array with: argNode1 with: argNode2 with: argNode3)
!
(reader addMethod: 'As yet unclassified')
!
send: aSymbol {Str} withAll: anArray {Arr[Expression]} {^Expression}
	^KeywordMessageNode receiver: self selector: aSymbol arguments: anArray
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self needsBrackets ifFalse: [^self innerSourceOn: aStream].
	aStream nextPut: $(.
	self innerSourceOn: aStream.
	aStream nextPut: $)
!
