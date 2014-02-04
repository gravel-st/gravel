(reader defineClass: 'Frame' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'instructions' type: 'Array[JVMInstruction]')
!
(reader addInstVar: 'endStack' type: 'JVMStack')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitFrame: self
!
(reader addMethod: 'As yet unclassified')
!
asFrame {^Self}
	^self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	endStack elementsDo: [:each {JVMType} | aJVMStack push: each].
	^self
!
(reader addMethod: 'accessing')
!
endStack {^JVMStack}
	^endStack
!
(reader addMethod: 'initialize-release')
!
initializeInstructions: anArray
	instructions := anArray.
	self initialize
!
(reader addMethod: 'initialize-release')
!
initializeInstructions: anArray {Arr[JVMInstruction]} endStack: aJVMStack {JVMStack} {^Self}
	instructions := anArray.
	endStack := aJVMStack.
	self initialize
!
(reader addMethod: 'accessing')
!
instructions {^Arr[JVMInstruction]}
	^instructions
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	endStack isEmpty ifTrue: [^JVMBottomType new].
	^endStack peek
!
(reader addMethod: 'As yet unclassified')
!
withInstruction: anInstruction {JVMInstruction} {^Frame}
	| stackCopy {JVMStack} |
	stackCopy := endStack copy.
	^Frame instructions: (instructions copyWith: (anInstruction effectStack: stackCopy))
		endStack: stackCopy
!
(reader addMethod: 'As yet unclassified')
!
withReturnType: aJVMType {JVMType} {^Self}
	endStack isEmpty ifTrue: [^self].
	self assert: endStack size = 1.
	endStack peek = aJVMType ifTrue: [^self].
	instructions last isCast ifTrue: [self error: 'niy'].
	^self withInstruction: (endStack peek newCastInstructionTo: aJVMType)
!
(reader addClassMethod: 'As yet unclassified')
!
empty {^Frame}
	^self instructions: #() endStack: JVMStack new
!
(reader addClassMethod: 'instance creation')
!
instructions: anArray
	^self new initializeInstructions: anArray
!
(reader addClassMethod: 'instance creation')
!
instructions: anArray {Arr[JVMInstruction]} endStack: aJVMStack {JVMStack} {^Frame}
	^self new initializeInstructions: anArray endStack: aJVMStack
!
(reader addClassMethod: 'instance creation')
!
instructions: anArray type: aJVMBottomType
	^self new initializeInstructions: anArray type: aJVMBottomType
!
