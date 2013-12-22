(reader defineClass: 'JVMPrimitiveVirtual' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'type')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitJVMPrimitiveVirtual: self
!
(reader addMethod: 'initialize-release')
!
initializeType: aJVMDefinedObjectType name: aString
	type := aJVMDefinedObjectType.
	name := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isPrimitive
	^true
!
(reader addMethod: 'As yet unclassified')
!
isStatic
	^false
!
(reader addMethod: 'accessing')
!
name
	^name
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream
		nextPutAll: 'name: ';
		print: name.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
type
	^type
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType name: aString
	^self new initializeType: aJVMDefinedObjectType name: aString
!
