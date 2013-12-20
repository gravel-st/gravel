(reader defineClass: 'PopFrame' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
accept: visitor
	^visitor visitPopFrame: self
!
