(reader defineClass: 'ObjectMirror' superclass: 'org.gravel.lang.Mirror')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.ObjectMirror')
!
(reader addMethod: 'gravel')
!
classMirror
	<primitive: 'getClassMirror'>
	
!
