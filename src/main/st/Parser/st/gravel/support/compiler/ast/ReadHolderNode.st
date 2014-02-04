(reader defineClass: 'ReadHolderNode' superclass: 'st.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'varName' type: 'String')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [varName = anObject varName]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitReadHolderNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: varName hash
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {String} {^Self}
	varName := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: '{';
		nextPutAll: varName;
		nextPutAll: ' value}'
!
(reader addMethod: 'testing')
!
isVariableNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	aBlock value: varName
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^varName
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^varName = aString
!
(reader addMethod: 'accessing')
!
varName {^String}
	^varName
!
(reader addClassMethod: 'instance creation')
!
varName: aString {String} {^Instance}
	^self new initializeVarName: aString
!
