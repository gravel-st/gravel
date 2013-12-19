(reader defineClass: 'StringWriteStream' superclass: 'st.gravel.lang.WriteStream')
!
(reader propertyAt: 'javaClass' put: 'java.lang.StringBuilder')
!
(reader addMethod: '')
!
contents
	<primitive: 'toString'>
	
!
(reader addMethod: '')
!
nextPut: aCharacter
	<primitive: #('st.gravel.support.jvm.WriteStreamExtensions' 'nextPut_')>
	
!
(reader addMethod: '')
!
nextPutAll: aString
	<primitive: #('st.gravel.support.jvm.WriteStreamExtensions' 'nextPutAll_')>
	
!
(reader addMethod: '')
!
position
	<primitive: #('st.gravel.support.jvm.WriteStreamExtensions' 'position')>
	
!
