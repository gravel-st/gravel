(reader defineClass: 'PackageNodeMerger' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'systemDefinitionNode')
!
(reader addMethod: 'initialize-release')
!
initializeSystemDefinitionNode: aSystemDefinitionNode {SystemDefinitionNode} {^Self}
	systemDefinitionNode := aSystemDefinitionNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
load {^SystemNode}
	| classNodes {Dict[Reference, ClassNode]} classDescriptionNodes {Dict[Reference, ClassDescriptionNode]} namespaceNodes {Dict[Reference, NamespaceNode]} |
	classNodes := Dictionary new.
	namespaceNodes := Dictionary new.
	self packageClassNodesDo: 
			[:classNode {ClassNode} |
			classNode isExtension
				ifFalse: 
					[| reference {Reference} |
					reference := classNode reference.
					(classNodes includesKey: reference)
						ifTrue: [self error: 'Class ' , reference printString , ' defined twice'].
					classNodes at: reference put: classNode]].
	self packageClassNodesDo: 
			[:classNode {ClassNode} |
			classNode isExtension
				ifTrue: 
					[| reference {Reference} |
					reference := classNode reference.
					(classNodes includesKey: reference)
						ifFalse: [self error: 'Can''t extend Class ' , reference printString , '; not defined yet'].
					classNodes at: reference put: ((classNodes at: reference) mergedWithExtension: classNode)]].
	classDescriptionNodes := Dictionary new.
	classNodes do: 
			[:classNode {ClassNode} |
			classDescriptionNodes at: classNode reference put: classNode.
			classDescriptionNodes at: classNode metaclassNode reference put: classNode metaclassNode].
	self packageNamespaceNodesDo: 
			[:namespaceNode {NamespaceNode} |
			| reference {Reference} |
			reference := namespaceNode reference.
			(namespaceNodes includesKey: reference)
				ifTrue: 
					[namespaceNodes at: reference
						put: (namespaceNode mergeWith: (namespaceNodes at: reference))]
				ifFalse: [namespaceNodes at: reference put: namespaceNode]].
	classNodes keysDo: 
			[:ref {Reference} |
			| namespace {AbsoluteReference} |
			namespace := ref namespace.
			namespaceNodes at: namespace ifAbsentPut: [NamespaceNode for: namespace]].
	^(SystemNode classDescriptionNodes: classDescriptionNodes namespaceNodes: namespaceNodes)
		flattenTraits
!
(reader addMethod: 'initialize-release')
!
packageClassNodesDo: aBlock {[ClassNode, ^Object]} {^Self}
	systemDefinitionNode packageNodes
		do: [:packageNode {PackageNode} | packageNode classes do: aBlock]
!
(reader addMethod: 'initialize-release')
!
packageNamespaceNodesDo: aBlock {[NamespaceNode, ^Object]} {^Self}
	systemDefinitionNode packageNodes
		do: [:packageNode {PackageNode} | packageNode namespaces do: aBlock]
!
(reader addMethod: 'accessing')
!
systemDefinitionNode {^SystemDefinitionNode}
	^systemDefinitionNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SystemDefinitionNode]}
	^#('systemDefinitionNode')
!
(reader addClassMethod: 'instance creation')
!
systemDefinitionNode: aSystemDefinitionNode {SystemDefinitionNode} {^Instance}
	^self new initializeSystemDefinitionNode: aSystemDefinitionNode
!
