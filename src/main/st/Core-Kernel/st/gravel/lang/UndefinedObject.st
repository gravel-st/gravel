(reader defineClass: 'UndefinedObject' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'isNilClass' put: 'true')
!
(reader addMethod: 'comparing')
!
hash
	^0
!
(reader addMethod: 'gravel')
!
ifNil: aBlock
	^aBlock value
!
(reader addMethod: 'gravel')
!
ifNil: nilBlock ifNotNil: notNilBlock
	^nilBlock value
!
(reader addMethod: 'gravel')
!
ifNotNil: aBlock
	^self
!
(reader addMethod: 'gravel')
!
ifNotNil: notNilBlock ifNil: nilBlock
	^nilBlock value
!
(reader addMethod: 'gravel')
!
isNil
	^true
!
(reader addMethod: 'gravel')
!
isNilOrEmpty
	^true
!
(reader addMethod: 'gravel')
!
notNil
	^false
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: 'gravel')
!
storeOn: aStream
	aStream nextPutAll: 'nil'
!
