(reader defineClass: 'ReferenceLiteralNode' superclass: 'st.gravel.support.compiler.ast.LiteralNode')
!
(reader addInstVar: 'path')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitReferenceLiteralNode: self
!
(reader addMethod: 'initialize-release')
!
initializePath: anArray {Arr[Str]} {^Self}
	path := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '#{'.
	path do: [:each {Str} | aStream nextPutAll: each] separatedBy: [aStream nextPut: $.].
	aStream nextPut: $}
!
(reader addMethod: 'accessing')
!
path {^Arr[Str]}
	^path
!
(reader addMethod: 'accessing')
!
value {^Object}
	^path
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[Str]]}
	^#('path')
!
(reader addClassMethod: 'instance creation')
!
path: anArray {Arr[Str]} {^Instance}
	^self new initializePath: anArray
!
