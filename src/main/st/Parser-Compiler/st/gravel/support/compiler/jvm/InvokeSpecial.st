(reader defineClass: 'InvokeSpecial' superclass: 'st.gravel.support.compiler.jvm.Invoke')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitInvokeSpecial: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	signature arguments reverseDo: [:each {JVMType} | aJVMStack popType: each].
	aJVMStack pop.
	signature returnType isVoidType ifFalse: [aJVMStack push: signature returnType]
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBottomType new
!
(reader addClassMethod: 'instance creation')
!
init: aJVMDefinedObjectType {JVMDefinedObjectType} signature: aJVMMethodType {JVMMethodType} {^InvokeSpecial}
	^self ownerType: aJVMDefinedObjectType name: '<init>' signature: aJVMMethodType
!
(reader addClassMethod: 'As yet unclassified')
!
init: aJVMDefinedObjectType {JVMDefinedObjectType} voidArguments: anArray {Arr[JVMType]} {^InvokeSpecial}
	^self init: aJVMDefinedObjectType signature: (JVMMethodType voidArguments: anArray)
!
