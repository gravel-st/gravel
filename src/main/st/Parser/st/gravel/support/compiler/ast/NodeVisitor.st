(reader defineClass: 'NodeVisitor' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visit: anObject {Node} {^X}
	^anObject accept: self
!
(reader addMethod: 'visiting')
!
visitArrayAccessNode: anObject {ArrayAccessNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitArrayAtNode: anObject {ArrayAtNode} {^X}
	^self visitArrayAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitArrayAtPutNode: anObject {ArrayAtPutNode} {^X}
	^self visitArrayAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitArrayLiteralNode: anObject {ArrayLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitArraySizeNode: anObject {ArraySizeNode} {^X}
	^self visitArrayAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject {AssignmentNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitBinaryMessageNode: anObject {BinaryMessageNode} {^X}
	^self visitMessageNode: anObject
!
(reader addMethod: 'visiting')
!
visitBinaryMethodNode: anObject {BinaryMethodNode} {^X}
	^self visitMethodNode: anObject
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitBlockTypeNode: anObject {BlockTypeNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitBooleanAndNode: anObject {BooleanAndNode} {^X}
	^self visitBooleanBinaryNode: anObject
!
(reader addMethod: 'visiting')
!
visitBooleanBinaryNode: anObject {BooleanBinaryNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitBooleanLiteralNode: anObject {BooleanLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitBooleanOrNode: anObject {BooleanOrNode} {^X}
	^self visitBooleanBinaryNode: anObject
!
(reader addMethod: 'visiting')
!
visitBottomTypeNode: anObject {BottomTypeNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitBoundVariableDeclarationNode: anObject {BoundVariableDeclarationNode} {^X}
	^self visitVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitByteArrayLiteralNode: anObject {ByteArrayLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitCascadeNode: anObject {CascadeNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitCharacterLiteralNode: anObject {CharacterLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitClassDescriptionNode: anObject {ClassDescriptionNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitClassNode: anObject {ClassNode} {^X}
	^self visitClassDescriptionNode: anObject
!
(reader addMethod: 'visiting')
!
visitClassTypeNode: anObject {ClassTypeNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitCompositeTraitUsageNode: anObject {CompositeTraitUsageNode} {^X}
	^self visitTraitUsageNode: anObject
!
(reader addMethod: 'visiting')
!
visitCreateHolderNode: anObject {CreateHolderNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitDoubleLiteralNode: anObject {DoubleLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitEmptyTraitUsageNode: anObject {EmptyTraitUsageNode} {^X}
	^self visitTraitUsageNode: anObject
!
(reader addMethod: 'visiting')
!
visitExpression: anObject {Expression} {^X}
	^self visitStatement: anObject
!
(reader addMethod: 'visiting')
!
visitFieldReadNode: anObject {FieldReadNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitFieldWriteNode: anObject {FieldWriteNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitFixedPointLiteralNode: anObject {FixedPointLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitFloatLiteralNode: anObject {FloatLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitGenericTypeVariableNode: anObject {GenericTypeVariableNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitGlobalReadNode: anObject {GlobalReadNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitGlobalWriteNode: anObject {GlobalWriteNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitHolderDeclarationNode: anObject {HolderDeclarationNode} {^X}
	^self visitVariableDeclarationNode: anObject
!
(reader addMethod: 'visiting')
!
visitIdentityComparisonNode: anObject {IdentityComparisonNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitIfTrueIfFalseNode: anObject {IfTrueIfFalseNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitInlineExpressionCollection: anObject {InlineExpressionCollection} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitInstanceCreationNode: anObject {InstanceCreationNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitInstanceTypeNode: anObject {InstanceTypeNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitIntegerLiteralNode: anObject {IntegerLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitIntermediateNode: anObject {IntermediateNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitIntermediateStatement: anObject {IntermediateStatement} {^X}
	^self visitStatement: anObject
!
(reader addMethod: 'visiting')
!
visitIsNilNode: anObject {IsNilNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitKeywordMessageNode: anObject {KeywordMessageNode} {^X}
	^self visitMessageNode: anObject
!
(reader addMethod: 'visiting')
!
visitKeywordMethodNode: anObject {KeywordMethodNode} {^X}
	^self visitMethodNode: anObject
!
(reader addMethod: 'visiting')
!
visitLiteralNode: anObject {LiteralNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitLocalReadNode: anObject {LocalReadNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitLocalWriteNode: anObject {LocalWriteNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitMessageNode: anObject {MessageNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitMetaclassNode: anObject {MetaclassNode} {^X}
	^self visitClassDescriptionNode: anObject
!
(reader addMethod: 'visiting')
!
visitMethodNode: anObject {MethodNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitNamespacedTypeVariableNode: anObject {NamespacedTypeVariableNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitNamespacedVariableNode: anObject {NamespacedVariableNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitNamespaceNode: anObject {NamespaceNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitNilLiteralNode: anObject {NilLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitNode: anObject {Node} {^X}
	NodeVisitorError raise
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^X}
	^self visitIntermediateStatement: anObject
!
(reader addMethod: 'visiting')
!
visitNumberLiteralNode: anObject {NumberLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitPackageNode: anObject {PackageNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitPragmaNode: anObject {PragmaNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitReadHolderNode: anObject {ReadHolderNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitReferenceLiteralNode: anObject {ReferenceLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitReturnNode: anObject {ReturnNode} {^X}
	^self visitStatement: anObject
!
(reader addMethod: 'visiting')
!
visitSelfNode: anObject {SelfNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitSelfTypeNode: anObject {SelfTypeNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitSequenceNode: anObject {SequenceNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitSharedDeclarationNode: anObject {SharedDeclarationNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitSimpleTraitUsageNode: anObject {SimpleTraitUsageNode} {^X}
	^self visitTraitUsageNode: anObject
!
(reader addMethod: 'visiting')
!
visitStateAccessNode: anObject {StateAccessNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitStatement: anObject {Statement} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitStringLiteralNode: anObject {StringLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitSuperNode: anObject {SuperNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addMethod: 'visiting')
!
visitSymbolLiteralNode: anObject {SymbolLiteralNode} {^X}
	^self visitLiteralNode: anObject
!
(reader addMethod: 'visiting')
!
visitSystemDefinitionNode: anObject {SystemDefinitionNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitSystemNode: anObject {SystemNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitToDoNode: anObject {ToDoNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitTraitUsageNode: anObject {TraitUsageNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitTypeCast: aTypeCast {TypeCast} {^X}
	^self visitExpression: aTypeCast
!
(reader addMethod: 'visiting')
!
visitTypeDefNode: anObject {TypeDefNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitTypeNode: anObject {TypeNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitTypeOrNode: anObject {TypeOrNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitTypeVariableNode: anObject {TypeVariableNode} {^X}
	^self visitTypeNode: anObject
!
(reader addMethod: 'visiting')
!
visitUnaryMessageNode: anObject {UnaryMessageNode} {^X}
	^self visitMessageNode: anObject
!
(reader addMethod: 'visiting')
!
visitUnaryMethodNode: anObject {UnaryMethodNode} {^X}
	^self visitMethodNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableDeclarationNode: anObject {VariableDeclarationNode} {^X}
	^self visitNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^X}
	^self visitExpression: anObject
!
(reader addMethod: 'visiting')
!
visitWhileFalseNode: aNode {WhileFalseNode} {^X}
	^self visitWhileNode: aNode
!
(reader addMethod: 'visiting')
!
visitWhileNode: anObject {WhileNode} {^X}
	^self visitIntermediateNode: anObject
!
(reader addMethod: 'visiting')
!
visitWhileTrueNode: aNode {WhileTrueNode} {^X}
	^self visitWhileNode: aNode
!
(reader addMethod: 'visiting')
!
visitWriteHolderNode: anObject {WriteHolderNode} {^X}
	^self visitStateAccessNode: anObject
!
(reader addClassMethod: 'instance creation')
!
new {^Instance}
	^super new initialize
!
(reader addClassMethod: 'pegon')
!
typeParameters
	^#(#X)
!
(reader addClassMethod: 'As yet unclassified')
!
visit: anObject {Node} {^X}
	^self new visit: anObject
!
