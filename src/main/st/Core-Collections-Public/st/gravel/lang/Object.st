(reader extendClass: 'Object')
!
(reader addMethod: 'associating')
!
-> anObject
	^Association key: self value: anObject
!
(reader addMethod: 'testing')
!
isArray
	^false
!
(reader addMethod: 'testing')
!
isBag
	^false
!
(reader addMethod: 'gravel')
!
isCollection
	^false
!
(reader addMethod: 'testing')
!
isOrderedCollection
	^false
!
(reader addMethod: 'testing')
!
isReadStream
	^false
!
(reader addMethod: 'testing')
!
isSet
	^false
!
(reader addMethod: 'testing')
!
isWriteStream
	^false
!
