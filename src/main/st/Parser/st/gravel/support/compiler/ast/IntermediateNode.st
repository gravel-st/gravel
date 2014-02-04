(reader defineClass: 'IntermediateNode' superclass: 'st.gravel.support.compiler.ast.Expression')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIntermediateNode: self
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^4
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: self class name;
		space.
	self innerSourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^self subclassResponsibility
!
