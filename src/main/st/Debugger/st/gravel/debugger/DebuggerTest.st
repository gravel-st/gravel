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
setUp
	systemMapping := SP.SystemMapping systemNode: SP.SystemNode empty
				compilerTools: StOnly.MockSystemMappingCompilerTools new.
	systemMapping updateTo: StOnly.VWClassReader readVWSystemDefinitionNode
!
(reader addMethod: 'As yet unclassified')
!
testArrayAsSortedCollection
	| answer |
	answer := self evaluate: '#(z b g a) asSortedCollection'.
	self assert: answer primitiveValue = 7
!
(reader addMethod: 'As yet unclassified')
!
testPlus
	| answer |
	answer := self evaluate: '3 + 4'.
	self assert: answer primitiveValue = 7
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SystemMapping]}
	^#('systemMapping')
!
