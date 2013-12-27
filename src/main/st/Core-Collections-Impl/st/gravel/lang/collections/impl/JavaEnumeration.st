(reader defineClass: 'JavaEnumeration' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Collection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Collection class')
!
(reader propertyAt: 'javaClass' put: 'java.util.Enumeration')
!
(reader addMethod: '')
!
do: aBlock
	<primitive: #('st.gravel.support.jvm.CollectionExtensions' 'enumerationDo_')>
	
!
(reader addClassMethod: 'private - traits')
!
newImpl: anInteger
	^self basicNew
!
