(reader defineClass: 'JavaConcurrentLinkedQueue' superclass: 'st.gravel.lang.collections.impl.JavaCollection')
!
(reader propertyAt: 'javaClass' put: 'java.util.concurrent.ConcurrentLinkedQueue')
!
(reader addMethod: 'gravel')
!
add: aValue
	self java_add: aValue.
	^aValue
!
(reader addMethod: '')
!
isEmpty
	<primitive: 'isEmpty'>
	
!
(reader addMethod: '')
!
java_add: value
	<primitive: 'add'>
	
!
(reader addMethod: '')
!
next
	<primitive: 'remove'>
	
!
(reader addMethod: '')
!
nextAvailable
	<primitive: 'poll'>
	
!
(reader addMethod: 'accessing')
!
nextPut: aValue
	self java_add: aValue
!
(reader addMethod: '')
!
peek
	<primitive: 'peek'>
	
!
(reader addMethod: '')
!
size
	<primitive: 'size'>
	
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
