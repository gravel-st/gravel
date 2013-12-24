(reader extendClass: 'Object')
!
(reader addMethod: 'associating')
!
-> anObject
	^Association key: self value: anObject
!
(reader addMethod: 'gravel')
!
isCollection
	^false
!
