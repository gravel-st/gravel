(reader defineClass: 'JVMClassCompiler' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'ownerType')
!
(reader addInstVar: 'innerclasses')
!
(reader addInstVar: 'constants')
!
(reader addInstVar: 'selectorConverter')
!
(reader addInstVar: 'classDescriptionNode')
!
(reader addInstVar: 'systemNode')
!
(reader addInstVar: 'systemMappingUpdater')
!
(reader addInstVar: 'jvmMethods')
!
(reader addInstVar: 'fields')
!
(reader addInstVar: 'extraClasses')
!
(reader addInstVar: 'selfType')
!
(reader addInstVar: 'isStatic')
!
(reader addInstVar: 'superType')
!
(reader addInstVar: 'constantCount')
!
(reader addInstVar: 'positionsCache')
!
(reader addMethod: 'As yet unclassified')
!
addInvokeSuper: name {Str} functionName: functionName {Str} numArgs: numArgs {Int} superReference: superReference {Str} superSig: superSig {JVMMethodType} {^Self}
	| instructions {OrdColl[JVMInstruction]} |
	instructions := OrderedCollection new.
	0 to: numArgs
		do: [:i {Int} | instructions add: (Load index: i type: JVMDynamicObjectType new)].
	instructions add: (DynamicSuperSend
				functionName: functionName
				numArgs: numArgs
				superReference: superReference).
	instructions add: AReturn new.
	jvmMethods add: (JVMMethod
				name: name
				locals: (JVMLocalDeclaration localsForSignature: superSig arguments)
				instructions: instructions asArray
				isStatic: true
				signature: superSig)
!
(reader addMethod: 'As yet unclassified')
!
buildPositionsCache {^Self}
	| stream {RStream[Char]} src {Str} ch {Char} file {Filename} line {Int} positionsCacheColl {OrdColl[Int]} |
	file := classDescriptionNode findSourceFile asFile.
	src := file contentsOfEntireFile.
	positionsCacheColl := OrderedCollection new.
	stream := ReadStream on: src.
	line := 1.
	[stream atEnd] whileFalse: 
			[ch := stream next.
			ch = String lineEndConvention ifTrue: [line := line + 1].
			positionsCacheColl add: line].
	positionsCache := positionsCacheColl asArray
!
(reader addMethod: 'accessing')
!
classDescriptionNode {^ClassDescriptionNode}
	^classDescriptionNode
!
(reader addMethod: 'As yet unclassified')
!
compileBlock: aBlockInnerClass {BlockInnerClass} {^JVMClass}
	| blockClass {JVMClass} |
	blockClass := self compileBlockNoAdd: aBlockInnerClass.
	extraClasses add: blockClass.
	^blockClass
!
(reader addMethod: 'As yet unclassified')
!
compileBlockNoAdd: aBlockInnerClass {BlockInnerClass} {^JVMClass}
	^(JVMBlockCompiler parent: self block: aBlockInnerClass) compileBlock
!
(reader addMethod: 'As yet unclassified')
!
compileBlocks {^Self}
	| done {Set[JVMDefinedObjectType]} cl {BlockInnerClass | Nil} |
	done := Set new.
	cl := nil.
	
	[cl := innerclasses detect: [:e {BlockInnerClass} | (done includes: e ownerType) not]
				ifNone: [nil].
	cl isNil]
			whileFalse: 
				[self compileBlock: cl.
				done add: cl ownerType]
!
(reader addMethod: 'As yet unclassified')
!
compileClassNode {^JVMClass}
	| allMethods {Arr[MethodNode]} superclassReference {Reference | Nil} allInstVars {Arr[BoundVariableDeclarationNode]} localLinkedMethods {Arr[MethodNode]} scn {ClassDescriptionNode} |
	ownerType isNil ifTrue: [ownerType := selfType].
	allMethods := classDescriptionNode methods.
	superclassReference := classDescriptionNode superclassReference.
	allInstVars := classDescriptionNode boundInstVars.
	[superclassReference isNil] whileFalse: 
			[scn := systemNode classNodeAt: superclassReference.
			superclassReference := scn superclassReference.
			allInstVars := scn boundInstVars copyWithAll: allInstVars].
	localLinkedMethods := systemMappingUpdater
				localLinkMethods: allMethods
				instVars: allInstVars
				ownerReference: classDescriptionNode reference.
	localLinkedMethods do: [:each {MethodNode} | self compileMethod: each].
	classDescriptionNode instVars do: 
			[:each {VariableDeclarationNode} |
			fields add: (JVMField
						ownerType: ownerType
						varName: each name
						type: JVMDynamicObjectType new
						isStatic: false)].
	self compileBlocks.
	^self createContainerClass
