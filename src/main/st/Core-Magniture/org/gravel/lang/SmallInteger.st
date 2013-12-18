(reader defineClass: 'SmallInteger' superclass: 'org.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Integer')
!
(reader addMethod: 'gravel')
!
* anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'multiply_')>
	
!
(reader addMethod: 'gravel')
!
+ anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'plus_')>
	
!
(reader addMethod: 'gravel')
!
- anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'minus_')>
	
!
(reader addMethod: 'gravel')
!
// anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'integerDivision_')>
	
!
(reader addMethod: 'gravel')
!
< aMagnitude
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: 'gravel')
!
== aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'gravel')
!
bitAnd: anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'bitAnd_')>
	
!
(reader addMethod: 'gravel')
!
bitOr: anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'bitOr_')>
	
!
(reader addMethod: 'gravel')
!
bitXor: anObject
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'bitXor_')>
	
!
(reader addMethod: 'As yet unclassified')
!
compressed
	^self
!
(reader addMethod: 'gravel')
!
printBase: base
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'printBase_')>
	
!
(reader addMethod: 'gravel')
!
quo: aNumber
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'quo_')>
	
!
(reader addMethod: 'As yet unclassified')
!
raisedToInteger: aNumber
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'raisedToInteger_')>
	
!
(reader addMethod: 'gravel')
!
rem: aNumber
	<primitive: #('org.gravel.support.jvm.IntegerExtensions' 'rem_')>
	
!
(reader addMethod: 'gravel')
!
timesRepeat: aBlock
	1 to: self do: [:i | aBlock value].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self
!
