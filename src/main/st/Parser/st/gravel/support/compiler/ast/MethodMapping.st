(reader defineClass: 'MethodMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMethodMapping')
!
(reader addInstVar: 'methodNode' type: 'MethodNode')
!
(reader addMethod: 'initialize-release')
!
initializeMethodNode: aKeywordMethodNode {MethodNode} methodHandle: aJavaMethodHandle {JavaMethodHandle} definingClass: aJavaClass {JavaClass} {^Self}
	methodNode := aKeywordMethodNode.
	methodHandle := aJavaMethodHandle.
	definingClass := aJavaClass.
	self initialize
!
(reader addMethod: 'accessing')
!
methodNode {^MethodNode}
	^methodNode
!
(reader addMethod: 'As yet unclassified')
!
selector {^Str}
	^methodNode selector
!
(reader addClassMethod: 'instance creation')
!
methodNode: aKeywordMethodNode {MethodNode} methodHandle: aJavaMethodHandle {JavaMethodHandle} definingClass: definingClass {JavaClass} {^AbstractMethodMapping}
	^self new
		initializeMethodNode: aKeywordMethodNode
		methodHandle: aJavaMethodHandle
		definingClass: definingClass
!
