(reader defineClass: 'SystemDefinitionNode' superclass: 'st.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'packageNodes' type: 'Array[PackageNode]')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSystemDefinitionNode: self
!
(reader addMethod: 'As yet unclassified')
!
classNodeAt: reference {Reference} ifAbsent: aBlock {[^ClassNode]} {^ClassNode}
	| cn {ClassNode} |
	packageNodes do: 
			[:each {PackageNode} |
			cn := each classNodeAt: reference ifAbsent: [nil].
			cn isNil ifFalse: [^cn]].
	^aBlock value
!
(reader addMethod: 'accessing')
!
copyUpdatePackage: packageName {Sym} do: aBlock {[PackageNode, ^PackageNode]} {^Self}
	| idx {Int} updatedPackage {PackageNode} |
	idx := packageNodes indexWhere: [:pkg {PackageNode} | pkg name = packageName].
	updatedPackage := aBlock value: (packageNodes at: idx).
	^self copy pvtSetPackageNodes: (packageNodes copyAt: idx put: updatedPackage)
!
(reader addMethod: 'initialize-release')
!
initializePackageNodes: anArray {Arr[PackageNode]} {^Self}
	packageNodes := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	packageNodes do: aBlock
!
(reader addMethod: 'accessing')
!
packageNames {^Arr[Sym]}
	^packageNodes collect: [:each {PackageNode} | each name]
!
(reader addMethod: 'accessing')
!
packageNodes {^Arr[PackageNode]}
	^packageNodes
!
(reader addMethod: 'accessing')
!
pvtSetPackageNodes: anArray {Arr[PackageNode]} {^Self}
	packageNodes := anArray
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'accessing')
!
withPackageNamed: packageName {Sym} classNode: aClassNode {ClassNode} {^Self}
	^self withPackageNode: (PackageNode
				name: packageName
				classes: (Array with: aClassNode)
				namespaces: #())
!
(reader addMethod: 'accessing')
!
withPackageNode: aPackageNode {PackageNode} {^Self}
	^self copy pvtSetPackageNodes: (packageNodes copyWith: aPackageNode)
!
(reader addClassMethod: 'instance creation')
!
packageNodes: anArray {Arr[PackageNode]} {^Instance}
	^self new initializePackageNodes: anArray
!
