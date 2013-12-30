(reader extendClass: 'Boolean')
!
(reader addMethod: 'printing')
!
jsonOn: aStream prettyPrint: aBoolean
	self storeOn: aStream
!
