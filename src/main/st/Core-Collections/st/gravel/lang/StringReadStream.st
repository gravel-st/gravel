(reader defineClass: 'StringReadStream' superclass: 'st.gravel.lang.ReadStream')
!
(reader propertyAt: 'javaClass' put: 'java.nio.CharBuffer')
!
(reader addMethod: '')
!
atEnd
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'atEnd')>
	
!
(reader addMethod: '')
!
next
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'next')>
	
!
(reader addMethod: '')
!
next: anInteger
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'next_')>
	
!
(reader addMethod: '')
!
peek
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'peek')>
	
!
(reader addMethod: '')
!
peekFor: aCharacter
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'peekFor_')>
	
!
(reader addMethod: '')
!
position
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'position')>
	
!
(reader addMethod: '')
!
skip: anInteger
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'skip_')>
	
!
(reader addMethod: '')
!
upTo: aCharacter
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'upTo_')>
	
!
