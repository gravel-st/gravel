(reader defineClass: 'IntegerLiteralNode' superclass: 'st.gravel.support.compiler.ast.NumberLiteralNode')
!
(reader addInstVar: 'integer' type: 'LargeInteger')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [integer = anObject integer]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIntegerLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: integer hash
!
(reader addMethod: 'initialize-release')
!
initializeInteger: anInteger {LargeInteger} {^Self}
	integer := anInteger.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream print: integer
!
(reader addMethod: 'accessing')
!
integer {^LargeInteger}
	^integer
!
(reader addMethod: 'As yet unclassified')
!
isIntegerLiteralNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
negated {^IntegerLiteralNode}
	^IntegerLiteralNode integer: integer negated
!
(reader addMethod: 'accessing')
!
value {^Object}
	^integer compressed
!
(reader addClassMethod: 'instance creation')
!
integer: anInteger {LargeInteger} {^Instance}
	^self new initializeInteger: anInteger
!
