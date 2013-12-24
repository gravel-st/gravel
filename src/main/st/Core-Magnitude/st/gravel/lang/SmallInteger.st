(reader defineClass: 'SmallInteger' superclass: 'st.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Integer')
!
(reader addMethod: '')
!
* anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'multiply_')>
	
!
(reader addMethod: '')
!
+ anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'plus_')>
	
!
(reader addMethod: '')
!
- anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'minus_')>
	
!
(reader addMethod: '')
!
// anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'integerDivision_')>
	
!
(reader addMethod: '')
!
< aMagnitude
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'isSmallerThan_')>
	
!
(reader addMethod: '')
!
== aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: '')
!
bitAnd: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitAnd_')>
	
!
(reader addMethod: '')
!
bitOr: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitOr_')>
	
!
(reader addMethod: '')
!
bitXor: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitXor_')>
	
!
(reader addMethod: 'As yet unclassified')
!
compressed
	^self
!
(reader addMethod: 'comparing')
!
hash
	^self
!
(reader addMethod: '')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'printBase_')>
	
!
(reader addMethod: '')
!
quo: aNumber
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'quo_')>
	
!
(reader addMethod: '')
!
raisedToInteger: aNumber
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'raisedToInteger_')>
	
!
(reader addMethod: '')
!
rem: aNumber
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'rem_')>
	
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
(reader addMethod: '')
!
\\ anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'integerRemainder_')>
	
!
