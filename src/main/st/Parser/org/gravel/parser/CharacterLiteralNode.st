(reader defineClass: 'CharacterLiteralNode' superclass: 'org.gravel.parser.LiteralNode')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [value = anObject value]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitCharacterLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeValue: aCharacter {Character} {^Self}
	value := aCharacter.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPut: $$;
		nextPut: value
!
(reader addMethod: 'As yet unclassified')
!
isCharacterLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^Character}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Character]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aCharacter {Character} {^Instance}
	^self new initializeValue: aCharacter
!
