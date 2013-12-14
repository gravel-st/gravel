(reader defineClass: 'TaskControlBlock' superclass: 'org.gravel.tests.richards.TaskState')
!
(reader addInstVar: 'link')
!
(reader addInstVar: 'identity')
!
(reader addInstVar: 'priority')
!
(reader addInstVar: 'input')
!
(reader addInstVar: 'state')
!
(reader addInstVar: 'function')
!
(reader addInstVar: 'handle')
!
(reader addMethod: 'scheduling')
!
addInput: packet checkPriority: oldTask
	NoWork == input
		ifTrue: 
			[input := packet.
			packetPendingIV := true.
			priority > oldTask priority ifTrue: [^self]]
		ifFalse: [input := self append: packet head: input].
	^oldTask
!
(reader addMethod: 'accessing')
!
identity
	^identity
!
(reader addMethod: 'accessing')
!
link
	^link
!
(reader addMethod: 'initialize')
!
link: aLink identity: anIdentity priority: aPriority initialWorkQueue: anInitialWorkQueue initialState: anInitialState function: aBlock privateData: aPrivateData
	link := aLink.
	identity := anIdentity.
	priority := aPriority.
	input := anInitialWorkQueue.
	packetPendingIV := anInitialState isPacketPending.
	taskWaiting := anInitialState isTaskWaiting.
	taskHolding := anInitialState isTaskHolding.
	function := aBlock.
	handle := aPrivateData
!
(reader addMethod: 'accessing')
!
priority
	^priority
!
(reader addMethod: 'scheduling')
!
runTask
	| message |
	self isWaitingWithPacket
		ifTrue: 
			[message := input.
			input := message link.
			NoWork == input ifTrue: [self running] ifFalse: [self packetPending]]
		ifFalse: [message := NoWork].
	^function value: message value: handle
!
(reader addClassMethod: 'instance creation')
!
link: link create: identity priority: priority initialWorkQueue: initialWorkQueue initialState: initialState function: aBlock privateData: privateData
	^super new
		link: link
		identity: identity
		priority: priority
		initialWorkQueue: initialWorkQueue
		initialState: initialState
		function: aBlock
		privateData: privateData
!
