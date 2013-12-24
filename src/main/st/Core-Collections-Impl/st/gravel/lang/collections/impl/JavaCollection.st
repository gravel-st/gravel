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
(reader addClassMethod: 'gravel')
!
with: anObject
	| newCollection |
	newCollection := self new.
	newCollection add: anObject.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
with: anObject1 with: anObject2
	| newCollection |
	newCollection := self new.
	newCollection add: anObject1.
	newCollection add: anObject2.
	^newCollection
!
(reader addClassMethod: 'gravel')
!
withAll: aCollection
	| newCollection |
	newCollection := self new.
	newCollection addAll: aCollection.
	^newCollection
!
