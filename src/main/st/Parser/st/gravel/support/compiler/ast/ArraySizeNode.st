(reader defineClass: 'ArraySizeNode' superclass: 'st.gravel.support.compiler.ast.ArrayAccessNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitArraySizeNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	receiver sourceOn: aStream.
	aStream nextPutAll: ' size}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: receiver
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^receiver send: 'size'
!
