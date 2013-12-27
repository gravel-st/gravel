(reader defineClass: 'JavaArrayList' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.AddableCollection class')
!
(reader propertyAt: 'javaClass' put: 'java.util.ArrayList')
!
(reader addMethod: 'gravel')
!
add: anObject
	^self addLast: anObject
!
(reader addMethod: 'gravel')
!
addLast: anObject
	self java_add: anObject.
	^anObject
!
(reader addMethod: 'converting')
!
asJavaArrayList
	^self
!
(reader addMethod: '')
!
at: index
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'at_')>
	
!
(reader addMethod: '')
!
at: index put: anObject
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'at_put_')>
	
!
(reader addMethod: 'gravel')
!
do: aBlock
	| iterator |
	iterator := self java_iterator.
	[iterator java_hasNext] whileTrue: [aBlock value: iterator java_next]
!
(reader addMethod: 'gravel')
!
indexOf: anElement
	^(self zeroIndexOf: anElement) + 1
!
(reader addMethod: 'gravel')
!
indexOf: anElement ifAbsent: exceptionBlock
	| idx |
	idx := self indexOf: anElement.
	idx = 0 ifTrue: [^exceptionBlock value].
	^idx
!
(reader addMethod: '')
!
insert: anObject before: spot
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'insert_before_')>
	
!
(reader addMethod: '')
!
java_add: anObject
	<primitive: 'add'>
	
!
(reader addMethod: '')
!
java_iterator
	<primitive: 'iterator'>
	
!
(reader addMethod: 'gravel')
!
remove: oldObject ifAbsent: anExceptionBlock
	| index |
	index := self indexOf: oldObject.
	index = 0 ifTrue: [^anExceptionBlock value].
	self removeIndex: index.
	^oldObject
!
(reader addMethod: 'gravel')
!
removeFirst
	^self removeIndex: 1
!
(reader addMethod: '')
!
removeIndex: idx
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'removeIndex_')>
	
!
(reader addMethod: '')
!
size
	<primitive: 'size'>
	
!
(reader addMethod: '')
!
zeroIndexOf: anElement
	<primitive: 'indexOf'>
	
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^self
!
(reader addClassMethod: '')
!
new: size
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'new_')>
	
!
(reader addClassMethod: '')
!
newImpl: size
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'new_')>
	
!
(reader addClassMethod: '')
!
withSize: size
	<primitive: #('st.gravel.support.jvm.OrderedCollectionExtensions' 'withSize_')>
	
!
