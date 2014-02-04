(reader defineClass: 'BlockSendArgument' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'blockNode' type: 'BlockNode')
!
(reader addInstVar: 'copiedVariables' type: 'Array[JVMVariable]')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addMethod: 'accessing')
!
blockNode {^BlockNode}
	^blockNode
!
(reader addMethod: 'accessing')
!
copiedVariables {^Arr[JVMVariable]}
	^copiedVariables
!
(reader addMethod: 'initialize-release')
!
initializeBlockNode: aBlockNode {BlockNode} copiedVariables: anArray {Arr[JVMVariable]} {^Self}
	blockNode := aBlockNode.
	copiedVariables := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'As yet unclassified')
!
pvtSetName: aString {Str} {^Self}
	name := aString
!
(reader addMethod: 'As yet unclassified')
!
withName: aString {Str} {^Self}
	^self copy pvtSetName: aString
!
(reader addClassMethod: 'instance creation')
!
blockNode: aBlockNode {BlockNode} copiedVariables: anArray {Arr[JVMVariable]} {^BlockSendArgument}
	^self new initializeBlockNode: aBlockNode copiedVariables: anArray
!
