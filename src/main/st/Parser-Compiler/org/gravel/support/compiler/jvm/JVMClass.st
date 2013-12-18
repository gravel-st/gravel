(reader defineClass: 'JVMClass' superclass: 'org.gravel.support.compiler.jvm.JVMNode')
!
(reader addInstVar: 'type')
!
(reader addInstVar: 'fields')
!
(reader addInstVar: 'methods')
!
(reader addInstVar: 'superType')
!
(reader addInstVar: 'source')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMClass: self
!
(reader addMethod: 'accessing')
!
fields {^Arr[JVMField]}
	^fields
!
(reader addMethod: 'initialize-release')
!
initializeType: aJVMDefinedObjectType {JVMDefinedObjectType} superType: aJVMDefinedObjectType2 {JVMDefinedObjectType} fields: anArray {Arr[JVMField]} methods: anArray2 {Arr[JVMMethod]} {^Self}
	type := aJVMDefinedObjectType.
	superType := aJVMDefinedObjectType2.
	fields := anArray.
	methods := anArray2.
	self initialize
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
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMDefinedObjectType, Arr[JVMField], Arr[JVMMethod], JVMDefinedObjectType, Str]}
	^#('type' 'fields' 'methods' 'superType' 'source')
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType {JVMDefinedObjectType} superType: aJVMDefinedObjectType2 {JVMDefinedObjectType} fields: anArray {Arr[JVMField]} methods: anArray2 {Arr[JVMMethod]} {^JVMClass}
	^self new
		initializeType: aJVMDefinedObjectType
		superType: aJVMDefinedObjectType2
		fields: anArray
		methods: anArray2
!
