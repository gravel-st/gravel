(reader defineClass: 'TestFailure' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addFailure: aTestCase.
	self sunitExitWith: false
!
