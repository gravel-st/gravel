(reader defineClass: 'InterpretedBlock' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'blockNode')
!
(reader addInstVar: 'parentInterpreter')
!
(reader addMethod: 'accessing')
!
blockNode
	^blockNode
!
(reader addMethod: 'initialize-release')
!
initializeBlockNode: aBlockNode parentInterpreter: anInterpreter
	blockNode := aBlockNode.
	parentInterpreter := anInterpreter.
	self initialize
!
(reader addMethod: 'accessing')
!
parentInterpreter
	^parentInterpreter
!
(reader addMethod: 'accessing')
!
value
	| i |
	i := Interpreter parent: parentInterpreter.
	^i visit: blockNode body
!
(reader addMethod: 'accessing')
!
value: arg1
	^self valueWithArguments: (Array with: arg1)
!
(reader addMethod: 'accessing')
!
value: arg1 value: arg2
	^self valueWithArguments: (Array with: arg1 with: arg2)
!
(reader addMethod: 'accessing')
!
valueWithArguments: args
	| i |
	i := Interpreter parent: parentInterpreter.
	blockNode arguments with: args
		do: [:argNode :argValue | i createVariable: argNode name value: argValue].
	^i visit: blockNode body
!
(reader addClassMethod: 'instance creation')
!
blockNode: aBlockNode parentInterpreter: anInterpreter
	^self new initializeBlockNode: aBlockNode parentInterpreter: anInterpreter
!
