(reader defineClass: 'Node' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'sourcePosition')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self class = anObject class
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNode: self
!
(reader addMethod: 'As yet unclassified')
!
allLocalVarNames {^Set[Str]}
	| s {Set[Str]} |
	s := Set new.
	self withAllNodesDo: [:n {Node} | n localVarNamesDo: [:nm {Str} | s add: nm]].
	^s
!
(reader addMethod: 'As yet unclassified')
!
allNodesContains: aBlock {[Node, ^Bool]} {^Bool}
	self allNodesDo: [:each {Node} | (aBlock value: each) ifTrue: [^true]].
	^false
!
(reader addMethod: 'As yet unclassified')
!
allNodesDo: aBlock {[Node, ^Object]} {^Self}
	self nodesDo: [:each {Node} | each withAllNodesDo: aBlock]
!
(reader addMethod: 'As yet unclassified')
!
allNodesDo: aBlock {[Node, ^Object]} pruneWhere: pruneBlock {[Node, ^Bool]} {^Self}
	self nodesDo: 
			[:each {Node} |
			(pruneBlock value: each) ifFalse: [each withAllNodesDo: aBlock pruneWhere: pruneBlock]]
!
(reader addMethod: 'comparing')
!
comment {^Arr[Str] | Nil}
	^#()
!
(reader addMethod: 'printing')
!
getDiskSource {^Str | Nil}
	sourcePosition isNil ifTrue: [^nil].
	^sourcePosition sourceFile asFile contentsFrom: sourcePosition start
		to: sourcePosition stop
!
(reader addMethod: 'testing')
!
globalNamespace {^AbsoluteReference}
	^nil
!
(reader addMethod: 'testing')
!
globalVarName {^Str}
	^nil
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^3434
!
(reader addMethod: 'testing')
!
hasReturnStatements {^Bool}
	self nodesDo: [:each {Node} | each hasReturnStatements ifTrue: [^true]].
	^false
!
(reader addMethod: 'As yet unclassified')
!
hasSuperSend {^Bool}
	^self allNodesContains: [:each {Node} | each isSuperNode]
!
(reader addMethod: 'testing')
!
hierarchyReferencesSelfOrInstanceType {^Bool}
	self withAllNodesDo: [:node {Node} | node referencesSelfOrInstanceType ifTrue: [^true]].
	^false
!
(reader addMethod: 'testing')
!
hierarchyReferencesVariable: aString {Str} {^Bool}
	self withAllNodesDo: [:node {Node} | (node referencesVariable: aString) ifTrue: [^true]].
	^false
!
(reader addMethod: 'testing')
!
isArrayLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isAssignable {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isAssignmentNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isBlockNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isBlockNodeWithReturnStatements {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isBlockTypeNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isBooleanLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isBottomTypeNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isByteArrayLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isCharacterLiteralNode {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isCreateHolderNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isFixedPointLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isGenericTypeVariableNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isIntegerLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isMessageNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isMetaNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isNilLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isNonLocalReturnNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isReturnNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSelfNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSelfTypeNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSequenceNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSPNode
	^true
!
(reader addMethod: 'testing')
!
isStringLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSuperNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isSymbolLiteralNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isTypeDefNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isTypeVariableNode {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isVariableNode {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'accessing')
!
packageName {^Sym | Nil}
	sourcePosition isNil ifTrue: [^nil].
	^sourcePosition sourceFile packageName
!
(reader addMethod: 'printing')
!
prettySourceOn: aStream {WStream[Char]} {^Self}
	(SourcePrinter on: aStream) visit: self
!
(reader addMethod: 'printing')
!
prettySourceString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self prettySourceOn: aStream.
	^aStream contents
!
(reader addMethod: 'accessing')
!
printOn: aStream {WStream[Char]} {^Self}
	| title {Str} |
	title := self class printString.
	aStream nextPutAll: ((title at: 1) isVowel ifTrue: ['an '] ifFalse: ['a ']).
	aStream nextPutAll: title.
	aStream nextPut: $[.
	self sourceOn: aStream.
	aStream nextPut: $]
!
(reader addMethod: 'printing')
!
printString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	aStream nextPutAll: self class printString.
	aStream nextPut: $[.
	self sourceOn: aStream.
	aStream nextPut: $].
	^aStream contents
!
(reader addMethod: 'testing')
!
pvtSetSourcePosition: aSourcePosition {SourcePosition} {^Self}
	sourcePosition := aSourcePosition
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^false
!
(reader addMethod: 'testing')
!
returnValue {^Expression}
	^nil
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
sourcePosition {^SourcePosition}
	^sourcePosition
!
(reader addMethod: 'printing')
!
sourceString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self sourceOn: aStream.
	^aStream contents
!
(reader addMethod: 'As yet unclassified')
!
withAllNodesDo: aBlock {[Node, ^Object]} {^Self}
	aBlock value: self.
	self allNodesDo: aBlock
!
(reader addMethod: 'As yet unclassified')
!
withAllNodesDo: aBlock {[Node, ^Object]} pruneWhere: pruneBlock {[Node, ^Bool]} {^Self}
	aBlock value: self.
	self allNodesDo: aBlock pruneWhere: pruneBlock
!
(reader addMethod: 'As yet unclassified')
!
withoutSourcePointers {^Node}
	^SourcePointerRemover visit: self
!
(reader addMethod: 'testing')
!
withSourcePosition: aSourcePosition {SourcePosition} {^Self}
	sourcePosition == aSourcePosition ifTrue: [^self].
	^self copy pvtSetSourcePosition: aSourcePosition
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SourcePosition]}
	^#('sourcePosition')
!
(reader addClassMethod: 'accessing')
!
toolListIcon
	^Tools.BehaviorIcons Point
!
