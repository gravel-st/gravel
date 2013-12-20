(reader defineClass: 'VMInstance' superclass: 'st.gravel.debugger.VMAbstractInstance')
!
(reader addInstVar: 'primitiveValue')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitInstance: self
!
(reader addMethod: 'As yet unclassified')
!
arrayAt: anInteger put: aVMInstance
	primitiveValue at: anInteger + 1 put: aVMInstance
!
(reader addMethod: 'As yet unclassified')
!
invokeVirtual: methodName
	^VMMethodContext method: (self methodAt: methodName)
!
(reader addMethod: 'As yet unclassified')
!
primitiveValue
	^primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
primitiveValue: anInteger
	primitiveValue := anInteger
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addClassMethod: 'instance creation')
!
vm: aVirtualMachine subjectClass: aJVMClass
	^self new initializeVm: aVirtualMachine subjectClass: aJVMClass
!
