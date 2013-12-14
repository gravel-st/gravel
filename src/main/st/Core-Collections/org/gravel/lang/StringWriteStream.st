(reader defineClass: 'StringWriteStream' superclass: 'org.gravel.lang.WriteStream')
!
(reader propertyAt: 'javaClass' put: 'java.lang.StringBuilder')
!
(reader addMethod: 'gravel')
!
contents
	<primitive: 'toString'>
	
!
(reader addMethod: 'gravel')
!
nextPut: aCharacter
	<primitive: #('org.gravel.support.jvm.WriteStreamExtensions' 'nextPut_')>
	
!
(reader addMethod: 'gravel')
!
nextPutAll: aString
	<primitive: #('org.gravel.support.jvm.WriteStreamExtensions' 'nextPutAll_')>
	
!
(reader addMethod: 'gravel')
!
position
	<primitive: #('org.gravel.support.jvm.WriteStreamExtensions' 'position')>
	
!
