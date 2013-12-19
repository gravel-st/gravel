(reader defineClass: 'Error' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addError: aTestCase.
	self sunitExitWith: false
!
