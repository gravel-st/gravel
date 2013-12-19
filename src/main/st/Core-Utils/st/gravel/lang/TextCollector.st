(reader defineClass: 'TextCollector' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.CharacterWriteable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.CharacterWriteable class')
!
(reader addInstVar: 'outputs')
!
(reader addClassInstVar: 'outputs')
!
(reader addMethod: 'gravel')
!
addHandler: aBlock
	outputs isNil ifTrue: [^self].
	outputs add: (TranscriptWrapper block: aBlock)
!
(reader addMethod: 'gravel')
!
addOutput: anOutput
	outputs add: anOutput
!
(reader addMethod: 'gravel')
!
allOutputsDo: aBlock
	outputs isNil ifFalse: [outputs do: aBlock]
!
(reader addMethod: 'gravel')
!
initialize
	outputs := OrderedCollection with: Stdout new
!
(reader addMethod: 'gravel')
!
nextPut: aCharacter
	self show: (String with: aCharacter)
!
(reader addMethod: 'gravel')
!
nextPutAll: aString
	self show: aString asString
!
(reader addMethod: 'gravel')
!
show: aString
	self allOutputsDo: [:each | each show: aString]
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
