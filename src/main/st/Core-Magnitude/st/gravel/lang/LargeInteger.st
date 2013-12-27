(reader defineClass: 'LargeInteger' superclass: 'st.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.math.BigInteger')
!
(reader addMethod: '')
!
* anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'multiply_')>
	
!
(reader addMethod: '')
!
+ anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'plus_')>
	
!
(reader addMethod: '')
!
- anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'minus_')>
	
!
(reader addMethod: '')
!
// anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'integerDivision_')>
	
!
(reader addMethod: '')
!
< aMagnitude
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: '')
!
= aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: '')
!
compressed
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'compressed')>
	
!
(reader addMethod: '')
!
gcd: anInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'gcd_')>
	
!
(reader addMethod: '')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'printBase_')>
	
!
(reader addMethod: '')
!
quo: aNumber
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'quo_')>
	
!
(reader addMethod: '')
!
rem: aNumber
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'rem_')>
	
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self compressed
!
(reader addMethod: '')
!
\\ anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'integerRemainder_')>
	
!
