(reader defineClass: 'Warning' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'accessing')
!
defaultAction
	self pvtDefaultAction: messageText
!
(reader addMethod: 'accessing')
!
pvtDefaultAction: aString
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'warningNoHandler_')>
	
!
