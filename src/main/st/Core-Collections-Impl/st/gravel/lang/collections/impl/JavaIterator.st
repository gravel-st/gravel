(reader defineClass: 'JavaIterator' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.util.Iterator')
!
(reader addMethod: '')
!
java_hasNext
	<primitive: 'hasNext'>
	
!
(reader addMethod: '')
!
java_next
	<primitive: 'next'>
	
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
