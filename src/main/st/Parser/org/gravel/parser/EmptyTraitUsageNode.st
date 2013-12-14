(reader defineClass: 'EmptyTraitUsageNode' superclass: 'org.gravel.parser.TraitUsageNode')
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
flattenClassNode: aClassNode {ClassNode} in: aSystemNode {SystemNode} {^ClassNode}
	^aClassNode
!
(reader addMethod: 'As yet unclassified')
!
flattenMetaclassNode: aMetaclassNode {MetaclassNode} in: aSystemNode {SystemNode} {^MetaclassNode}
	^aMetaclassNode
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
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^TraitUsageNode}
	^aTraitUsageNode
!
