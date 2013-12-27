(reader defineClass: 'JavaCollection' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Collection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Collection class')
!
(reader addMethod: 'gravel')
!
, aCollection
	^self copyWithAll: aCollection
!
(reader addMethod: 'gravel')
!
add: anObject
	^self subclassResponsibility
!
(reader addMethod: '')
!
do: aBlock
	<primitive: #('st.gravel.support.jvm.CollectionExtensions' 'do_')>
	
!
(reader addClassMethod: 'instance creation')
!
newImpl: anInteger
	^self basicNew
!
