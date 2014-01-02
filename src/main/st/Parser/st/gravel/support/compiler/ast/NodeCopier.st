(reader defineClass: 'NodeCopier' superclass: 'st.gravel.support.compiler.ast.NodeVisitor')
!
(reader addMethod: 'visiting')
!
produceNlrMarkerDefinition: aString {Str} for: aMethodNode {MethodNode} {^Str}
	^aString
!
(reader addMethod: 'visiting')
!
visit: anObject {Node} {^Node}
	| newNode {Node} |
	anObject isNil ifTrue: [^nil].
	newNode := anObject accept: self.
	newNode isNil ifTrue: [^nil].
	^newNode withSourcePosition: anObject sourcePosition
!
(reader addMethod: 'visiting')
!
visitArrayAccessNode: anObject {ArrayAccessNode} {^ArrayAccessNode}
	^ArrayAccessNode receiver: (self visit: anObject receiver)
!
(reader addMethod: 'visiting')
!
visitArrayAtNode: anObject {ArrayAtNode} {^ArrayAtNode}
	^ArrayAtNode receiver: (self visit: anObject receiver) index: (self visit: anObject index)
!
(reader addMethod: 'visiting')
!
visitArrayAtPutNode: anObject {ArrayAtPutNode} {^ArrayAtPutNode}
	^ArrayAtPutNode
		receiver: (self visit: anObject receiver)
		index: (self visit: anObject index)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitArrayLiteralNode: anObject {ArrayLiteralNode} {^ArrayLiteralNode}
	^ArrayLiteralNode
		elements: (anObject elements collect: [:each {LiteralNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitArraySizeNode: anObject {ArraySizeNode} {^ArraySizeNode}
	^ArraySizeNode receiver: (self visit: anObject receiver)
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject {AssignmentNode} {^Expression}
	^AssignmentNode variable: (self visit: anObject variable)
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitBinaryMessageNode: anObject {BinaryMessageNode} {^Statement}
	^BinaryMessageNode
		receiver: (self visit: anObject receiver)
		selector: anObject selector
		argument: (self visit: anObject argument)
!
(reader addMethod: 'visiting')
!
visitBinaryMethodNode: anObject {BinaryMethodNode} {^MethodNode}
	| nlrMarker {Str} |
	nlrMarker := self produceNlrMarkerDefinition: anObject nlrMarker for: anObject.
	^BinaryMethodNode
		selector: anObject selector
		argument: (self visit: anObject argument)
		body: (self visit: anObject body)
		returnType: (self visit: anObject returnType)
		pragmas: (anObject pragmas collect: [:each {PragmaNode} | self visit: each])
		protocol: anObject protocol
		nlrMarker: nlrMarker
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^BlockNode}
	^BlockNode
		arguments: (anObject arguments
				collect: [:each {VariableDeclarationNode} | self visit: each])
		body: (self visit: anObject body)
		returnType: (self visit: anObject returnType)
!
(reader addMethod: 'visiting')
!
visitBlockTypeNode: anObject {BlockTypeNode} {^BlockTypeNode}
	^BlockTypeNode
		arguments: (anObject arguments collect: [:each {TypeNode} | self visit: each])
		returnType: (self visit: anObject returnType)
!
(reader addMethod: 'visiting')
!
visitBooleanAndNode: anObject {BooleanAndNode} {^BooleanAndNode}
	^BooleanAndNode left: (self visit: anObject left) right: (self visit: anObject right)
!
(reader addMethod: 'visiting')
!
visitBooleanLiteralNode: anObject {BooleanLiteralNode} {^BooleanLiteralNode}
	^BooleanLiteralNode value: anObject value
!
(reader addMethod: 'visiting')
!
visitBooleanOrNode: anObject {BooleanOrNode} {^BooleanOrNode}
	^BooleanOrNode left: (self visit: anObject left) right: (self visit: anObject right)
!
(reader addMethod: 'visiting')
!
visitBottomTypeNode: anObject {BottomTypeNode} {^BottomTypeNode}
	^BottomTypeNode new
!
(reader addMethod: 'visiting')
!
visitBoundVariableDeclarationNode: anObject {BoundVariableDeclarationNode} {^BoundVariableDeclarationNode}
	^BoundVariableDeclarationNode
		name: anObject name
		type: (self visit: anObject type)
		ownerType: anObject ownerType
!
(reader addMethod: 'visiting')
!
visitByteArrayLiteralNode: anObject {ByteArrayLiteralNode} {^ByteArrayLiteralNode}
	^ByteArrayLiteralNode value: anObject value
!
(reader addMethod: 'visiting')
!
visitCascadeNode: anObject {CascadeNode} {^Expression}
	^CascadeNode
		messages: (anObject messages collect: [:each {MessageNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitCharacterLiteralNode: anObject {CharacterLiteralNode} {^CharacterLiteralNode}
	^CharacterLiteralNode value: anObject value
!
(reader addMethod: 'visiting')
!
visitClassDescriptionNode: anObject {ClassDescriptionNode} {^ClassDescriptionNode}
	^ClassDescriptionNode
		methods: (anObject methods collect: [:each {MethodNode} | self visit: each])
		instVars: (anObject instVars collect: [:each {VariableDeclarationNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitClassNode: anObject {ClassNode} {^ClassNode}
	^ClassNode
		name: anObject name
		superclassPath: anObject superclassPath
		properties: anObject properties
		instVars: (anObject instVars collect: [:each {VariableDeclarationNode} | self visit: each])
		classInstVars: anObject metaclassNode instVars
		sharedVariables: anObject metaclassNode sharedVariables
		methods: (anObject methods collect: [:each {MethodNode} | self visit: each])
		classMethods: (anObject classMethods collect: [:each {MethodNode} | self visit: each])
		namespace: anObject namespace
		isExtension: anObject isExtension
		isTrait: anObject isTrait
		traitUsage: (self visit: anObject traitUsage)
		classTraitUsage: (self visit: anObject classTraitUsage)
!
(reader addMethod: 'visiting')
!
visitClassTypeNode: anObject {ClassTypeNode} {^ClassTypeNode}
	^ClassTypeNode node: (self visit: anObject node)
!
(reader addMethod: 'visiting')
!
visitCreateHolderNode: anObject {CreateHolderNode} {^CreateHolderNode}
	^CreateHolderNode new
!
(reader addMethod: 'visiting')
!
visitExpression: anObject {Expression} {^Expression}
	^Expression new
!
(reader addMethod: 'visiting')
!
visitFieldReadNode: anObject {FieldReadNode} {^Expression}
	^FieldReadNode owner: (self visit: anObject owner) field: anObject field
!
(reader addMethod: 'visiting')
!
visitFieldWriteNode: anObject {FieldWriteNode} {^FieldWriteNode}
	^FieldWriteNode
		owner: (self visit: anObject owner)
		field: anObject field
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitFixedPointLiteralNode: anObject {FixedPointLiteralNode} {^FixedPointLiteralNode}
	^FixedPointLiteralNode
		numerator: anObject numerator
		denominator: anObject denominator
		scale: anObject scale
!
(reader addMethod: 'visiting')
!
visitFloatLiteralNode: anObject {FloatLiteralNode} {^FloatLiteralNode}
	^FloatLiteralNode valueString: anObject valueString
!
(reader addMethod: 'visiting')
!
visitGenericTypeVariableNode: anObject {GenericTypeVariableNode} {^GenericTypeVariableNode}
	^GenericTypeVariableNode root: (self visit: anObject root)
		arguments: (anObject arguments collect: [:each {TypeNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitGlobalReadNode: anObject {GlobalReadNode} {^Expression}
	^GlobalReadNode namespace: anObject namespace name: anObject name
!
(reader addMethod: 'visiting')
!
visitGlobalWriteNode: anObject {GlobalWriteNode} {^GlobalWriteNode}
	^GlobalWriteNode
		namespace: anObject namespace
		name: anObject name
		value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitHolderDeclarationNode: anObject {HolderDeclarationNode} {^HolderDeclarationNode}
	^HolderDeclarationNode name: anObject name type: (self visit: anObject type)
!
(reader addMethod: 'visiting')
!
visitIdentityComparisonNode: anObject {IdentityComparisonNode} {^IdentityComparisonNode}
	^IdentityComparisonNode left: (self visit: anObject left)
		right: (self visit: anObject right)
!
(reader addMethod: 'visiting')
!
visitIfTrueIfFalseNode: anObject {IfTrueIfFalseNode} {^IfTrueIfFalseNode}
	^IfTrueIfFalseNode
		test: (self visit: anObject test)
		trueSequence: (self visit: anObject trueSequence)
		falseSequence: (self visit: anObject falseSequence)
		returnType: (self visit: anObject returnType)
!
(reader addMethod: 'visiting')
!
visitInlineExpressionCollection: anObject {InlineExpressionCollection} {^InlineExpressionCollection}
	^InlineExpressionCollection
		expressions: (anObject expressions collect: [:each {Expression} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitInstanceCreationNode: anObject {InstanceCreationNode} {^InstanceCreationNode}
	^InstanceCreationNode reference: anObject reference
!
(reader addMethod: 'visiting')
!
visitInstanceTypeNode: anObject {InstanceTypeNode} {^InstanceTypeNode}
	^InstanceTypeNode new
!
(reader addMethod: 'visiting')
!
visitIntegerLiteralNode: anObject {IntegerLiteralNode} {^IntegerLiteralNode}
	^IntegerLiteralNode integer: anObject integer
!
(reader addMethod: 'visiting')
!
visitIntermediateNode: anObject {IntermediateNode} {^IntermediateNode}
	^IntermediateNode new
!
(reader addMethod: 'visiting')
!
visitIntermediateStatement: anObject {IntermediateStatement} {^IntermediateStatement}
	^IntermediateStatement new
!
(reader addMethod: 'visiting')
!
visitIsNilNode: anObject {IsNilNode} {^IsNilNode}
	^IsNilNode receiver: (self visit: anObject receiver)
!
(reader addMethod: 'visiting')
!
visitKeywordMessageNode: anObject {KeywordMessageNode} {^Statement}
	^KeywordMessageNode
		receiver: (self visit: anObject receiver)
		selector: anObject selector
		arguments: (anObject arguments collect: [:each {Expression} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitKeywordMethodNode: anObject {KeywordMethodNode} {^MethodNode}
	| nlrMarker {Str} |
	nlrMarker := self produceNlrMarkerDefinition: anObject nlrMarker for: anObject.
	^KeywordMethodNode
		selector: anObject selector
		arguments: (anObject arguments
				collect: [:each {VariableDeclarationNode} | self visit: each])
		body: (self visit: anObject body)
		returnType: (self visit: anObject returnType)
		pragmas: (anObject pragmas collect: [:each {PragmaNode} | self visit: each])
		protocol: anObject protocol
		nlrMarker: nlrMarker
!
(reader addMethod: 'visiting')
!
visitLiteralNode: anObject {LiteralNode} {^LiteralNode}
	^LiteralNode new
!
(reader addMethod: 'visiting')
!
visitLocalReadNode: anObject {LocalReadNode} {^Expression}
	^LocalReadNode name: anObject name
!
(reader addMethod: 'visiting')
!
visitLocalWriteNode: anObject {LocalWriteNode} {^LocalWriteNode}
	^LocalWriteNode name: anObject name value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitMessageNode: anObject {MessageNode} {^Expression}
	^MessageNode receiver: (self visit: anObject receiver) selector: anObject selector
!
(reader addMethod: 'visiting')
!
visitMethodNode: anObject {MethodNode} {^MethodNode}
	| nlrMarker {Str} |
	nlrMarker := self produceNlrMarkerDefinition: anObject nlrMarker for: anObject.
	^MethodNode
		selector: anObject selector
		body: (self visit: anObject body)
		returnType: (self visit: anObject returnType)
		pragmas: (anObject pragmas collect: [:each {Node} | self visit: each])
		protocol: anObject protocol
		nlrMarker: nlrMarker
!
(reader addMethod: 'visiting')
!
visitNamespacedTypeVariableNode: anObject {NamespacedTypeVariableNode} {^NamespacedTypeVariableNode}
	^NamespacedTypeVariableNode path: anObject path
!
(reader addMethod: 'visiting')
!
visitNamespacedVariableNode: anObject {NamespacedVariableNode} {^NamespacedVariableNode}
	^NamespacedVariableNode path: anObject path
!
(reader addMethod: 'visiting')
!
visitNamespaceNode: aNamespaceNode {NamespaceNode} {^NamespaceNode}
	^NamespaceNode
		reference: aNamespaceNode reference
		publicImports: aNamespaceNode publicImports
		privateImports: aNamespaceNode privateImports
		sharedVariables: (aNamespaceNode sharedVariables
				collect: [:each {SharedDeclarationNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitNilLiteralNode: anObject {NilLiteralNode} {^NilLiteralNode}
	^NilLiteralNode new
!
(reader addMethod: 'visiting')
!
visitNode: anObject {Node} {^Node}
	^Node new
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^Statement}
	^NonLocalReturnNode marker: anObject marker value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitPackageNode: anObject {PackageNode} {^PackageNode}
	^PackageNode
		name: anObject name
		classes: (anObject classes collect: [:each {ClassNode} | self visit: each])
		namespaces: (anObject namespaces collect: [:each {NamespaceNode} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitPragmaNode: anObject {PragmaNode} {^PragmaNode}
	^PragmaNode expression: (self visit: anObject expression)
!
(reader addMethod: 'visiting')
!
visitReadHolderNode: anObject {ReadHolderNode} {^ReadHolderNode}
	^ReadHolderNode varName: anObject varName
!
(reader addMethod: 'visiting')
!
visitReferenceLiteralNode: anObject {ReferenceLiteralNode} {^ReferenceLiteralNode}
	^ReferenceLiteralNode path: anObject path
!
(reader addMethod: 'visiting')
!
visitReturnNode: anObject {ReturnNode} {^Statement}
	^ReturnNode value: (self visit: anObject value)
!
(reader addMethod: 'visiting')
!
visitSelfNode: anObject {SelfNode} {^Expression}
	^anObject
!
(reader addMethod: 'visiting')
!
visitSelfTypeNode: anObject {SelfTypeNode} {^SelfTypeNode}
	^SelfTypeNode new
!
(reader addMethod: 'visiting')
!
visitSequenceNode: anObject {SequenceNode} {^SequenceNode}
	^SequenceNode temporaries: (anObject temporaries
				collect: [:each {VariableDeclarationNode} | self visit: each])
		statements: (anObject statements collect: [:each {Statement} | self visit: each])
!
(reader addMethod: 'visiting')
!
visitSharedDeclarationNode: anObject {SharedDeclarationNode} {^SharedDeclarationNode}
	^SharedDeclarationNode name: anObject name initializer: (self visit: anObject initializer)
!
(reader addMethod: 'visiting')
!
visitStateAccessNode: anObject {StateAccessNode} {^StateAccessNode}
	^StateAccessNode new
!
(reader addMethod: 'visiting')
!
visitStatement: anObject {Statement} {^Statement}
	^Statement new
!
(reader addMethod: 'visiting')
!
visitStringLiteralNode: anObject {StringLiteralNode} {^StringLiteralNode}
	^StringLiteralNode value: anObject value
!
(reader addMethod: 'visiting')
!
visitSuperNode: anObject {SuperNode} {^SuperNode}
	^SuperNode reference: anObject reference
!
(reader addMethod: 'visiting')
!
visitSymbolLiteralNode: anObject {SymbolLiteralNode} {^SymbolLiteralNode}
	^SymbolLiteralNode value: anObject value
!
(reader addMethod: 'visiting')
!
visitToDoNode: anObject {ToDoNode} {^ToDoNode}
	^ToDoNode
		start: (self visit: anObject start)
		stop: (self visit: anObject stop)
		step: (self visit: anObject step)
		counterName: anObject counterName
		doSequence: (self visit: anObject doSequence)
!
(reader addMethod: 'visiting')
!
visitTypeCast: aTypeCast {TypeCast} {^TypeCast}
	^TypeCast type: (self visit: aTypeCast type)
		expression: (self visit: aTypeCast expression)
!
(reader addMethod: 'visiting')
!
visitTypeDefNode: anObject {TypeDefNode} {^TypeDefNode}
	^TypeDefNode node: (self visit: anObject node)
!
(reader addMethod: 'visiting')
!
visitTypeNode: anObject {TypeNode} {^TypeNode}
	^TypeNode new
!
(reader addMethod: 'visiting')
!
visitTypeOrNode: anObject {TypeOrNode} {^TypeNode}
	^TypeOrNode left: (self visit: anObject left) right: (self visit: anObject right)
!
(reader addMethod: 'visiting')
!
visitTypeVariableNode: anObject {TypeVariableNode} {^TypeVariableNode}
	^TypeVariableNode name: anObject name
!
(reader addMethod: 'visiting')
!
visitUnaryMessageNode: anObject {UnaryMessageNode} {^Statement}
	^UnaryMessageNode receiver: (self visit: anObject receiver) selector: anObject selector
!
(reader addMethod: 'visiting')
!
visitUnaryMethodNode: anObject {UnaryMethodNode} {^MethodNode}
	| nlrMarker {Str} |
	nlrMarker := self produceNlrMarkerDefinition: anObject nlrMarker for: anObject.
	^UnaryMethodNode
		selector: anObject selector
		body: (self visit: anObject body)
		returnType: (self visit: anObject returnType)
		pragmas: (anObject pragmas collect: [:each {PragmaNode} | self visit: each])
		protocol: anObject protocol
		nlrMarker: nlrMarker
!
(reader addMethod: 'visiting')
!
visitVariableDeclarationNode: anObject {VariableDeclarationNode} {^VariableDeclarationNode}
	^VariableDeclarationNode name: anObject name type: (self visit: anObject type)
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	^VariableNode name: anObject name
!
(reader addMethod: 'visiting')
!
visitWhileFalseNode: anObject {WhileFalseNode} {^WhileFalseNode}
	^WhileFalseNode testSequence: (self visit: anObject testSequence)
		doSequence: (self visit: anObject doSequence)
!
(reader addMethod: 'visiting')
!
visitWhileNode: anObject {WhileNode} {^WhileNode}
	^WhileNode testSequence: (self visit: anObject testSequence)
		doSequence: (self visit: anObject doSequence)
!
(reader addMethod: 'visiting')
!
visitWhileTrueNode: anObject {WhileTrueNode} {^WhileTrueNode}
	^WhileTrueNode testSequence: (self visit: anObject testSequence)
		doSequence: (self visit: anObject doSequence)
!
(reader addMethod: 'visiting')
!
visitWriteHolderNode: anObject {WriteHolderNode} {^WriteHolderNode}
	^WriteHolderNode varName: anObject varName value: (self visit: anObject value)
!
(reader addClassMethod: 'pegon')
!
supertype
	^#{NodeVisitor} => #{Node}
!
(reader addClassMethod: 'pegon')
!
typeParameters
	^#()
!
