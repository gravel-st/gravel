(reader extendClass: 'Object')
!
(reader addMethod: 'error handling')
!
assert: predicate {Boolean}
	predicate ifFalse: [self error: 'Assertion failed']
!
(reader addMethod: 'gravel')
!
deny: predicate {Boolean}
	self assert: predicate not
!
(reader addMethod: 'gravel')
!
sunitAddDependent: anObject
	
!
(reader addMethod: 'gravel')
!
sunitChanged: aspect
	
!
(reader addMethod: 'gravel')
!
sunitRemoveDependent: anObject
	
!
