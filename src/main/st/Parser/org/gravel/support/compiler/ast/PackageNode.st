(reader defineClass: 'PackageNode' superclass: 'org.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'classes')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'namespaces')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self == anObject or: 
			[self class = anObject class and: [classes = anObject classes and: [name = anObject name]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitPackageNode: self
!
(reader addMethod: 'accessing')
!
classes {^Arr[ClassNode]}
	^classes
!
(reader addMethod: 'As yet unclassified')
!
classNodeAt: reference {Reference} ifAbsent: aBlock {[^ClassNode]} {^ClassNode}
	^classes detect: [:each {ClassNode} | each reference = reference] ifNone: aBlock
!
(reader addMethod: 'As yet unclassified')
!
copyUpdateClassNode: aReference {Reference} do: aBlock {[ClassNode, ^ClassNode]} {^PackageNode}
	^self copy pvtSetClasses: (classes
				collect: [:each {ClassNode} | each reference = aReference ifTrue: [aBlock value: each] ifFalse: [each]])
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(self class hash bitXor: classes hash) bitXor: name hash
!
(reader addMethod: 'initialize-release')
!
initializeName: anUndefinedObject {Sym} classes: anArray {Arr[ClassNode]} namespaces: anArray2 {Arr[NamespaceNode]} {^Self}
	name := anUndefinedObject.
	classes := anArray.
	namespaces := anArray2.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Sym}
	^name
!
(reader addMethod: 'accessing')
!
namespaces {^Arr[NamespaceNode]}
	^namespaces
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	classes do: aBlock.
	namespaces do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
pvtSetClasses: anArray {Arr[ClassNode]} {^Self}
	classes := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetName: aSymbol {Sym} {^Self}
	name := aSymbol
!
(reader addMethod: 'As yet unclassified')
!
pvtSetNamespaces: anArray {Arr[NamespaceNode]} {^Self}
	namespaces := anArray
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: name
!
(reader addMethod: 'As yet unclassified')
!
withClass: aClassNode {ClassNode} {^PackageNode}
	^self copy pvtSetClasses: (classes copyWith: aClassNode)
!
(reader addMethod: 'As yet unclassified')
!
withName: aSymbol {Sym} {^PackageNode}
	^self copy pvtSetName: aSymbol
!
(reader addMethod: 'As yet unclassified')
!
withNamespace: aNamespaceNode {NamespaceNode} {^PackageNode}
	| current {NamespaceNode | Nil} merged {NamespaceNode} |
	current := namespaces
				detect: [:each {NamespaceNode} | each reference = aNamespaceNode reference]
				ifNone: [nil].
	merged := current isNil
				ifTrue: [aNamespaceNode]
				ifFalse: [current mergeWith: aNamespaceNode].
	^self copy pvtSetNamespaces: (namespaces copyWith: merged)
!
(reader addMethod: 'As yet unclassified')
!
withPackage: aPackageNode {PackageNode} {^PackageNode}
	^PackageNode
		name: name
		classes: (classes copyWithAll: aPackageNode classes)
		namespaces: (namespaces copyWithAll: aPackageNode namespaces)
!
(reader addClassMethod: 'instance creation')
!
empty {^PackageNode}
	^self name: nil classes: #() namespaces: #()
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[ClassNode], Sym, Arr[NamespaceNode]]}
	^#('classes' 'name' 'namespaces')
!
(reader addClassMethod: 'instance creation')
!
name: aSymbol {Sym} {^Instance}
	^self name: aSymbol classes: #() namespaces: #()
!
(reader addClassMethod: 'instance creation')
!
name: anUndefinedObject {Sym} classes: anArray {Arr[ClassNode]} namespaces: anArray2 {Arr[NamespaceNode]} {^PackageNode}
	^self new initializeName: anUndefinedObject classes: anArray namespaces: anArray2
!
