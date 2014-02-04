(reader defineClass: 'BlockInliner' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'methodNode' type: 'MethodNode')
!
(reader addInstVar: 'astConstants' type: 'Array[BlockSendArgument]')
!
(reader addInstVar: 'systemMapping' type: 'SystemMapping')
!
(reader addInstVar: 'copiedArgumentNames' type: 'Array[String]')
!
(reader addInstVar: 'copiedArgRenames' type: 'Dictionary[String, String]')
!
(reader addInstVar: 'selfType' type: 'JVMNonPrimitiveType')
!
(reader addInstVar: 'receiverReference' type: 'Reference')
!
(reader addMethod: 'accessing')
!
astConstants {^Arr[BlockSendArgument]}
	^astConstants
!
(reader addMethod: 'As yet unclassified')
!
build {^JavaMethodHandle}
	^self isOptimizable ifTrue: [self buildOptimized] ifFalse: [self buildNonOptimized]
!
(reader addMethod: 'As yet unclassified')
!
buildMethodNodeArguments: node {MethodNode} {^Arr[VariableDeclarationNode]}
	| arguments {OrdColl[VariableDeclarationNode]} |
	arguments := OrderedCollection new.
	astConstants with: node arguments
		do: [:astConstant {BlockSendArgument} :arg {VariableDeclarationNode} | astConstant isNil ifTrue: [arguments add: arg]].
	copiedArgumentNames
		do: [:each {Str} | arguments add: (self variableDeclarationNodeFor: each)].
	^arguments asArray
!
(reader addMethod: 'As yet unclassified')
!
buildNonOptimized {^JavaMethodHandle}
	| node {MethodNode} arguments {Arr[VariableDeclarationNode]} sendArgs {OrdColl[Expression]} |
	copiedArgumentNames do: 
			[:each {Str} |
			| newTempName {Str} |
			newTempName := self newTempName: each for: methodNode.
			copiedArgRenames at: each put: newTempName].
	arguments := self buildMethodNodeArguments: methodNode.
	sendArgs := OrderedCollection new.
	astConstants with: methodNode arguments
		do: 
			[:astConstant {BlockSendArgument} :arg {VariableDeclarationNode} |
			astConstant isNil
				ifTrue: [sendArgs add: arg asVariableNode]
				ifFalse: [sendArgs add: (self renamedBlockNodeFor: astConstant)]].
	node := self
				newMethodNode: (systemMapping selectorConverter selectorForNumArgs: arguments size)
				arguments: arguments
				body: (SequenceNode
						return: (SelfNode new send: methodNode selector withAll: sendArgs asArray)).
	self log: 'nonOptimized: ' text: node sourceString.
	^self compileMethodNode: (self link: node) allowBlockInlining: false
!
(reader addMethod: 'As yet unclassified')
!
buildOptimized {^JavaMethodHandle}
	| node {MethodNode} inlined {MethodNode} arguments {Arr[VariableDeclarationNode]} selector {Str} |
	self log: 'methodNode: ' text: methodNode sourceString.
	node := self link: methodNode.
	self log: 'linked methodNode: ' text: node sourceString.
	copiedArgumentNames do: 
			[:each {Str} |
			| newTempName {Str} |
			newTempName := self newTempName: each for: node.
			copiedArgRenames at: each put: newTempName].
	arguments := self buildMethodNodeArguments: node.
	selector := systemMapping selectorConverter selectorForNumArgs: arguments size.
	self log: 'selector: ' text: selector.
	node := (self
				newMethodNode: selector
				arguments: arguments
				body: node body) withNlrMarker: node nlrMarker.
	self log: 'node: ' text: node sourceString.
	astConstants with: methodNode arguments
		do: 
			[:astConstant {BlockSendArgument} :arg {VariableDeclarationNode} |
			astConstant isNil
				ifFalse: 
					[self log: 'block ' , arg name , ': ' text: astConstant blockNode sourceString.
					node := VariableNodeReplacer
								in: node
								replace: arg name
								with: (self renamedBlockNodeFor: astConstant)]].
	inlined := LiteralSendInliner inline: node.
	inlined := self link: inlined.
	self log: 'inlined: ' text: inlined sourceString.
	^self compileMethodNode: inlined
!
(reader addMethod: 'As yet unclassified')
!
compileMethodNode: inlinedMethodNode {MethodNode} {^JavaMethodHandle}
	^self compileMethodNode: inlinedMethodNode allowBlockInlining: true
