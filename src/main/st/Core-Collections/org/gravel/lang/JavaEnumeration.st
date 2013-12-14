(reader defineClass: 'JavaEnumeration' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.Collection')
!
(reader propertyAt: 'javaClass' put: 'java.util.Enumeration')
!
(reader addMethod: 'gravel')
!
do: aBlock
	<primitive: #('org.gravel.support.jvm.CollectionExtensions' 'enumerationDo_')>
	
!
