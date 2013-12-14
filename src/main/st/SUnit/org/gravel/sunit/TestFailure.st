(reader defineClass: 'TestFailure' superclass: 'org.gravel.lang.Exception')
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addFailure: aTestCase.
	self sunitExitWith: false
!
