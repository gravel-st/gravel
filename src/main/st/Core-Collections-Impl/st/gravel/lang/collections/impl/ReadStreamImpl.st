(reader defineClass: 'ReadStreamImpl' superclass: 'st.gravel.lang.collections.impl.PositionableStreamImpl')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ReadStream class')
!
(reader addMethod: 'testing')
!
atEnd
	^position >= collection size
!
(reader addMethod: 'accessing')
!
collection
	^collection
!
(reader addMethod: 'accessing')
!
contents
	^collection
!
(reader addMethod: 'accessing')
!
position
	^position
!
(reader addMethod: 'positioning')
!
position: aPosition
	position := aPosition
!
(reader addMethod: 'positioning')
!
setToEnd
	position := collection size
!
