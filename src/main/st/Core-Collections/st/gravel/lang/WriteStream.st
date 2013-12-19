(reader defineClass: 'WriteStream' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.CharacterWriteable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.CharacterWriteable class')
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
(reader addClassMethod: '')
!
on: aCollection
	<primitive: #('st.gravel.support.jvm.WriteStreamFactory' 'on_')>
	
!
