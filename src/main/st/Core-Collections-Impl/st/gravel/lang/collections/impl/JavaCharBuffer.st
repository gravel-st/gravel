(reader defineClass: 'JavaCharBuffer' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ReadStream class')
!
(reader propertyAt: 'javaClass' put: 'java.nio.CharBuffer')
!
(reader addMethod: '')
!
atEnd
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'atEnd')>
	
!
(reader addMethod: 'accessing')
!
contents
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'contents')>
	
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
(reader addMethod: 'positioning')
!
position: aPosition
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'position_')>
	
!
(reader addMethod: 'positioning')
!
reset
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'reset')>
	
!
(reader addMethod: 'positioning')
!
setToEnd
	<primitive: #('st.gravel.support.jvm.ReadStreamExtensions' 'setToEnd')>
	
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
(reader addClassMethod: 'constants')
!
on: aString
	<primitive: #('st.gravel.support.jvm.ReadStreamFactory' 'on_')>
	
!
