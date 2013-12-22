(reader defineClass: 'VMInstance' superclass: 'st.gravel.debugger.VMAbstractInstance')
!
(reader addInstVar: 'primitiveValue')
!
(reader addInstVar: 'instValues')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitInstance: self
!
(reader addMethod: 'As yet unclassified')
!
arrayAt: anInteger
	^primitiveValue at: anInteger + 1
!
(reader addMethod: 'As yet unclassified')
!
arrayAt: anInteger put: aVMInstance
	primitiveValue at: anInteger + 1 put: aVMInstance
!
(reader addMethod: 'As yet unclassified')
!
dynamicInstVarAt: aString
	^instValues at: aString
!
(reader addMethod: 'As yet unclassified')
!
dynamicInstVarAt: aString put: aVMInstance
	instValues at: aString put: aVMInstance
!
(reader addMethod: 'As yet unclassified')
!
fieldAt: aString
	^instValues at: aString
!
(reader addMethod: 'As yet unclassified')
!
fieldAt: aString put: aVMInstance
	instValues at: aString put: aVMInstance
!
(reader addMethod: 'initialize-release')
!
initialize
	super initialize.
	instValues := Dictionary new
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
	primitiveValue isNil
		ifFalse: 
			[aStream
				nextPutAll: 'primitiveValue: ';
				print: primitiveValue].
	aStream nextPut: $]
!
(reader addClassMethod: 'instance creation')
!
vm: aVirtualMachine subjectClass: aJVMClass
	^self new initializeVm: aVirtualMachine subjectClass: aJVMClass
!
