(reader defineClass: 'WhileTrueNode' superclass: 'org.gravel.parser.WhileNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitWhileTrueNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{['.
	testSequence sourceOn: aStream.
	doSequence isNil
		ifTrue: [aStream nextPutAll: '] whileTrue}']
		ifFalse: 
			[aStream nextPutAll: '] whileTrue: ['.
			doSequence sourceOn: aStream.
			aStream nextPutAll: ']}']
!
