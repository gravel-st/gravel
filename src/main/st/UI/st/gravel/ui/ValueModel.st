(reader defineClass: 'ValueModel' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'listeners')
!
(reader addMethod: 'gravel')
!
contentsChanged: elem
	listeners do: [:each | each value: elem]
!
(reader addMethod: 'gravel')
!
executeWhenChanged: aBlock
	self whenChanged: aBlock.
	aBlock value: self value
!
(reader addMethod: 'gravel')
!
initialize
	listeners := OrderedCollection new
!
(reader addMethod: 'gravel')
!
whenChanged: aBlock
	listeners add: aBlock
!
