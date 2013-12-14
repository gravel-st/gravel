(reader defineClass: 'WorkerTaskDataRecord' superclass: 'org.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'destination')
!
(reader addInstVar: 'count')
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
	destination := HandlerA.
	count := 0
!
(reader addMethod: 'accessing')
!
destination
	^destination
!
(reader addMethod: 'accessing')
!
destination: aHandler
	destination := aHandler
!
(reader addClassMethod: 'instance creation')
!
create
	^super new create
!
