(reader defineClass: 'Error' superclass: 'st.gravel.lang.Exception')
!
(reader addMethod: 'accessing')
!
defaultAction
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'noHandler')>
	
!
(reader addMethod: 'gravel')
!
sunitAnnounce: aTestCase toResult: aTestResult
	aTestResult addError: aTestCase.
	self sunitExitWith: false
!
