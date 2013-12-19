(reader defineClass: 'ObjectMirror' superclass: 'st.gravel.lang.Mirror')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.ObjectMirror')
!
(reader addMethod: '')
!
classMirror
	<primitive: 'getClassMirror'>
	
!
