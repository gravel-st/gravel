(reader defineClass: 'Error' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'accessing')
!
defaultAction
	^(UnhandledException new)
		unhandledException: self;
		messageText: messageText;
		initialHandler: initialHandler;
		raise
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addError: aTestCase.
	self sunitExitWith: false
!
