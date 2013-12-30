(reader defineClass: 'JavaStringBuilder' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.WriteStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.WriteStream class')
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
(reader addClassMethod: 'constants')
!
on: aString
	<primitive: #('st.gravel.support.jvm.WriteStreamFactory' 'on_')>
	
!
