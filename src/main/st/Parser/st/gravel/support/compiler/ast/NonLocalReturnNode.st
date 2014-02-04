(reader defineClass: 'NonLocalReturnNode' superclass: 'st.gravel.support.compiler.ast.IntermediateStatement')
!
(reader addInstVar: 'marker' type: 'String')
!
(reader addInstVar: 'value' type: 'Expression')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [marker = anObject marker and: [value = anObject value]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNonLocalReturnNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: marker hash) bitXor: value hash
!
(reader addMethod: 'As yet unclassified')
!
hasReturnStatements {^Bool}
	^true
!
(reader addMethod: 'initialize-release')
!
initializeMarker: anObject {Str} value: anExpression {Expression} {^Self}
	marker := anObject.
	value := anExpression.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{(return to '.
	aStream nextPutAll: marker.
	aStream nextPutAll: ') '.
	aStream nextPut: $^.
	value sourceOn: aStream.
	aStream nextPutAll: '}'
!
(reader addMethod: 'testing')
!
isNonLocalReturnNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isReturnNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isTraitRequirementMessage {^Bool}
	^value isTraitRequirementMessage
!
(reader addMethod: 'accessing')
!
marker {^Str}
	^marker
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: value
!
(reader addMethod: 'testing')
!
returnValue {^Expression}
	^value
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self innerSourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Statement}
	^ReturnNode value: value
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addClassMethod: 'instance creation')
!
marker: anObject {Str} value: anExpression {Expression} {^Instance}
	^self new initializeMarker: anObject value: anExpression
!
