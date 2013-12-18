(reader defineClass: 'SimpleTraitUsageNode' superclass: 'org.gravel.support.compiler.ast.TraitUsageNode')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'methodOperations')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSimpleTraitUsageNode: self
!
(reader addMethod: 'As yet unclassified')
!
allMethodsIn: aSystemNode {SystemNode} do: aBlock {[MethodNode, ^Object]} {^Self}
	| trait {ClassDescriptionNode} |
	trait := aSystemNode classNodeAt: reference.
	trait allMethodsIn: aSystemNode do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
components {^Arr[SimpleTraitUsageNode]}
	^Array with: self
!
(reader addMethod: 'As yet unclassified')
!
flattenClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} in: aSystemNode {SystemNode} {^ClassDescriptionNode}
	| n {ClassDescriptionNode} |
	n := aClassDescriptionNode.
	self allMethodsIn: aSystemNode
		do: 
			[:method {MethodNode} |
			| canUnderstand {Bool} |
			canUnderstand := n canUnderstand: method selector in: aSystemNode.
			method isTraitRequirement
				ifTrue: 
					[canUnderstand
						ifFalse: 
							[n := n withMethodNode: (method
												withBody: (SequenceNode statement: (SelfNode new send: 'traitRequirementNotDefined')))
										ofTrait: reference]]
				ifFalse: [canUnderstand ifFalse: [n := n withMethodNode: method ofTrait: reference]]].
	^n
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {Reference} methodOperations: anArray {Arr[TraitMethodOperation]} {^Self}
	reference := anAbsoluteReference.
	methodOperations := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
methodOperations {^Arr[TraitMethodOperation]}
	^methodOperations
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	methodOperations do: aBlock
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^reference
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: reference printString
!
(reader addMethod: 'As yet unclassified')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^TraitUsageNode}
	| components {Arr[SimpleTraitUsageNode]} |
	components := aTraitUsageNode components copyWith: self.
	^CompositeTraitUsageNode components: components
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Reference, Arr[TraitMethodOperation]]}
	^#('reference' 'methodOperations')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} {^SimpleTraitUsageNode}
	^self reference: anAbsoluteReference methodOperations: #()
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {Reference} methodOperations: anArray {Arr[TraitMethodOperation]} {^SimpleTraitUsageNode}
	^self new initializeReference: anAbsoluteReference methodOperations: anArray
!
