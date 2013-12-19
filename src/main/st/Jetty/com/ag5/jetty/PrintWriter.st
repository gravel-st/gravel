(reader defineClass: 'PrintWriter' superclass: 'st.gravel.lang.WriteStream')
!
(reader propertyAt: 'javaClass' put: 'java.io.PrintWriter')
!
(reader addMethod: '')
!
java_print: aString
	<primitive: 'print'>
	
!
(reader addMethod: '')
!
nextPut: aCharacter
	<primitive: 'print'>
	
!
(reader addMethod: 'gravel')
!
nextPutAll: aString
	self java_print: aString asString
!
