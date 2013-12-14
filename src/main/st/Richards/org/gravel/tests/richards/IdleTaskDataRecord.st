(reader defineClass: 'IdleTaskDataRecord' superclass: 'org.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'control')
!
(reader addInstVar: 'count')
!
(reader addMethod: 'accessing')
!
control
	^control
!
(reader addMethod: 'accessing')
!
control: aNumber
	control := aNumber
!
(reader addMethod: 'accessing')
!
count
	^count
!
(reader addMethod: 'accessing')
!
count: aCount
	count := aCount
!
(reader addMethod: 'initialize')
!
create
	control := 1.
	count := 10000
!
(reader addClassMethod: 'instance creation')
!
create
	^super new create
!
