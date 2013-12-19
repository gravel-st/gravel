(reader defineClass: 'BlockClosure2' superclass: 'st.gravel.lang.BlockClosure')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.Block2')
!
(reader addMethod: 'gravel')
!
numArgs
	^2
!
(reader addMethod: 'gravel')
!
value: arg1 value: arg2
	^self subclassResponsibility
!
