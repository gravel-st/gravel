(reader defineClass: 'LargeInteger' superclass: 'org.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.math.BigInteger')
!
(reader addMethod: 'gravel')
!
* anObject
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'multiply_')>
	
!
(reader addMethod: 'gravel')
!
+ anObject
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'plus_')>
	
!
(reader addMethod: 'gravel')
!
- anObject
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'minus_')>
	
!
(reader addMethod: 'gravel')
!
// anObject
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'integerDivision_')>
	
!
(reader addMethod: 'gravel')
!
< aMagnitude
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: 'gravel')
!
= aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'gravel')
!
compressed
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'compressed')>
	
!
(reader addMethod: 'gravel')
!
printBase: base
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'printBase_')>
	
!
(reader addMethod: 'gravel')
!
quo: aNumber
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'quo_')>
	
!
(reader addMethod: 'gravel')
!
rem: aNumber
	<primitive: #('org.gravel.support.jvm.LargeIntegerExtensions' 'rem_')>
	
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self compressed
!
