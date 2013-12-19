(reader defineClass: 'WriteStream' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.CharacterWriteable')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.CharacterWriteable class')
!
(reader addMethod: 'gravel')
!
nextPut: aCharacter
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
nextPutAll: aString
	aString do: [:ch | self nextPut: ch]
!
(reader addMethod: 'gravel')
!
position
	self subclassResponsibility
!
(reader addClassMethod: 'gravel')
!
on: aCollection
	<primitive: #('org.gravel.support.jvm.WriteStreamFactory' 'on_')>
	
!
