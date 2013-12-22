(reader defineClass: 'PrimitiveValue' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitPrimitiveValue: self
!
(reader addMethod: 'As yet unclassified')
!
incrementWith: anInteger
	^self class value: value + anInteger
!
(reader addMethod: 'initialize-release')
!
initializeValue: anInteger
	value := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream
		nextPutAll: 'value: ';
		print: value.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
value
	^value
!
(reader addClassMethod: 'instance creation')
!
value: anInteger
	^self new initializeValue: anInteger
!
