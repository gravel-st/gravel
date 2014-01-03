(reader defineClass: 'Class' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.ObjectClass')
!
(reader addMethod: 'testing')
!
isBehavior
	^true
!
(reader addMethod: 'As yet unclassified')
!
name
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'classTitle')>
	
!
