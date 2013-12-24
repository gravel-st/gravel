(reader defineClass: 'JavaHashMap' superclass: 'st.gravel.lang.collections.impl.JavaCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Dictionary')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Dictionary class')
!
(reader propertyAt: 'javaClass' put: 'java.util.HashMap')
!
(reader addMethod: 'converting')
!
asJavaMap
	^self
!
(reader addMethod: 'gravel')
!
at: key
	^self at: key ifAbsent: [self keyNotFoundErrorFor: #at: index: key]
!
(reader addMethod: '')
!
at: aKey ifAbsent: aBlock
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'at_ifAbsent_')>
	
!
(reader addMethod: '')
!
at: aKey ifAbsentPut: valueBlock
	^self at: aKey ifAbsent: [self at: aKey put: valueBlock value]
!
(reader addMethod: '')
!
at: aKey put: aValue
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'at_put_')>
	
!
(reader addMethod: '')
!
do: aBlock
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'do_')>
	
!
(reader addMethod: '')
!
includesKey: aKey
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'includesKey_')>
	
!
(reader addMethod: '')
!
keys
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'keys')>
	
!
(reader addMethod: '')
!
keysAndValuesDo: aBlock
	<primitive: #('st.gravel.support.jvm.DictionaryExtensions' 'keysAndValuesDo_')>
	
!
(reader addMethod: '')
!
size
	<primitive: 'size'>
	
!
(reader addClassMethod: 'instance creation')
!
new: anInteger
	^self basicNew
!
