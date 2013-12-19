(reader defineClass: 'Dictionary' superclass: 'st.gravel.lang.CollectionImpl')
!
(reader propertyAt: 'javaClass' put: 'java.util.HashMap')
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
