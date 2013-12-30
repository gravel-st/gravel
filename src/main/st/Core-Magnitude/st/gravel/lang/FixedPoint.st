(reader defineClass: 'FixedPoint' superclass: 'st.gravel.lang.Number')
!
(reader propertyAt: 'javaClass' put: 'java.math.BigDecimal')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromFixedPoint: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromFixedPoint: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromFixedPoint: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromFixedPoint: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^operand integerQuotientFromFixedPoint: self
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^operand quoFromFixedPoint: self
!
(reader addMethod: 'accessing')
!
scale
	<primitive: 'scale'>
	
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromFixedPoint: self
!
