(reader defineClass: 'TaskState' superclass: 'org.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'packetPendingIV')
!
(reader addInstVar: 'taskWaiting')
!
(reader addInstVar: 'taskHolding')
!
(reader addMethod: 'accessing')
!
isPacketPending
	^packetPendingIV
!
(reader addMethod: 'testing')
!
isRunning
	^packetPendingIV not and: [taskWaiting not and: [taskHolding not]]
!
(reader addMethod: 'accessing')
!
isTaskHolding
	^taskHolding
!
(reader addMethod: 'testing')
!
isTaskHoldingOrWaiting
	^taskHolding or: [packetPendingIV not and: [taskWaiting]]
!
(reader addMethod: 'accessing')
!
isTaskWaiting
	^taskWaiting
!
(reader addMethod: 'testing')
!
isWaiting
	^packetPendingIV not and: [taskWaiting and: [taskHolding not]]
!
(reader addMethod: 'testing')
!
isWaitingWithPacket
	^packetPendingIV and: [taskWaiting and: [taskHolding not]]
!
(reader addMethod: 'initialize')
!
packetPending
	packetPendingIV := true.
	taskWaiting := false.
	taskHolding := false
!
(reader addMethod: 'initialize')
!
running
	packetPendingIV := taskWaiting := taskHolding := false
!
(reader addMethod: 'accessing')
!
taskHolding: aBoolean
	taskHolding := aBoolean
!
(reader addMethod: 'accessing')
!
taskWaiting: aBoolean
	taskWaiting := aBoolean
!
(reader addMethod: 'initialize')
!
waiting
	packetPendingIV := taskHolding := false.
	taskWaiting := true
!
(reader addMethod: 'initialize')
!
waitingWithPacket
	taskHolding := false.
	taskWaiting := packetPendingIV := true
!
(reader addClassMethod: 'instance creation')
!
packetPending
	^super new packetPending
!
(reader addClassMethod: 'instance creation')
!
running
	^super new running
!
(reader addClassMethod: 'instance creation')
!
waiting
	^super new waiting
!
(reader addClassMethod: 'instance creation')
!
waitingWithPacket
	^super new waitingWithPacket
!
