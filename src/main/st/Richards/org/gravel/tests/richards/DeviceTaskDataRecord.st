(reader defineClass: 'DeviceTaskDataRecord' superclass: 'org.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'pending')
!
(reader addMethod: 'initialize')
!
create
	pending := NoWork
!
(reader addMethod: 'accessing')
!
pending
	^pending
!
(reader addMethod: 'accessing')
!
pending: packet
	pending := packet
!
(reader addClassMethod: 'instance creation')
!
create
	^super new create
!
