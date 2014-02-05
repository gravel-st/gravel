(reader defineClass: 'TypeNodeToJVMTypeConverter' superclass: 'st.gravel.support.compiler.ast.NodeVisitor')
!
(reader addInstVar: 'namespace' type: 'Array[Symbol]')
!
(reader addMethod: 'initialize-release')
!
initializeNamespace: anArray {Arr[Sym]} {^Self}
	namespace := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
namespace {^Arr[Sym]}
	^namespace
!
(reader addMethod: 'visiting')
!
visit: anObject {Node} {^JVMType}
	anObject isNil ifTrue: [^JVMDynamicObjectType new].
	^anObject accept: self
!
(reader addMethod: 'visiting')
!
visitTypeNode: anObject {TypeNode} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'visiting')
!
visitTypeVariableNode: anObject {TypeVariableNode} {^JVMType}
	anObject name = 'Integer' ifTrue: [^JVMIntType new].
	anObject name = 'Boolean' ifTrue: [^JVMBooleanType new].
	^JVMDynamicObjectType new
!
(reader addClassMethod: 'instance creation')
!
namespace: anArray {Arr[Sym]} {^TypeNodeToJVMTypeConverter}
	^self new initializeNamespace: anArray
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
