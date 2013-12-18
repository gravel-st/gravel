(reader defineClass: 'BooleanAndNode' superclass: 'org.gravel.support.compiler.ast.BooleanBinaryNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBooleanAndNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	left sourceOn: aStream.
	aStream nextPutAll: ' and: ['.
	right sourceOn: aStream.
	aStream nextPutAll: ']'
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^BinaryMessageNode
		receiver: left
		selector: 'and:'
		argument: (BlockNode body: right)
!
