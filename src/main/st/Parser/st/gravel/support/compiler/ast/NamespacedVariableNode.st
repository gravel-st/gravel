(reader defineClass: 'NamespacedVariableNode' superclass: 'st.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'path' type: 'Array[String]')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [path = anObject path]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNamespacedVariableNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: path hash
!
(reader addMethod: 'initialize-release')
!
initializePath: anArray {Array[String]} {^Self}
	path := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	path do: [:elem {Str} | aStream nextPutAll: elem] separatedBy: [aStream nextPut: $.]
!
(reader addMethod: 'accessing')
!
name {^Str}
	^path last
!
(reader addMethod: 'As yet unclassified')
!
needsBrackets {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
path {^Array[String]}
	^path
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^0
!
(reader addMethod: 'accessing')
!
reference {^AbsoluteReference}
	^AbsoluteReference path: (path collect: [:each {Str} | each asSymbol])
!
(reader addClassMethod: 'instance creation')
!
path: anArray {Array[String]} {^Instance}
	^self new initializePath: anArray
!
