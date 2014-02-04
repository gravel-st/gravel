(reader defineClass: 'CompositeTraitUsageNode' superclass: 'st.gravel.support.compiler.ast.TraitUsageNode')
!
(reader addInstVar: 'components' type: 'Array[SimpleTraitUsageNode]')
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
componentsDefining: selector {Str} in: aSystemNode {SystemNode} {^Arr[SimpleTraitUsageNode]}
	^components
		select: [:each {SimpleTraitUsageNode} | each canUnderstand: selector in: aSystemNode]
!
(reader addMethod: 'As yet unclassified')
!
conflicts: other {MethodNode} with: method {MethodNode} {^Bool}
	^(other sourceString = method sourceString) not
!
(reader addMethod: 'As yet unclassified')
!
flattenClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} in: aSystemNode {SystemNode} {^ClassDescriptionNode}
	| n {ClassDescriptionNode} definitionInOtherTraits {Dictionary[Str, MethodNode]} requirements {OrdColl[MethodNode]} |
	n := aClassDescriptionNode.
	definitionInOtherTraits := Dictionary new.
	requirements := OrderedCollection new.
	components do: 
			[:component {SimpleTraitUsageNode} |
			component allMethodsIn: aSystemNode
				do: 
					[:method {MethodNode} |
					| canUnderstand {Bool} selector {Str} |
					selector := method selector.
					canUnderstand := aClassDescriptionNode canUnderstand: selector in: aSystemNode.
					method isTraitRequirement
						ifTrue: [canUnderstand ifFalse: [requirements add: (method ofTrait: component reference)]]
						ifFalse: 
							[(aClassDescriptionNode includesSelector: selector)
								ifFalse: 
									[| other {MethodNode | Nil} |
									other := definitionInOtherTraits at: selector ifAbsent: [nil].
									other notNil
										ifTrue: 
											[(self conflicts: other with: method)
												ifTrue: 
													[n := n
																copyReplaceMethodNode: (method withBody: (SequenceNode
																				statement: ((GlobalReadNode namespace: AbsoluteReference object name: 'TraitConflict')
																						send: 'raiseSignal:'
																						with: (StringLiteralNode value: (self traitConflictStringFor: selector in: aSystemNode)))))]]
										ifFalse: [n := n withMethodNode: method ofTrait: component reference]].
							definitionInOtherTraits at: method selector put: method]]].
	requirements do: 
			[:method {MethodNode} |
			((definitionInOtherTraits includesKey: method selector)
				or: [n includesSelector: method selector])
					ifFalse: [n := n withMethodNode: (self newTraitRequirementNotDefinedFor: method)]].
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
traitConflictStringFor: selector {Str} in: aSystemNode {SystemNode} {^Str}
	^'TraitConflict: #' , selector printString , ' defined in: '
		, ((self componentsDefining: selector in: aSystemNode)
				join: [:each {SimpleTraitUsageNode} | each reference printString]
				with: ', ')
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
