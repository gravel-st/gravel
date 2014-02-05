(reader defineClass: 'JVMNodeVisitor' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visitJVMArrayType: anObject {JVMArrayType} {^X}
	^self visitJVMType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMBooleanType: anObject {JVMBooleanType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMBottomType: anObject {JVMBottomType} {^X}
	^self visitJVMType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMByteType: anObject {JVMByteType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMCharType: anObject {JVMCharType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMDefinedObjectType: anObject {JVMDefinedObjectType} {^X}
	^self visitJVMType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMDoubleType: anObject {JVMDoubleType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMDynamicObjectType: anObject {JVMDynamicObjectType} {^X}
	^self visitJVMType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMField: anObject {JVMField} {^X}
	^self visitJVMVariable: anObject
!
(reader addMethod: 'visiting')
!
visitJVMFloatType: anObject {JVMFloatType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMIntType: anObject {JVMIntType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMLocalDeclaration: anObject {JVMLocalDeclaration} {^X}
	^self visitJVMNode: anObject
!
(reader addMethod: 'visiting')
!
visitJVMLongType: anObject {JVMLongType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMMethod: anObject {JVMMethod} {^X}
	^self visitJVMNode: anObject
!
(reader addMethod: 'visiting')
!
visitJVMMethodType: anObject {JVMMethodType} {^X}
	^self visitJVMNode: anObject
!
(reader addMethod: 'visiting')
!
visitJVMNode: anObject {JVMNode} {^X}
	^self error: 'VisitorError'
!
(reader addMethod: 'visiting')
!
visitJVMPrimitiveType: anObject {JVMPrimitiveType} {^X}
	^self visitJVMType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMShortType: anObject {JVMShortType} {^X}
	^self visitJVMPrimitiveType: anObject
!
(reader addMethod: 'visiting')
!
visitJVMType: anObject {JVMType} {^X}
	^self visitJVMNode: anObject
!
(reader addMethod: 'visiting')
!
visitJVMVariable: anObject {JVMVariable} {^X}
	^self visitJVMNode: anObject
!
(reader addMethod: 'visiting')
!
visitJVMVoidType: anObject {JVMVoidType} {^X}
	^self visitJVMType: anObject
!
(reader addClassMethod: 'instance creation')
!
typeParameters
	^#(#X)
!
