(reader defineClass: 'WhileFalseNode' superclass: 'st.gravel.support.compiler.ast.WhileNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitWhileFalseNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{['.
	testSequence sourceOn: aStream.
	aStream nextPutAll: '] whileFalse: ['.
	doSequence sourceOn: aStream.
	aStream nextPutAll: ']}'
!
