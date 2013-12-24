(reader defineClass: 'DebuggerTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader addInstVar: 'systemMapping')
!
(reader addMethod: 'As yet unclassified')
!
evaluate: source
	| methodContext process vm block jvmClasses |
	jvmClasses := systemMapping compileExpressionSource: source.
	vm := VirtualMachine systemMapping: systemMapping.
	jvmClasses do: [:each | vm addClass: each].
	block := vm createInstance: jvmClasses last type.
	methodContext := block invokeVirtual: 'value'.
	methodContext loadReceiver: block arguments: #().
	process := VMProcess vm: vm currentContext: methodContext.
	[process atEnd] whileFalse: [process step].
	^process answer
!
(reader addMethod: 'running')
!
getSystemMapping
 <primitive: #('st.gravel.support.jvm.SimulatorExtensions' 'getSystemMapping')>| sm |
	sm := (SystemMapping systemNode: (SystemNode empty) compilerTools: (StOnly.MockSystemMappingCompilerTools new)).
	sm updateTo: (StOnly.VWClassReader readVWSystemDefinitionNode).
	^sm
!
(reader addMethod: 'running')
!
setUp
	| sm |
	sm := self getSystemMapping.
	systemMapping := sm
!
(reader addMethod: 'As yet unclassified')
!
testArrayAsSortedCollection
	| answer |
	answer := self evaluate: '#(z b g a) asSortedCollection asArray'.
	self
		assert: (answer primitiveValue collect: [:each | each primitiveValue]) = #(#a #b #g #z)
!
(reader addMethod: 'As yet unclassified')
!
testLoop
	| answer |
	answer := self evaluate: '1 to: 10 do: [:i |] '.
	self assert: answer isNil
!
(reader addMethod: 'As yet unclassified')
!
testPlus
	| answer |
	answer := self evaluate: '3 + 4'.
	self assert: answer primitiveValue = 7
!
(reader addMethod: 'As yet unclassified')
!
testRunSelf
	| answer |
	answer := self evaluate: '(st.gravel.debugger.DebuggerTest selector: #testLoop) run'.
	self
		assert: (answer primitiveValue collect: [:each | each primitiveValue]) = #(#a #b #g #z)
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SystemMapping]}
	^#('systemMapping')
!
