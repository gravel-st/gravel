(reader defineClass: 'UnhandledException' superclass: 'st.gravel.lang.Exception')
!
(reader addInstVar: 'unhandledException')
!
(reader addMethod: 'accessing')
!
defaultAction
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'noHandler')>
	
!
(reader addMethod: 'accessing')
!
unhandledException
	^unhandledException
!
(reader addMethod: 'accessing')
!
unhandledException: anError
	unhandledException := anError
!
(reader addClassMethod: 'instance creation')
!
unhandledException: anError
	^self new unhandledException: anError
!
