(reader defineClass: 'RBObject' superclass: 'org.gravel.lang.Object')
!
(reader defineSharedVariable: 'DeviceA' init: nil)
!
(reader defineSharedVariable: 'DeviceB' init: nil)
!
(reader defineSharedVariable: 'DevicePacketKind' init: nil)
!
(reader defineSharedVariable: 'HandlerA' init: nil)
!
(reader defineSharedVariable: 'HandlerB' init: nil)
!
(reader defineSharedVariable: 'Idler' init: nil)
!
(reader defineSharedVariable: 'NoTask' init: nil)
!
(reader defineSharedVariable: 'NoWork' init: nil)
!
(reader defineSharedVariable: 'Worker' init: nil)
!
(reader defineSharedVariable: 'WorkPacketKind' init: nil)
!
(reader addMethod: 'utilities')
!
append: packet head: queueHead
	| mouse link |
	packet link: NoWork.
	NoWork == queueHead ifTrue: [^packet].
	mouse := queueHead.
	[NoWork == (link := mouse link)] whileFalse: [mouse := link].
	mouse link: packet.
	^queueHead
!
(reader addClassMethod: 'initialize')
!
initialize
	DeviceA := 5.
	DeviceB := 6.
	DevicePacketKind := 1.
	HandlerA := 3.
	HandlerB := 4.
	Idler := 1.
	NoWork := nil.
	NoTask := nil.
	Worker := 2.
	WorkPacketKind := 2
!
