(reader defineClass: 'PrintWriter' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.WriteStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.WriteStream class')
!
(reader propertyAt: 'javaClass' put: 'java.io.PrintWriter')
!
(reader addMethod: 'gravel')
!
java_print: aString
	<primitive: 'print'>
	
!
(reader addMethod: 'accessing')
!
nextPut: aCharacter
	<primitive: 'print'>
	
!
(reader addMethod: 'accessing')
!
nextPutAll: aString
	self java_print: aString asString
!