!
(reader addMethod: 'As yet unclassified')
!
compileClinit {^Self}
	| instructions {OrdColl[JVMInstruction]} |
	instructions := OrderedCollection new.
	constants do: 
			[:each {JVMMethodConstant} |
			instructions addAll: each clinitInstructions.
			fields add: each fieldDefinition].
	instructions add: Return new.
	jvmMethods add: (JVMMethod
				name: '<clinit>'
				locals: #()
				instructions: instructions asArray
				isStatic: true
				signature: JVMMethodType void)
!
(reader addMethod: 'As yet unclassified')
!
compileClone {^Self}
	| instructions {OrdColl[JVMInstruction]} |
	instructions := OrderedCollection new.
	instructions add: (Load index: 0 type: ownerType).
	instructions add: (InvokeSpecial
				ownerType: JVMDefinedObjectType object
				name: 'clone'
				signature: (JVMMethodType returnType: JVMDefinedObjectType object arguments: #())).
	instructions add: AReturn new.
	jvmMethods add: (JVMMethod
				name: 'clone'
				locals: (Array with: JVMLocalDeclaration self)
				instructions: instructions asArray
				isStatic: false
				signature: JVMMethodType object)
!
(reader addMethod: 'As yet unclassified')
!
compileInit {^Self}
	| instructions {OrdColl[JVMInstruction]} |
	instructions := OrderedCollection new.
	instructions add: (Load index: 0 type: ownerType).
	instructions add: (InvokeSpecial init: superType voidArguments: #()).
	instructions add: Return new.
	jvmMethods add: (JVMMethod
				name: '<init>'
				locals: (Array with: JVMLocalDeclaration self)
				instructions: instructions asArray
				isStatic: false
				signature: JVMMethodType void)
!
(reader addMethod: 'As yet unclassified')
!
compileMethod: aMethodNode {MethodNode} {^Self}
	jvmMethods add: ((JVMMethodCompiler parent: self)
				visit: aMethodNode;
				buildMethod).
	^self
!
(reader addMethod: 'As yet unclassified')
!
constantAt: anObject {Expression} ifAbsentPut: aBlock {[^JVMMethodConstant]} {^JVMMethodConstant}
	^constants detect: [:each {JVMMethodConstant} | each expression = anObject]
		ifNone: 
			[| constant {JVMMethodConstant} |
			constant := aBlock value.
			constants add: constant.
			constant]
!
(reader addMethod: 'As yet unclassified')
!
createBlockInnerClass: aBlockNode {BlockNode} copiedVariables: anArray {Arr[JVMVariable]} {^BlockInnerClass}
	| innerclass {BlockInnerClass} |
	innerclass := BlockInnerClass
				ownerType: self newInnerClassType
				blockNode: aBlockNode
				copiedVariables: anArray.
	innerclasses add: innerclass.
	^innerclass
!
(reader addMethod: 'As yet unclassified')
!
createContainerClass {^JVMClass}
	| aClass {JVMClass} |
	self compileClinit.
	self compileInit.
	self compileClone.
	aClass := JVMClass
				type: ownerType
				superType: superType
				fields: fields asArray
				methods: jvmMethods asArray.
	(classDescriptionNode isNil or: [classDescriptionNode findSourceFile isNil])
		ifFalse: [aClass source: classDescriptionNode findSourceFile name].
	jvmMethods := nil.
	^aClass
!
(reader addMethod: 'As yet unclassified')
!
createInvokeInstruction: type {JVMDefinedObjectType} name: name {Str} numArgs: numArgs {Int} {^Invoke}
	^systemMappingUpdater compilerTools
		createInvokeInstruction: type
		name: name
		numArgs: numArgs
!
(reader addMethod: 'As yet unclassified')
!
extensionPostfix: extensionPostfix {Str} {^Self}
	self assert: isStatic.
	ownerType := JVMDefinedObjectType className: selfType className , '$' , extensionPostfix.
	superType := JVMDefinedObjectType object
!
(reader addMethod: 'accessing')
!
extraClasses {^Arr[JVMClass]}
	^extraClasses asArray
!
(reader addMethod: 'accessing')
!
extraClassesDo: aBlock {[JVMClass, ^Obj]} {^Self}
	extraClasses do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
hasConstantsOrFieldsOrExtraClasses {^Bool}
	^constants isEmpty not or: [fields isEmpty not or: [extraClasses isEmpty not]]
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	innerclasses := OrderedCollection new.
	constantCount := 0.
	constants := OrderedCollection new.
	selectorConverter := SelectorConverter new.
	jvmMethods := OrderedCollection new.
	fields := OrderedCollection new.
	extraClasses := OrderedCollection new.
	(classDescriptionNode notNil and: [selfType isNil])
		ifTrue: 
			[| superclassReference {Reference} |
			selfType := JVMDefinedObjectType dottedClassName: (systemMappingUpdater compilerTools
								referenceAsClassName: classDescriptionNode reference).
			superclassReference := classDescriptionNode superclassReference.
			superType := superclassReference isNil
						ifTrue: 
							[classDescriptionNode isMeta
								ifTrue: [JVMDefinedObjectType objectClass]
								ifFalse: [JVMDefinedObjectType object]]
						ifFalse: 
							[systemMappingUpdater compilerTools
								jvmTypeForClass: (systemMappingUpdater systemMapping
										classMappingAtReference: superclassReference) identityClass]]
!
(reader addMethod: 'initialize-release')
!
initializeClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} systemNode: aSystemNode {SystemNode} systemMappingUpdater: aSystemMappingUpdater {SystemMappingUpdater} isStatic: aBoolean {Bool} {^Self}
	classDescriptionNode := aClassDescriptionNode.
	systemNode := aSystemNode.
	systemMappingUpdater := aSystemMappingUpdater.
	isStatic := aBoolean.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^isStatic
!
(reader addMethod: 'As yet unclassified')
!
lineNumberOf: aSourcePosition {SourcePosition} {^Int | Nil}
	classDescriptionNode findSourceFile isNil ifTrue: [^nil].
	classDescriptionNode findSourceFile = aSourcePosition sourceFile ifFalse: [^nil].
	positionsCache isNil ifTrue: [self buildPositionsCache].
	^positionsCache at: aSourcePosition start
!
(reader addMethod: 'As yet unclassified')
!
newConstantName {^Str}
	^'__constant_' , (constantCount := constantCount + 1) printString
!
(reader addMethod: 'As yet unclassified')
!
newInnerClassType {^JVMDefinedObjectType}
	^JVMDefinedObjectType
		className: ownerType className , '$Block' , innerclasses size printString
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addMethod: 'accessing')
!
ownerType: anObject {JVMDefinedObjectType} {^Self}
	ownerType := anObject
!
(reader addMethod: 'accessing')
!
selectorConverter {^SelectorConverter}
	^selectorConverter
!
(reader addMethod: 'accessing')
!
selfType {^JVMNonPrimitiveType}
	^selfType
!
(reader addMethod: 'accessing')
!
selfType: anObject {JVMNonPrimitiveType} {^Self}
	self assert: isStatic.
	selfType := anObject
!
(reader addMethod: 'accessing')
!
systemMappingUpdater {^SystemMappingUpdater}
	^systemMappingUpdater
!
(reader addMethod: 'accessing')
!
systemNode {^SystemNode}
	^systemNode
!
(reader addClassMethod: 'instance creation')
!
classDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} systemNode: aSystemNode {SystemNode} systemMappingUpdater: aSystemMappingUpdater {SystemMappingUpdater} isStatic: anObject {Bool} {^JVMClassCompiler}
	^self new
		initializeClassDescriptionNode: aClassDescriptionNode
		systemNode: aSystemNode
		systemMappingUpdater: aSystemMappingUpdater
		isStatic: anObject
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMDefinedObjectType, OrdColl[BlockInnerClass], OrdColl[JVMMethodConstant], SelectorConverter, ClassDescriptionNode, SystemNode, SystemMappingUpdater, OrdColl[JVMMethod], OrdColl[JVMField], OrdColl[JVMClass], JVMNonPrimitiveType, Bool, JVMDefinedObjectType, Int, Arr[Int]]}
	^#('ownerType' 'innerclasses' 'constants' 'selectorConverter' 'classDescriptionNode' 'systemNode' 'systemMappingUpdater' 'jvmMethods' 'fields' 'extraClasses' 'selfType' 'isStatic' 'superType' 'constantCount' 'positionsCache')
!
