(reader defineClass: 'JVMField' superclass: 'st.gravel.support.compiler.jvm.JVMVariable')
!
(reader addInstVar: 'isStatic' type: 'Boolean')
!
(reader addInstVar: 'ownerType' type: 'JVMDefinedObjectType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMField: self
!
(reader addMethod: 'As yet unclassified')
!
asGetField {^GetField}
	self deny: isStatic.
	^GetField ownerType: ownerType name: varName type: type
!
(reader addMethod: 'As yet unclassified')
!
asGetStatic {^GetStatic}
	self assert: isStatic.
	^GetStatic ownerType: ownerType name: varName type: type
!
(reader addMethod: 'initialize-release')
!
initializeOwnerType: aType {JVMDefinedObjectType} varName: aVariableDeclarationNode {Str} type: aJVMDynamicObjectType {JVMType} isStatic: aBoolean {Bool} {^Self}
	ownerType := aType.
	varName := aVariableDeclarationNode.
	type := aJVMDynamicObjectType.
	isStatic := aBoolean.
	self initialize
!
(reader addMethod: 'accessing')
!
isStatic {^Bool}
	^isStatic
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addClassMethod: 'instance creation')
!
ownerType: ownerType {JVMDefinedObjectType} varName: aString {Str} type: aJVMDynamicObjectType {JVMType} isStatic: aBoolean {Bool} {^JVMField}
	^self new
		initializeOwnerType: ownerType
		varName: aString
		type: aJVMDynamicObjectType
		isStatic: aBoolean
!
