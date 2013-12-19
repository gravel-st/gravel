(reader defineClass: 'Set' superclass: 'st.gravel.lang.CollectionImpl')
!
(reader propertyAt: 'javaClass' put: 'java.util.HashSet')
!
(reader addMethod: 'gravel')
!
add: anObject
	self java_add: anObject.
	^anObject
!
(reader addMethod: '')
!
java_add: anObject
	<primitive: 'add'>
	
!
(reader addMethod: '')
!
size
	<primitive: 'size'>
	
!
