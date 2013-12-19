(reader defineClass: 'RichardsBenchmark' superclass: 'st.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'taskList')
!
(reader addInstVar: 'currentTask')
!
(reader addInstVar: 'currentTaskIdentity')
!
(reader addInstVar: 'taskTable')
!
(reader addInstVar: 'tracing')
!
(reader addInstVar: 'layout')
!
(reader addInstVar: 'queuePacketCount')
!
(reader addInstVar: 'holdCount')
!
(reader addMethod: 'creation')
!
createDevice: identity priority: priority work: owork state: state
	| odata |
	odata := DeviceTaskDataRecord create.
	self
		createTask: identity
		priority: priority
		work: owork
		state: state
		function: 
			[:work :word |
			| data functionWork |
			data := word.
			functionWork := work.
			NoWork == functionWork
				ifTrue: 
					[NoWork == (functionWork := data pending)
						ifTrue: [self wait]
						ifFalse: 
							[data pending: NoWork.
							self queuePacket: functionWork]]
				ifFalse: 
					[data pending: functionWork.
					tracing ifTrue: [self trace: functionWork datum].
					self holdSelf]]
		data: odata
!
(reader addMethod: 'creation')
!
createHandler: identity priority: priority work: owork state: state
	| odata |
	odata := HandlerTaskDataRecord create.
	self
		createTask: identity
		priority: priority
		work: owork
		state: state
		function: 
			[:work :word |
			| data workPacket count devicePacket |
			data := word.
			NoWork == work
				ifFalse: 
					[WorkPacketKind == work kind
						ifTrue: [data workInAdd: work]
						ifFalse: [data deviceInAdd: work]].
			NoWork == (workPacket := data workIn)
				ifTrue: [self wait]
				ifFalse: 
					[count := workPacket datum.
					count > 4
						ifTrue: 
							[data workIn: workPacket link.
							self queuePacket: workPacket]
						ifFalse: 
							[NoWork == (devicePacket := data deviceIn)
								ifTrue: [self wait]
								ifFalse: 
									[data deviceIn: devicePacket link.
									devicePacket datum: (workPacket data at: count).
									workPacket datum: count + 1.
									self queuePacket: devicePacket]]]]
		data: odata
!
(reader addMethod: 'creation')
!
createIdler: identity priority: priority work: owork state: state
	| odata |
	odata := IdleTaskDataRecord create.
	self
		createTask: identity
		priority: priority
		work: owork
		state: state
		function: 
			[:work :word |
			| data |
			data := word.
			data count: data count - 1.
			0 = data count
				ifTrue: [self holdSelf]
				ifFalse: 
					[0 = (data control bitAnd: 1)
						ifTrue: 
							[data control: data control // 2.
							self release: DeviceA]
						ifFalse: 
							[data control: (data control // 2 bitXor: 53256).
							self release: DeviceB]]]
		data: odata
!
(reader addMethod: 'creation')
!
createPacket: link identity: identity kind: kind
	^Packet create: link identity: identity kind: kind
!
(reader addMethod: 'creation')
!
createTask: identity priority: priority work: work state: state function: aBlock data: data
	| t |
	t := TaskControlBlock
				link: taskList
				create: identity
				priority: priority
				initialWorkQueue: work
				initialState: state
				function: aBlock
				privateData: data.
	taskList := t.
	taskTable at: identity put: t
!
(reader addMethod: 'creation')
!
createWorker: identity priority: priority work: owork state: state
	| odata |
	odata := WorkerTaskDataRecord create.
	self
		createTask: identity
		priority: priority
		work: owork
		state: state
		function: 
			[:work :word |
			| data |
			data := word.
			NoWork == work
				ifTrue: [self wait]
				ifFalse: 
					[data destination: (HandlerA = data destination ifTrue: [HandlerB] ifFalse: [HandlerA]).
					work identity: data destination.
					work datum: 1.
					1 to: 4
						do: 
							[:i |
							data count: data count + 1.
							data count > 26 ifTrue: [data count: 1].
							work data at: i put: $A asInteger + data count - 1].
					self queuePacket: work]]
		data: odata
!
(reader addMethod: 'private')
!
findTask: identity
	| t |
	t := taskTable at: identity.
	NoTask == t ifTrue: [self error: 'findTask failed'].
	^t
!
(reader addMethod: 'private')
!
holdSelf
	holdCount := holdCount + 1.
	currentTask taskHolding: true.
	^currentTask link
!
(reader addMethod: 'private')
!
initScheduler
	queuePacketCount := holdCount := 0.
	taskTable := Array new: 6 withAll: NoTask.
	taskList := NoTask
!
(reader addMethod: 'private')
!
initTrace
	tracing := false.
	layout := 0
!
(reader addMethod: 'private')
!
queuePacket: packet
	| t |
	t := self findTask: packet identity.
	NoTask == t ifTrue: [^NoTask].
	queuePacketCount := queuePacketCount + 1.
	packet link: NoWork.
	packet identity: currentTaskIdentity.
	^t addInput: packet checkPriority: currentTask
!
(reader addMethod: 'private')
!
release: identity
	| t |
	t := self findTask: identity.
	NoTask == t ifTrue: [^NoTask].
	t taskHolding: false.
	t priority > currentTask priority ifTrue: [^t] ifFalse: [^currentTask]
!
(reader addMethod: 'scheduling')
!
schedule
	currentTask := taskList.
	[NoTask == currentTask] whileFalse: 
			[currentTask isTaskHoldingOrWaiting
				ifTrue: [currentTask := currentTask link]
				ifFalse: 
					[currentTaskIdentity := currentTask identity.
					tracing ifTrue: [self trace: currentTaskIdentity].
					currentTask := currentTask runTask]]
!
(reader addMethod: 'initialize')
!
start
	self start: true
!
(reader addMethod: 'initialize')
!
start: printTimes
	| workQ mark1 mark2 mark3 mark4 |
	self
		initTrace;
		initScheduler.
	mark1 := Time millisecondClockValue.
	tracing
		ifTrue: 
			[Transcript
				show: 'Bench mark starting';
				cr].
	self
		createIdler: Idler
		priority: 0
		work: NoWork
		state: TaskState running.
	workQ := self createPacket: NoWork identity: Worker kind: WorkPacketKind.
	workQ := self createPacket: workQ identity: Worker kind: WorkPacketKind.
	self
		createWorker: Worker
		priority: 1000
		work: workQ
		state: TaskState waitingWithPacket.
	workQ := self createPacket: NoWork identity: DeviceA kind: DevicePacketKind.
	workQ := self createPacket: workQ identity: DeviceA kind: DevicePacketKind.
	workQ := self createPacket: workQ identity: DeviceA kind: DevicePacketKind.
	self
		createHandler: HandlerA
		priority: 2000
		work: workQ
		state: TaskState waitingWithPacket.
	workQ := self createPacket: NoWork identity: DeviceB kind: DevicePacketKind.
	workQ := self createPacket: workQ identity: DeviceB kind: DevicePacketKind.
	workQ := self createPacket: workQ identity: DeviceB kind: DevicePacketKind.
	self
		createHandler: HandlerB
		priority: 3000
		work: workQ
		state: TaskState waitingWithPacket.
	self
		createDevice: DeviceA
		priority: 4000
		work: NoWork
		state: TaskState waiting.
	self
		createDevice: DeviceB
		priority: 5000
		work: NoWork
		state: TaskState waiting.
	tracing
		ifTrue: 
			[Transcript
				show: 'Starting';
				cr].
	mark2 := Time millisecondClockValue.
	self schedule.
	mark3 := Time millisecondClockValue.
	tracing
		ifTrue: 
			[Transcript
				show: 'Finished';
				cr.
			Transcript
				show: 'QueuePacket count = ';
				show: queuePacketCount printString;
				show: ' HoldCount = ';
				show: holdCount printString;
				cr.
			Transcript
				cr;
				show: 'End of run';
				cr].
	(queuePacketCount = 23246 and: [holdCount = 9297]) ifFalse: [self error: 'wrong result'].
	mark4 := Time millisecondClockValue.
	printTimes
		ifTrue: 
			[Transcript
				show: '***Scheduler time = ';
				show: (mark3 - mark2) printString;
				show: ' Total time = ';
				show: (mark4 - mark1) printString;
				cr]
!
(reader addMethod: 'private')
!
trace: id
	layout := layout - 1.
	0 >= layout
		ifTrue: 
			[Transcript cr.
			layout := 50].
	Transcript show: id printString
!
(reader addMethod: 'private')
!
wait
	currentTask taskWaiting: true.
	^currentTask
!
(reader addClassMethod: 'instance creation')
!
start
	super new start
!
(reader addClassMethod: 'instance creation')
!
startLongRun
	| ms |
	ms := Time millisecondsToRun: [100 timesRepeat: [super new start: false]].
	Transcript
		cr;
		show: '100 iterations run in: ' , ms printString , ' ms'
!
