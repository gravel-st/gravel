(reader defineClass: 'JVMClass' superclass: 'st.gravel.support.compiler.jvm.JVMNode')
!
(reader addInstVar: 'type' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'fields' type: 'Array[JVMField]')
!
(reader addInstVar: 'methods' type: 'Array[JVMMethod]')
!
(reader addInstVar: 'superType' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'source' type: 'String')
!
(reader addInstVar: 'astConstants' type: 'Array[BlockSendArgument]')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMClass: self
!
(reader addMethod: 'accessing')
!
astConstants {^Arr[BlockSendArgument]}
	^astConstants
!
(reader addMethod: 'As yet unclassified')
!
fieldNamed: name {Str} ifAbsent: aBlock {[^JVMField]} {^JVMField}
	^fields detect: [:each {JVMField} | each varName = name] ifNone: aBlock
!
(reader addMethod: 'accessing')
!
fields {^Arr[JVMField]}
	^fields
!
(reader addMethod: 'initialize-release')
!
initializeType: aJVMDefinedObjectType {JVMDefinedObjectType} superType: aJVMDefinedObjectType2 {JVMDefinedObjectType} fields: anArray {Arr[JVMField]} methods: anArray2 {Arr[JVMMethod]} astConstants: anObject {Arr[BlockSendArgument]} {^Self}
	type := aJVMDefinedObjectType.
	superType := aJVMDefinedObjectType2.
	fields := anArray.
	methods := anArray2.
	astConstants := anObject.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isSimulatedPrimitives
	^false
!
(reader addMethod: 'As yet unclassified')
!
methodNamed: name {Str} ifAbsent: aBlock {[^JVMMethod]} {^JVMMethod}
	^methods detect: [:each {JVMMethod} | each name = name] ifNone: aBlock
!
(reader addMethod: 'accessing')
!
methods {^Arr[JVMMethod]}
	^methods
!
(reader addMethod: 'accessing')
!
source {^Str}
	^source
!
(reader addMethod: 'accessing')
!
source: anObject {Str} {^Self}
	source := anObject
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	super sourceOn: aStream.
	aStream nextPut: $[.
	aStream nextPutAll: type printString.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
superType {^JVMDefinedObjectType}
	^superType
!
(reader addMethod: 'accessing')
!
type {^JVMDefinedObjectType}
	^type
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType {JVMDefinedObjectType} methods: methods {Arr[JVMMethod]} {^JVMClass}
	^self
		type: aJVMDefinedObjectType
		superType: JVMDefinedObjectType object
		fields: #()
		methods: methods
		astConstants: #()
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType {JVMDefinedObjectType} superType: aJVMDefinedObjectType2 {JVMDefinedObjectType} fields: anArray {Arr[JVMField]} methods: anArray2 {Arr[JVMMethod]} astConstants: astConstants {Arr[BlockSendArgument]} {^JVMClass}
	^self new
		initializeType: aJVMDefinedObjectType
		superType: aJVMDefinedObjectType2
		fields: anArray
		methods: anArray2
		astConstants: astConstants
!
