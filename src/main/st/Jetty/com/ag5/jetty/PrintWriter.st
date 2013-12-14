(reader defineClass: 'PrintWriter' superclass: 'org.gravel.lang.WriteStream')
!
(reader propertyAt: 'javaClass' put: 'java.io.PrintWriter')
!
(reader addMethod: 'gravel')
!
java_print: aString
	<primitive: 'print'>
	
!
(reader addMethod: 'gravel')
!
nextPut: aCharacter
	<primitive: 'print'>
	
!
(reader addMethod: 'gravel')
!
nextPutAll: aString
	self java_print: aString asString
!
