(reader defineClass: 'Dictionary' superclass: 'org.gravel.lang.CollectionImpl')
!
(reader propertyAt: 'javaClass' put: 'java.util.HashMap')
!
(reader addMethod: 'gravel')
!
at: key
	^self at: key ifAbsent: [self keyNotFoundErrorFor: #at: index: key]
!
(reader addMethod: 'gravel')
!
at: aKey ifAbsent: aBlock
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'at_ifAbsent_')>
	
!
(reader addMethod: 'gravel')
!
at: aKey put: aValue
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'at_put_')>
	
!
(reader addMethod: 'gravel')
!
do: aBlock
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'do_')>
	
!
(reader addMethod: 'gravel')
!
includesKey: aKey
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'includesKey_')>
	
!
(reader addMethod: 'gravel')
!
keys
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'keys')>
	
!
(reader addMethod: 'gravel')
!
keysAndValuesDo: aBlock
	<primitive: #('org.gravel.support.jvm.DictionaryExtensions' 'keysAndValuesDo_')>
	
!
(reader addMethod: 'gravel')
!
size
	<primitive: 'size'>
	
!
