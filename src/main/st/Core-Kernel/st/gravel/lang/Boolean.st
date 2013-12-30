(reader defineClass: 'Boolean' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Boolean')
!
(reader addMethod: 'logical operations')
!
& aBoolean
	^self and: [aBoolean]
!
(reader addMethod: 'controlling')
!
and: aBlock
	^self == true ifTrue: [aBlock value] ifFalse: [false]
!
(reader addMethod: 'squeak-converting')
!
asString
	^self printString
!
(reader addMethod: 'logical operations')
!
eqv: aBoolean
	^self == aBoolean
!
(reader addMethod: 'controlling')
!
ifFalse: falseAlternativeBlock
	^self ifFalse: [falseAlternativeBlock value]
!
(reader addMethod: 'controlling')
!
ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock
	^self ifFalse: [falseAlternativeBlock value] ifTrue: [trueAlternativeBlock value]
!
(reader addMethod: 'controlling')
!
ifTrue: trueAlternativeBlock
	^self ifTrue: [trueAlternativeBlock value]
!
(reader addMethod: 'controlling')
!
ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock
	^self ifTrue: [trueAlternativeBlock value] ifFalse: [falseAlternativeBlock value]
!
(reader addMethod: 'testing')
!
isBoolean
	^true
!
(reader addMethod: 'logical operations')
!
not
	^self == false
!
(reader addMethod: 'controlling')
!
or: aBlock
	^self == true ifTrue: [self] ifFalse: [aBlock value]
!
(reader addMethod: 'printing')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: 'printing')
!
storeOn: aStream
	self ifTrue: [aStream nextPutAll: 'true'] ifFalse: [aStream nextPutAll: 'false']
!
(reader addMethod: 'logical operations')
!
xor: aBoolean
	^(self == aBoolean) not
!
(reader addMethod: 'logical operations')
!
| aBoolean
	^self or: [aBoolean]
!
