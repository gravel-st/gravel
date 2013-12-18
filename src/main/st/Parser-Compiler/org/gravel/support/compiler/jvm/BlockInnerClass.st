(reader defineClass: 'BlockInnerClass' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'ownerType')
!
(reader addInstVar: 'blockNode')
!
(reader addInstVar: 'copiedVariables')
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
initializeOwnerType: aString {JVMDefinedObjectType} blockNode: aBlockNode {BlockNode} copiedVariables: anArray {Arr[JVMVariable]} {^Self}
	ownerType := aString.
	blockNode := aBlockNode.
	copiedVariables := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
initSignature {^JVMMethodType}
	^JVMMethodType returnType: JVMVoidType new
		arguments: (copiedVariables collect: [:each {JVMVariable} | each type])
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMDefinedObjectType, BlockNode, Arr[JVMVariable]]}
	^#('ownerType' 'blockNode' 'copiedVariables')
!
(reader addClassMethod: 'instance creation')
!
ownerType: ownerType {JVMDefinedObjectType} blockNode: aBlockNode {BlockNode} copiedVariables: anArray {Arr[JVMVariable]} {^BlockInnerClass}
	^self new initializeOwnerType: ownerType blockNode: aBlockNode copiedVariables: anArray
!
