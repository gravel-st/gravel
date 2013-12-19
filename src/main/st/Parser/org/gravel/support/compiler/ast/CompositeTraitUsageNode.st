(reader defineClass: 'CompositeTraitUsageNode' superclass: 'org.gravel.support.compiler.ast.TraitUsageNode')
!
(reader addInstVar: 'components')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitCompositeTraitUsageNode: self
!
(reader addMethod: 'As yet unclassified')
!
allMethodsIn: aSystemNode {SystemNode} do: aBlock {[MethodNode, ^Object]} {^Self}
	components do: [:each {SimpleTraitUsageNode} | each allMethodsIn: aSystemNode do: aBlock]
!
(reader addMethod: 'accessing')
!
components {^Arr[SimpleTraitUsageNode]}
	^components
!
(reader addMethod: 'As yet unclassified')
!
flattenClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} in: aSystemNode {SystemNode} {^ClassDescriptionNode}
	| n {ClassDescriptionNode} definedInOtherTraits {Set[Str]} requirements {OrdColl[MethodNode]} |
	n := aClassDescriptionNode.
	definedInOtherTraits := Set new.
	requirements := OrderedCollection new.
	components do: 
			[:component {SimpleTraitUsageNode} |
			component allMethodsIn: aSystemNode
				do: 
					[:method {MethodNode} |
					| canUnderstand {Bool} |
					canUnderstand := aClassDescriptionNode canUnderstand: method selector in: aSystemNode.
					method isTraitRequirement
						ifTrue: [canUnderstand ifFalse: [requirements add: (method ofTrait: component reference)]]
						ifFalse: 
							[canUnderstand
								ifFalse: 
									[(definedInOtherTraits includes: method selector)
										ifTrue: 
											[n := n withMethodNode: (method
																withBody: (SequenceNode statement: (SelfNode new send: 'traitConflict')))
														ofTrait: component reference]
										ifFalse: [n := n withMethodNode: method ofTrait: component reference]].
							definedInOtherTraits add: method selector]]].
	requirements do: 
			[:method {MethodNode} |
			(definedInOtherTraits includes: method selector)
				ifFalse: 
					[n := n withMethodNode: (method
										withBody: (SequenceNode statement: (SelfNode new send: 'traitRequirementNotDefined')))]].
	^n
!
(reader addMethod: 'initialize-release')
!
initializeComponents: anArray {Arr[SimpleTraitUsageNode]} {^Self}
	components := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	components do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
prerequisiteReferences {^Arr[Reference]}
	^components collect: [:each {SimpleTraitUsageNode} | each reference]
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	components do: [:each {SimpleTraitUsageNode} | each sourceOn: aStream]
		separatedBy: [aStream nextPutAll: ' + ']
!
(reader addMethod: 'As yet unclassified')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^TraitUsageNode}
	^CompositeTraitUsageNode components: (aTraitUsageNode components copyWithAll: components)
!
(reader addClassMethod: 'instance creation')
!
components: anArray {Arr[SimpleTraitUsageNode]} {^CompositeTraitUsageNode}
	^self new initializeComponents: anArray
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[SimpleTraitUsageNode]]}
	^#('components')
!
