(reader defineClass: 'SuperNode' superclass: 'org.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'reference')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSuperNode: self
!
(reader addMethod: 'initialize-release')
!
initializeReference: aReference {Reference} {^Self}
	reference := aReference.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: '{(super of ';
		nextPutAll: reference printString;
		nextPutAll: ') super}'
!
(reader addMethod: 'testing')
!
isSuperNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	aBlock value: 'super'
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^'super'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^reference
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^aString = 'super'
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Reference]}
	^#('reference')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} {^Instance}
	^self new initializeReference: anAbsoluteReference
!
