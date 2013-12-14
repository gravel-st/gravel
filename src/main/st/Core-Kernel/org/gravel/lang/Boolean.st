(reader defineClass: 'Boolean' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Boolean')
!
(reader addMethod: 'gravel')
!
and: aBlock
	^self == true ifTrue: [aBlock value] ifFalse: [false]
!
(reader addMethod: 'gravel')
!
ifFalse: falseAlternativeBlock
	self shouldNotOccur
!
(reader addMethod: 'gravel')
!
ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock
	self shouldNotOccur
!
(reader addMethod: 'gravel')
!
ifTrue: trueAlternativeBlock
	self shouldNotOccur
!
(reader addMethod: 'gravel')
!
ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock
	self shouldNotOccur
!
(reader addMethod: 'gravel')
!
not
	^self == false
!
(reader addMethod: 'gravel')
!
or: aBlock
	^self == true ifTrue: [self] ifFalse: [aBlock value]
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self ifTrue: [aStream nextPutAll: 'true'] ifFalse: [aStream nextPutAll: 'false']
!
