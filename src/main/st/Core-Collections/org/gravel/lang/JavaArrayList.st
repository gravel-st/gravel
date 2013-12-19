(reader defineClass: 'JavaArrayList' superclass: 'org.gravel.lang.Object')
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
(reader addMethod: 'gravel')
!
at: index
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'at_')>
	
!
(reader addMethod: 'gravel')
!
at: index put: anObject
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'at_put_')>
	
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
(reader addMethod: 'gravel')
!
insert: anObject before: spot
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'insert_before_')>
	
!
(reader addMethod: 'gravel')
!
java_add: anObject
	<primitive: 'add'>
	
!
(reader addMethod: 'gravel')
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
(reader addMethod: 'gravel')
!
removeIndex: idx
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'removeIndex_')>
	
!
(reader addMethod: 'gravel')
!
size
	<primitive: 'size'>
	
!
(reader addMethod: 'gravel')
!
zeroIndexOf: anElement
	<primitive: 'indexOf'>
	
!
(reader addClassMethod: 'gravel')
!
new: size
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'new_')>
	
!
(reader addClassMethod: 'gravel')
!
withSize: size
	<primitive: #('org.gravel.support.jvm.OrderedCollectionExtensions' 'withSize_')>
	
!
