(reader defineClass: 'Notification' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'accessing')
!
defaultAction
	^self defaultResumeValue
!
