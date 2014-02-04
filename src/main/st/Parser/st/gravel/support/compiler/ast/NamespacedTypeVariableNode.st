(reader defineClass: 'NamespacedTypeVariableNode' superclass: 'st.gravel.support.compiler.ast.TypeNode')
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
	^visitor visitNamespacedTypeVariableNode: self
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
	path do: [:each {String} | aStream nextPutAll: each] separatedBy: [aStream nextPut: $.]
!
(reader addMethod: 'accessing')
!
path {^Array[String]}
	^path
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	
!
(reader addClassMethod: 'instance creation')
!
path: anArray {Array[String]} {^Instance}
	^self new initializePath: anArray
!
(reader addClassMethod: 'instance creation')
!
testCase {^NamespacedTypeVariableNode}
	^self path: #('XProgramming' 'SUnit' 'TestCase')
!
