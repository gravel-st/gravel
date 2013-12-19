(reader defineClass: 'HandlerTaskDataRecord' superclass: 'st.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'workIn')
!
(reader addInstVar: 'deviceIn')
!
(reader addMethod: 'initialize')
!
create
	workIn := deviceIn := NoWork
!
(reader addMethod: 'accessing')
!
deviceIn
	^deviceIn
!
(reader addMethod: 'accessing')
!
deviceIn: aPacket
	deviceIn := aPacket
!
(reader addMethod: 'accessing')
!
deviceInAdd: packet
	deviceIn := self append: packet head: deviceIn
!
(reader addMethod: 'accessing')
!
workIn
	^workIn
!
(reader addMethod: 'accessing')
!
workIn: aWorkQueue
	workIn := aWorkQueue
!
(reader addMethod: 'accessing')
!
workInAdd: packet
	workIn := self append: packet head: workIn
!
(reader addClassMethod: 'instance creation')
!
create
	^super new create
!
