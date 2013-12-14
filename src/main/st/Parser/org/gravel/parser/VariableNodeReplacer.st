(reader defineClass: 'VariableNodeReplacer' superclass: 'org.gravel.parser.NodeCopierWithLocals')
!
(reader addInstVar: 'varName')
!
(reader addInstVar: 'replacementBlock')
!
(reader addMethod: 'visiting')
!
buildReplacement {^Expression}
	^replacementBlock value: localNames
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {Str} replacementBlock: aBlock {[Set[Str], ^Expression]} {^Self}
	varName := aString.
	replacementBlock := aBlock.
	self initialize
!
(reader addMethod: 'accessing')
!
varName {^Str}
	^varName
!
(reader addMethod: 'visiting')
!
visitFieldReadNode: anObject {FieldReadNode} {^Expression}
	anObject name = varName ifTrue: [^self buildReplacement].
	^super visitFieldReadNode: anObject
!
(reader addMethod: 'visiting')
!
visitGlobalReadNode: anObject {GlobalReadNode} {^Expression}
	anObject name = varName ifTrue: [^self buildReplacement].
	^super visitGlobalReadNode: anObject
!
(reader addMethod: 'visiting')
!
visitLocalReadNode: anObject {LocalReadNode} {^Expression}
	anObject name = varName ifTrue: [^self buildReplacement].
	^super visitLocalReadNode: anObject
!
(reader addMethod: 'visiting')
!
visitSelfNode: anObject {SelfNode} {^Expression}
	varName = 'self' ifTrue: [^self buildReplacement].
	^anObject
!
(reader addMethod: 'visiting')
!
visitSuperNode: anObject {SuperNode} {^SuperNode}
	varName = 'self' ifTrue: [self error: 'Cant rename super'].
	^super visitSuperNode: anObject
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Expression}
	anObject name = varName ifTrue: [^self buildReplacement].
	^super visitVariableNode: anObject
!
(reader addClassMethod: 'As yet unclassified')
!
for: aNode {Node} renameAll: localNames {Set[Str]} in: replacementNode {Expression} {^Expression}
	| lsi {LiteralSendInliner} res {Expression} |
	lsi := LiteralSendInliner new.
	lsi initializeRoot: aNode.
	lsi addUsedNode: replacementNode.
	res := replacementNode.
	localNames do: 
			[:oldName {Str} |
			| newName {Str} |
			newName := lsi newTempName: oldName.
			res := LocalDefinedVariableRenamer in: res rename: oldName to: newName].
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
in: aNode {Node} replace: varName {Str} with: replacementNode {Expression} {^Node}
	^(self varName: varName
		replacementBlock: [:localNames {Set[Str]} | self for: aNode renameAll: localNames in: replacementNode])
			visit: aNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, [Set[Str], ^Expression]]}
	^#('varName' 'replacementBlock')
!
(reader addClassMethod: 'instance creation')
!
varName: varName {Str} replacementBlock: aBlock {[Set[Str], ^Expression]} {^Instance}
	^self new initializeVarName: varName replacementBlock: aBlock
!
