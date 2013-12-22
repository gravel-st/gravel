(reader defineClass: 'VirtualMachine' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'classes')
!
(reader addInstVar: 'systemMapping')
!
(reader addInstVar: 'javaClassInstances')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVirtualMachine: self
!
(reader addMethod: 'As yet unclassified')
!
addClass: aJVMClass
	self deny: (classes includesKey: aJVMClass type).
	classes at: aJVMClass type put: aJVMClass
!
(reader addMethod: 'As yet unclassified')
!
addClassType: aType
	^self
		addClassType: aType
		virtuals: #('<init>')
		statics: #()
!
(reader addMethod: 'As yet unclassified')
!
addClassType: aType virtuals: virtuals statics: statics
	^self addClass: (JVMClass type: aType
				methods: (virtuals collect: [:m | JVMPrimitiveVirtual type: aType name: m asString])
						, (statics collect: [:m | JVMPrimitiveStatic type: aType name: m asString]))
!
(reader addMethod: 'As yet unclassified')
!
classForType: aType
	^classes at: aType
		ifAbsent: 
			[self jvmClassForType: aType
				ifAbsent: 
					[('Lst/gravel/support/jvm/*Extensions;' match: aType printString)
						ifTrue: [SimulatedPrimitives type: aType]
						ifFalse: [self halt]]]
!
(reader addMethod: 'As yet unclassified')
!
classInstanceForType: aType
	^self javaClassInstanceFor: (self classForType: aType)
!
(reader addMethod: 'As yet unclassified')
!
clinit: aVMClassInstance
	| methodContext process |
	methodContext := aVMClassInstance invokeStatic: '<clinit>' ifAbsent: [^self].
	process := VMProcess vm: self currentContext: methodContext.
	[process atEnd] whileFalse: [process step]
!
(reader addMethod: 'As yet unclassified')
!
createArrayInstance: primitiveValue
	^(self createInstance: (JVMArrayType elementType: JVMDefinedObjectType object))
		primitiveValue: primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
createBoolean: primitiveValue
	^(self createInstance: JVMDefinedObjectType boolean) primitiveValue: primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
createInstance: aType
	^VMInstance vm: self subjectClass: (self classForType: aType)
!
(reader addMethod: 'As yet unclassified')
!
createInteger: primitiveValue
	^(self createInstance: JVMDefinedObjectType integer) primitiveValue: primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
createJavaClassInstanceFor: aJVMClass
	| inst |
	inst := javaClassInstances at: aJVMClass type
				put: (VMClassInstance vm: self subjectClass: aJVMClass).
	self clinit: inst.
	^inst
!
(reader addMethod: 'As yet unclassified')
!
createString: aString
	^(self createInstance: JVMDefinedObjectType string) primitiveValue: aString
!
(reader addMethod: 'As yet unclassified')
!
createSymbol: aString
	^(self createInstance: JVMDefinedObjectType symbol) primitiveValue: aString
!
(reader addMethod: 'As yet unclassified')
!
dynamicGlobalRead: anAbsoluteReference
	| cl |
	cl := (systemMapping resolveSingletonHolder: anAbsoluteReference) value.
	cl isJavaClass ifTrue: [^self classInstanceForType: cl jvmType].
	self halt
!
(reader addMethod: 'initialize-release')
!
initialize
	super initialize.
	classes := Dictionary new.
	javaClassInstances := Dictionary new.
	self addClassType: JVMDefinedObjectType integer.
	self addClassType: JVMDefinedObjectType boolean.
	self addClassType: JVMDefinedObjectType bigDecimal.
	self addClassType: JVMDefinedObjectType bigInteger.
	self addClassType: JVMDefinedObjectType nonLocalReturn.
	self addClassType: JVMDefinedObjectType object.
	self addClassType: JVMDefinedObjectType objectClass.
	self addClassType: JVMDefinedObjectType runtimeException.
	self addClassType: JVMDefinedObjectType string.
	0 to: 3 do: [:i | self addClassType: (JVMDefinedObjectType block: i)].
	self
		addClassType: JVMDefinedObjectType symbol
		virtuals: #()
		statics: #(#value).
	self addClassType: (JVMArrayType elementType: JVMDefinedObjectType object)
!
(reader addMethod: 'initialize-release')
!
initializeSystemMapping: aSystemMapping
	systemMapping := aSystemMapping.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
javaClassInstanceFor: aJVMClass
	^javaClassInstances at: aJVMClass type
		ifAbsent: [self createJavaClassInstanceFor: aJVMClass]
!
(reader addMethod: 'As yet unclassified')
!
jvmClassForType: aJVMDefinedObjectType ifAbsent: aBlock
	^systemMapping compilerTools jvmClassForType: aJVMDefinedObjectType ifAbsent: aBlock
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
systemMapping
	^systemMapping
!
(reader addClassMethod: 'instance creation')
!
new
	^super new initialize
!
(reader addClassMethod: 'instance creation')
!
systemMapping: aSystemMapping
	^self new initializeSystemMapping: aSystemMapping
!
