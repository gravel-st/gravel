(reader defineClass: 'GlobalReadNode' superclass: 'st.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'namespace' type: 'AbsoluteReference')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitGlobalReadNode: self
!
(reader addMethod: 'testing')
!
globalNamespace {^AbsoluteReference}
	^namespace
!
(reader addMethod: 'testing')
!
globalVarName {^Str}
	^name
!
(reader addMethod: 'initialize-release')
!
initializeNamespace: aReference {AbsoluteReference} name: aString {Str} {^Self}
	namespace := aReference.
	name := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	aStream
		nextPutAll: name;
		nextPutAll: '}'
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
namespace {^AbsoluteReference}
	^namespace
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^name = aString
!
(reader addClassMethod: 'instance creation')
!
namespace: aReference {AbsoluteReference} name: aString {Str} {^GlobalReadNode}
	^self new initializeNamespace: aReference name: aString
!
