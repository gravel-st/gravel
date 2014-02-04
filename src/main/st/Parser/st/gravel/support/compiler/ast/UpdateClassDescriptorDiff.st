(reader defineClass: 'UpdateClassDescriptorDiff' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'methodNodes' type: 'Array[MethodNode]')
!
(reader addInstVar: 'updatedMethodNodes' type: 'Array[MethodNode]')
!
(reader addInstVar: 'deletedSelectors' type: 'Array[String]')
!
(reader addMethod: 'As yet unclassified')
!
applyOnClassNode: startClassNode {ClassDescriptionNode} {^ClassDescriptionNode}
	| classNode {ClassDescriptionNode} |
	classNode := methodNodes inject: startClassNode
				into: [:cn {ClassDescriptionNode} :m {MethodNode} | cn withMethodNode: m].
	classNode := updatedMethodNodes inject: classNode
				into: [:cn {ClassDescriptionNode} :m {MethodNode} | cn copyReplaceMethodNode: m].
	^deletedSelectors inject: classNode
		into: [:cn {ClassDescriptionNode} :sel {Str} | cn copyRemoveSelector: sel]
!
(reader addMethod: 'accessing')
!
deletedSelectors {^Arr[Str]}
	^deletedSelectors
!
(reader addMethod: 'initialize-release')
!
initializeMethodNodes: anArray {Arr[MethodNode]} updatedMethodNodes: anArray2 {Arr[MethodNode]} deletedSelectors: anArray3 {Arr[Str]} {^Self}
	methodNodes := anArray.
	updatedMethodNodes := anArray2.
	deletedSelectors := anArray3.
	self initialize
!
(reader addMethod: 'accessing')
!
isEmpty {^Bool}
	^methodNodes isEmpty and: [updatedMethodNodes isEmpty and: [deletedSelectors isEmpty]]
!
(reader addMethod: 'accessing')
!
methodNodes {^Arr[MethodNode]}
	^methodNodes
!
(reader addMethod: 'As yet unclassified')
!
pvtSetDeletedSelectors: anArray {Arr[Str]} {^Self}
	deletedSelectors := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetMethodNodes: anArray {Arr[MethodNode]} {^Self}
	methodNodes := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetUpdatedMethodNodes: anArray {Arr[MethodNode]} {^Self}
	updatedMethodNodes := anArray
!
(reader addMethod: 'accessing')
!
updatedMethodNodes {^Arr[MethodNode]}
	^updatedMethodNodes
!
(reader addMethod: 'As yet unclassified')
!
withAddMethodNode: aMethodNode {MethodNode} {^Self}
	^self copy pvtSetMethodNodes: (methodNodes copyWith: aMethodNode)
!
(reader addMethod: 'As yet unclassified')
!
withDeletedSelector: aString {Str} {^Self}
	^self copy pvtSetDeletedSelectors: (deletedSelectors copyWith: aString)
!
(reader addMethod: 'As yet unclassified')
!
withUpdateMethodNode: aMethodNode {MethodNode} {^Self}
	^self copy pvtSetUpdatedMethodNodes: (updatedMethodNodes copyWith: aMethodNode)
!
(reader addClassMethod: 'As yet unclassified')
!
empty {^UpdateClassDescriptorDiff}
	^self methodNodes: #() updatedMethodNodes: #() deletedSelectors: #()
!
(reader addClassMethod: 'instance creation')
!
methodNodes: anArray {Arr[MethodNode]} updatedMethodNodes: anArray2 {Arr[MethodNode]} deletedSelectors: anArray3 {Arr[Str]} {^UpdateClassDescriptorDiff}
	^self new
		initializeMethodNodes: anArray
		updatedMethodNodes: anArray2
		deletedSelectors: anArray3
!
