(reader defineClass: 'BooleanOrNode' superclass: 'st.gravel.support.compiler.ast.BooleanBinaryNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBooleanOrNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	left sourceOn: aStream.
	aStream nextPutAll: ' or: ['.
	right sourceOn: aStream.
	aStream nextPutAll: ']'
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^BinaryMessageNode
		receiver: left
		selector: 'or:'
		argument: (BlockNode body: right)
!
