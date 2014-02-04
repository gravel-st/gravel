(reader defineClass: 'TypeNodeToJVMTypeConverter' superclass: 'st.gravel.support.compiler.ast.NodeVisitor')
!
(reader addMethod: 'visiting')
!
visitTypeNode: anObject {TypeVariableNode} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'visiting')
!
visitTypeVariableNode: anObject {TypeVariableNode} {^JVMType}
	anObject name = 'Integer' ifTrue: [^JVMIntType new].
	anObject name = 'Boolean' ifTrue: [^JVMBooleanType new].
	^JVMDynamicObjectType new
!
(reader addClassMethod: 'pegon')
!
supertype
	^#{NodeVisitor} => #{JVMType}
!
(reader addClassMethod: 'pegon')
!
typeParameters
	^#()
!
