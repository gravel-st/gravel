(reader defineClass: 'BlockClosure' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.AbstractBlock')
!
(reader addMethod: 'gravel')
!
numArgs
	^self subclassResponsibility
!
