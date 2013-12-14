(reader defineClass: 'NonLocalReturnRewriter' superclass: 'org.gravel.parser.NodeCopier')
!
(reader addInstVar: 'nlrMarker')
!
(reader addInstVar: 'isInBlockNode')
!
(reader addInstVar: 'oldNlrMarker')
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	isInBlockNode := false
!
(reader addMethod: 'initialize-release')
!
initializeNlrMarker: aString {Str} {^Self}
	nlrMarker := aString.
	self initialize
!
(reader addMethod: 'accessing')
!
nlrMarker {^Str}
	^nlrMarker
!
(reader addMethod: 'visiting')
!
produceNlrMarkerDefinition: aString {Str} for: aMethodNode {MethodNode} {^Str}
	oldNlrMarker := aString.
	^aMethodNode hasNonLocalReturns ifTrue: [nlrMarker] ifFalse: [nil]
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^BlockNode}
	| old {Bool} bn {BlockNode} |
	old := isInBlockNode.
	isInBlockNode := true.
	bn := super visitBlockNode: anObject.
	isInBlockNode := old.
	^bn
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^Statement}
	oldNlrMarker = anObject marker
		ifTrue: 
			[isInBlockNode ifFalse: [^ReturnNode value: (self visit: anObject value)].
			^NonLocalReturnNode marker: nlrMarker value: (self visit: anObject value)].
	^NonLocalReturnNode marker: anObject marker value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitReturnNode: aReturnNode {ReturnNode} {^Statement}
	isInBlockNode
		ifTrue: [^NonLocalReturnNode marker: nlrMarker value: (self visit: aReturnNode value)].
	^super visitReturnNode: aReturnNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String, Bool, Str | Nil]}
	^#('nlrMarker' 'isInBlockNode' 'oldNlrMarker')
!
(reader addClassMethod: 'instance creation')
!
nlrMarker: aString {Str} {^NonLocalReturnRewriter}
	^self new initializeNlrMarker: aString
!
