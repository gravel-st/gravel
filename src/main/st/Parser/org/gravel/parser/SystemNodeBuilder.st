(reader defineClass: 'SystemNodeBuilder' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'packages')
!
(reader addMethod: 'initialize-release')
!
initializePackages: anOrderedCollection {OrdColl[PackageNode]} {^Self}
	packages := anOrderedCollection.
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
			(namespaceNodes includesKey: reference) ifTrue: [self error: 'todo: merging'].
			namespaceNodes at: reference put: namespaceNode].
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
	packages do: [:packageNode {PackageNode} | packageNode classes do: aBlock]
!
(reader addMethod: 'initialize-release')
!
packageNamespaceNodesDo: aBlock {[NamespaceNode, ^Object]} {^Self}
	packages do: [:packageNode {PackageNode} | packageNode namespaces do: aBlock]
!
(reader addMethod: 'accessing')
!
packages {^OrdColl[PackageNode]}
	^packages
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[OrdColl[PackageNode]]}
	^#('packages')
!
(reader addClassMethod: 'instance creation')
!
packages: anOrderedCollection {OrdColl[PackageNode]} {^Instance}
	^self new initializePackages: anOrderedCollection
!
