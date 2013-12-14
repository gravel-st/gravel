(reader defineClass: 'ClassMirror' superclass: 'org.gravel.lang.ClassDescriptionMirror')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.ClassMirror')
!
(reader addMethod: 'gravel')
!
meta
	<primitive: 'meta'>
	
!
(reader addMethod: 'gravel')
!
name
	<primitive: 'name'>
	
!
(reader addMethod: 'gravel')
!
nonmeta
	^self
!
