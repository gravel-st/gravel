(reader defineClass: 'JavaConcurrentLinkedQueue' superclass: 'org.gravel.lang.CollectionImpl')
!
(reader propertyAt: 'javaClass' put: 'java.util.concurrent.ConcurrentLinkedQueue')
!
(reader addMethod: 'gravel')
!
add: aValue
	self java_add: aValue.
	^aValue
!
(reader addMethod: 'testing')
!
isEmpty
	<primitive: 'isEmpty'>
	
!
(reader addMethod: 'private')
!
java_add: value
	<primitive: 'add'>
	
!
(reader addMethod: 'accessing')
!
next
	<primitive: 'remove'>
	
!
(reader addMethod: 'accessing')
!
nextAvailable
	<primitive: 'poll'>
	
!
(reader addMethod: 'accessing')
!
nextPut: aValue
	self java_add: aValue
!
(reader addMethod: 'testing')
!
peek
	<primitive: 'peek'>
	
!
(reader addMethod: 'accessing')
!
size
	<primitive: 'size'>
	
!
