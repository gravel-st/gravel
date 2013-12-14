(reader defineClass: 'StringReadStream' superclass: 'org.gravel.lang.ReadStream')
!
(reader propertyAt: 'javaClass' put: 'java.nio.CharBuffer')
!
(reader addMethod: 'As yet unclassified')
!
atEnd
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'atEnd')>
	
!
(reader addMethod: 'As yet unclassified')
!
next
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'next')>
	
!
(reader addMethod: 'As yet unclassified')
!
next: anInteger
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'next_')>
	
!
(reader addMethod: 'As yet unclassified')
!
peek
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'peek')>
	
!
(reader addMethod: 'As yet unclassified')
!
peekFor: aCharacter
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'peekFor_')>
	
!
(reader addMethod: 'As yet unclassified')
!
position
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'position')>
	
!
(reader addMethod: 'As yet unclassified')
!
skip: anInteger
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'skip_')>
	
!
(reader addMethod: 'As yet unclassified')
!
upTo: aCharacter
	<primitive: #('org.gravel.support.jvm.ReadStreamExtensions' 'upTo_')>
	
!
