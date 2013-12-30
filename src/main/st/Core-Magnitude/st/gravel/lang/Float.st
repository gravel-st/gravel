(reader defineClass: 'Float' superclass: 'st.gravel.lang.Number')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Float')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromFloat: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromFloat: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromFloat: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromFloat: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^operand integerQuotientFromFloat: self
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^operand quoFromFloat: self
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromFloat: self
!
(reader addClassMethod: 'constants')
!
unity
	^'1.0'
!
