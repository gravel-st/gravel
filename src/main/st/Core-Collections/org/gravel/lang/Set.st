(reader defineClass: 'Set' superclass: 'org.gravel.lang.CollectionImpl')
!
(reader propertyAt: 'javaClass' put: 'java.util.HashSet')
!
(reader addMethod: 'gravel')
!
add: anObject
	self java_add: anObject.
	^anObject
!
(reader addMethod: 'gravel')
!
java_add: anObject
	<primitive: #('java.util.HashSet' 'add')>
	
!
(reader addMethod: 'gravel')
!
size
	<primitive: 'size'>
	
!
