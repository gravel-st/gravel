(reader defineClass: 'JVMBlockCompiler' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'parent' type: 'JVMClassCompiler')
!
(reader addInstVar: 'block' type: 'BlockInnerClass')
!
(reader addMethod: 'accessing')
!
block {^BlockInnerClass}
	^block
!
(reader addMethod: 'As yet unclassified')
!
blockSuperType: anInteger {Int} {^JVMDefinedObjectType}
	^JVMDefinedObjectType block: anInteger
!
(reader addMethod: 'As yet unclassified')
!
compileBlock {^JVMClass}
	| m {JVMMethod} fields {Arr[JVMField]} methodCompiler {JVMMethodCompiler} jvmClass {JVMClass} |
	fields := block copiedVariables
				collect: [:each {JVMVariable} | each asField: block ownerType isStatic: false].
	methodCompiler := JVMMethodCompiler parent: parent.
	methodCompiler isStatic: false.
	m := methodCompiler
				buildBlock: block blockNode
				copiedVariables: fields
				blockType: block ownerType.
	jvmClass := JVMClass
				type: block ownerType
				superType: self superType
				fields: fields
				methods: (Array with: m with: self createInit)
				astConstants: #().
	block blockNode sourcePosition isNil
		ifFalse: [jvmClass source: block blockNode sourcePosition sourceFile name].
	^jvmClass
!
(reader addMethod: 'As yet unclassified')
!
createInit {^JVMMethod}
	| instructions {OrdColl[JVMInstruction]} read0 {Load} locals {Arr[JVMLocalDeclaration]} |
	instructions := OrderedCollection new.
	read0 := Load index: 0 type: block ownerType.
	block copiedVariables keysAndValuesDo: 
			[:i {Int} :elem {JVMVariable} |
			instructions add: read0.
			instructions add: (Load index: i type: elem type).
			instructions add: (PutField
						ownerType: block ownerType
						name: elem varName
						type: elem type)].
	instructions add: read0.
	instructions add: (InvokeSpecial init: self superType voidArguments: #()).
	instructions add: Return new.
	locals := (block copiedVariables
				keysAndValuesCollect: [:i {Int} :var {JVMVariable} | var asLocalDeclaration: i])
					copyWithFirst: JVMLocalDeclaration blockSelf.
	^JVMMethod
		name: '<init>'
		locals: locals
		instructions: instructions asArray
		isStatic: false
		signature: block initSignature
!
(reader addMethod: 'initialize-release')
!
initializeParent: aJVMClassCompiler {JVMClassCompiler} block: aBlockInnerClass {BlockInnerClass} {^Self}
	parent := aJVMClassCompiler.
	block := aBlockInnerClass.
	self initialize
!
(reader addMethod: 'accessing')
!
parent {^JVMClassCompiler}
	^parent
!
(reader addMethod: 'As yet unclassified')
!
superType {^JVMDefinedObjectType}
	^self blockSuperType: block blockNode numArgs
!
(reader addClassMethod: 'instance creation')
!
parent: aJVMClassCompiler {JVMClassCompiler} block: aBlockInnerClass {BlockInnerClass} {^JVMBlockCompiler}
	^self new initializeParent: aJVMClassCompiler block: aBlockInnerClass
!
