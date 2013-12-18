(reader defineClass: 'TraitUsageNode' superclass: 'org.gravel.support.compiler.ast.Node')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTraitUsageNode: self
!
(reader addMethod: 'As yet unclassified')
!
allMethodsIn: aSystemNode {SystemNode} do: aBlock {[MethodNode, ^Object]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
components {^Arr[SimpleTraitUsageNode]}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
flattenClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} in: aSystemNode {SystemNode} {^ClassDescriptionNode}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
flattenClassNode: aClassNode {ClassNode} in: aSystemNode {SystemNode} {^ClassNode}
	^self flattenClassDescriptionNode: aClassNode in: aSystemNode
!
(reader addMethod: 'As yet unclassified')
!
flattenMetaclassNode: aMetaclassNode {MetaclassNode} in: aSystemNode {SystemNode} {^MetaclassNode}
	^self flattenClassDescriptionNode: aMetaclassNode in: aSystemNode
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^TraitUsageNode}
	^self subclassResponsibility
!
