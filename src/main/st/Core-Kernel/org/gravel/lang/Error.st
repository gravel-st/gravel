(reader defineClass: 'Error' superclass: 'org.gravel.lang.Exception')
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addError: aTestCase.
	self sunitExitWith: false
!
