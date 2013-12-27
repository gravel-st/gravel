(reader defineClass: 'AssociationImpl' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'key')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'comparing')
!
= anAssociation
	^self class = anAssociation class
		and: [key = anAssociation key and: [value = anAssociation value]]
!
(reader addMethod: 'comparing')
!
hash
	^key hash
!
(reader addMethod: 'initialize-release')
!
initializeKey: aClass value: anInteger
	key := aClass.
	value := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
key
	^key
!
(reader addMethod: 'accessing')
!
printOn: aStream
	aStream print: key.
	aStream
		nextPutAll: ' -> ';
		print: value
!
(reader addMethod: 'accessing')
!
value
	^value
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
(reader addClassMethod: 'instance creation')
!
key: aClass value: anInteger
	^self new initializeKey: aClass value: anInteger
!
