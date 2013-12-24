(reader defineClass: 'VMAbstractInstance' superclass: 'st.gravel.debugger.VMStackValue')
!
(reader addInstVar: 'vm')
!
(reader addInstVar: 'subjectClass')
!
(reader addMethod: 'comparing')
!
= anObject
	^self class = anObject class and: [self contentsEquals: anObject]
!
(reader addMethod: 'comparing')
!
hash
	^self class hash + self contentsHash
!
(reader addMethod: 'initialize-release')
!
initializeVm: aVirtualMachine subjectClass: aJVMClass
	vm := aVirtualMachine.
	subjectClass := aJVMClass.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
invokeDynamic: methodName
	| mh jvmClass method |
	mh := vm systemMapping methodHandleFor: self javaClass methodName: methodName.
	jvmClass := vm classForType: mh javaClass jvmType.
	method := jvmClass methodNamed: mh name ifAbsent: [self halt].
	^VMMethodContext method: method
!
(reader addMethod: 'As yet unclassified')
!
invokeDynamicSuper: methodName for: aReference
	| mm jvmClass method |
	mm := vm systemMapping superMethodMappingFor: aReference methodName: methodName.
	jvmClass := vm classForType: mm definingClass jvmType.
	method := jvmClass methodNamed: mm methodHandle name ifAbsent: [self halt].
	^VMMethodContext method: method
!
(reader addMethod: 'As yet unclassified')
!
javaClass
	| t arrayCount |
	t := subjectClass type.
	arrayCount := 0.
	[t isArrayType] whileTrue: 
			[arrayCount := arrayCount + 1.
			t := t elementType].
	^SPSupport.JavaClass path: (t path asArray collect: [:each | each asSymbol])
		arrayCount: arrayCount
!
(reader addMethod: 'As yet unclassified')
!
methodAt: aString
	^subjectClass methodNamed: aString ifAbsent: [self halt]
!
(reader addMethod: 'As yet unclassified')
!
methodAt: aString ifAbsent: aBlock
	^subjectClass methodNamed: aString ifAbsent: aBlock
!
(reader addMethod: 'accessing')
!
subjectClass
	^subjectClass
!
(reader addMethod: 'accessing')
!
vm
	^vm
!