!
(reader addMethod: 'As yet unclassified')
!
compileMethodNode: inlinedMethodNode {MethodNode} allowBlockInlining: allowBlockInlining {Bool} {^JavaMethodHandle}
	| javaClass {JavaClass | Nil} |
	javaClass := systemMapping
				compileInlinedMethod: inlinedMethodNode
				selfType: selfType
				allowBlockInlining: allowBlockInlining.
	^systemMapping compilerTools
		methodHandleAt: (systemMapping selectorConverter
				selectorAsFunctionName: inlinedMethodNode selector asSymbol)
		numArgs: inlinedMethodNode numArgs
		in: javaClass
		identityClass: javaClass
		isStatic: true
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	copiedArgRenames := Dictionary new
!
(reader addMethod: 'initialize-release')
!
initializeMethodNode: aMethodNode {MethodNode} astConstants: anArray {Arr[BlockSendArgument]} systemMapping: anObject {SystemMapping} copiedArgumentNames: anObject1 {Arr[Str]} selfType: anObject2 {JVMNonPrimitiveType} receiverReference: anObject3 {Reference} {^Self}
	methodNode := aMethodNode.
	astConstants := anArray.
	systemMapping := anObject.
	copiedArgumentNames := anObject1.
	selfType := anObject2.
	receiverReference := anObject3.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isOptimizable {^Bool}
	methodNode primitivePragma isNil ifFalse: [^false].
	(methodNode allNodesContains: [:node {Node} | node isSuperNode]) ifTrue: [^false].
	^true
!
(reader addMethod: 'As yet unclassified')
!
link: aMethodNode {MethodNode} {^MethodNode}
	| owner {SelfNode} updater {SystemMappingUpdater} instVars {Arr[BoundVariableDeclarationNode]} |
	owner := SelfNode new.
	updater := systemMapping newSystemMappingUpdater.
	instVars := updater allInstVarsForReference: receiverReference.
	^updater
		localLink: aMethodNode
		instVars: instVars
		ownerReference: receiverReference
		owner: owner
!
(reader addMethod: 'As yet unclassified')
!
log: label {Str} text: aString {Str} {^Self}
	
!
(reader addMethod: 'accessing')
!
methodNode {^MethodNode}
	^methodNode
!
(reader addMethod: 'As yet unclassified')
!
newMethodNode: selector {Str} arguments: arguments {Arr[VariableDeclarationNode]} body: body {SequenceNode} {^MethodNode}
	^arguments isEmpty
		ifTrue: [UnaryMethodNode selector: selector body: body]
		ifFalse: [KeywordMethodNode selector: selector arguments: arguments body: body]
!
(reader addMethod: 'As yet unclassified')
!
newTempName: argName {Str} for: node {Node} {^Str}
	| lsi {LiteralSendInliner} |
	lsi := LiteralSendInliner new.
	lsi initializeRoot: node.
	^lsi newTempName: argName
!
(reader addMethod: 'As yet unclassified')
!
renamedBlockNodeFor: astConstant {BlockSendArgument} {^BlockNode}
	| blockNode {BlockNode} |
	blockNode := astConstant blockNode.
	astConstant copiedVariables do: 
			[:cv {JVMVariable} |
			blockNode := self
						renameVariable: blockNode
						from: cv varName
						to: (copiedArgRenames at: cv varName)].
	self log: 'renamedBlockNode: ' text: blockNode sourceString.
	^blockNode
!
(reader addMethod: 'As yet unclassified')
!
renameVariable: node {Node} from: oldName {Str} to: newName {Str} {^Node}
	^(VariableRenamer oldName: oldName newName: newName) visit: node
!
(reader addMethod: 'As yet unclassified')
!
renameVariable: argName {Str} in: node {Node} {^Node}
	^self
		renameVariable: node
		from: argName
		to: (self newTempName: argName for: node)
!
(reader addMethod: 'As yet unclassified')
!
variableDeclarationNodeFor: varName {Str} {^VariableDeclarationNode}
	astConstants do: 
			[:astConstant {BlockSendArgument} |
			astConstant isNil
				ifFalse: 
					[astConstant copiedVariables do: 
							[:each {JVMVariable} |
							each varName = varName
								ifTrue: 
									[^each type isArrayType
										ifTrue: [HolderDeclarationNode name: (copiedArgRenames at: each varName)]
										ifFalse: [VariableDeclarationNode name: (copiedArgRenames at: each varName)]]]]].
	self error: 'cannot find varName: ' , varName
!
(reader addClassMethod: 'instance creation')
!
methodNode: methodNode {MethodNode} astConstants: astConstants {Arr[BlockSendArgument]} systemMapping: systemMapping {SystemMapping} copiedArgumentNames: copiedArgumentNames {Arr[Str]} selfType: selfType {JVMNonPrimitiveType} receiverReference: receiverReference {Reference} {^BlockInliner}
	^self new
		initializeMethodNode: methodNode
		astConstants: astConstants
		systemMapping: systemMapping
		copiedArgumentNames: copiedArgumentNames
		selfType: selfType
		receiverReference: receiverReference
!
