(reader defineClass: 'BlockClosure' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.AbstractBlock')
!
(reader addMethod: 'accessing')
!
argumentCount
	^self numArgs
!
(reader addMethod: 'accessing')
!
numArgs
	^self subclassResponsibility
!
(reader addMethod: 'evaluating')
!
raiseInvalidArgumentCount
	^self error: 'Invalid argument count'
!
