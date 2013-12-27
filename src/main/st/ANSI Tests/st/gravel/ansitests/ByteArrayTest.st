(reader defineClass: 'ByteArrayTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #[].
	aBlock value: #[0 255 127 128 0]
!
