(reader defineClass: 'InlineExpressionCollection' superclass: 'org.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'expressions')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitInlineExpressionCollection: self
!
(reader addMethod: 'accessing')
!
expressions {^Arr[Expression]}
	^expressions
!
(reader addMethod: 'initialize-release')
!
initializeExpressions: anArray {Arr[Expression]} {^Self}
	expressions := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	expressions do: [:each {Expression} | each innerSourceOn: aStream]
		separatedBy: [aStream nextPutAll: '. '].
	aStream nextPutAll: ']}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	expressions do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^nil
!
(reader addClassMethod: 'instance creation')
!
expressions: anArray {Arr[Expression]} {^Instance}
	^self new initializeExpressions: anArray
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[Expression]]}
	^#('expressions')
!
