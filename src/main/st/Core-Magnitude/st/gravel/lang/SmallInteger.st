(reader defineClass: 'SmallInteger' superclass: 'st.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Integer')
!
(reader addMethod: 'arithmetic')
!
* anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'multiply_')>
	
!
(reader addMethod: 'arithmetic')
!
+ anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'plus_')>
	
!
(reader addMethod: 'arithmetic')
!
- anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'minus_')>
	
!
(reader addMethod: 'arithmetic')
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
(reader addMethod: 'arithmetic')
!
gcd: anInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'gcd_')>
	
!
(reader addMethod: 'comparing')
!
hash
	^self
!
(reader addMethod: 'comparing')
!
hashMultiply
 <primitive: #('st.gravel.support.jvm.IntegerExtensions' 'hashMultiply')>| low14Bits a b c d e f g |
	low14Bits := (self bitAnd: 16383).
	a := (self bitShift: -14).
	b := (101 * low14Bits).
	c := ((9741 * a) + b).
	d := (c bitAnd: 16383).
	e := (9741 * low14Bits).
	f := (16384 * d).
	g := (f + e).
	^(g bitAnd: 268435455)
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
(reader addMethod: 'arithmetic')
!
\\ anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'integerRemainder_')>
	
!
