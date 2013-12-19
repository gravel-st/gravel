(reader defineClass: 'EmptyTraitUsageNode' superclass: 'org.gravel.support.compiler.ast.TraitUsageNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitEmptyTraitUsageNode: self
!
(reader addMethod: 'As yet unclassified')
!
allMethodsIn: aSystemNode {SystemNode} do: aBlock {[MethodNode, ^Object]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
components {^Arr[SimpleTraitUsageNode]}
	^#()
!
(reader addMethod: 'As yet unclassified')
!
flattenClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} in: aSystemNode {SystemNode} {^ClassDescriptionNode}
	^aClassDescriptionNode
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
prerequisiteReferences {^Arr[Reference]}
	^#()
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^TraitUsageNode}
	^aTraitUsageNode
!
