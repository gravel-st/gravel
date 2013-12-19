(reader defineClass: 'MetaclassMirror' superclass: 'st.gravel.lang.ClassDescriptionMirror')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.MetaclassMirror')
!
(reader addMethod: 'gravel')
!
meta
	^self
!
(reader addMethod: '')
!
name
	<primitive: 'name'>
	
!
(reader addMethod: '')
!
nonmeta
	<primitive: 'nonmeta'>
	
!
