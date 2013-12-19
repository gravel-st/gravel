(reader defineClass: 'JavaArray' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Array')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Array class')
!
(reader propertyAt: 'javaClass' put: '[Ljava.lang.Object;')
!
(reader addMethod: 'gravel')
!
anySatisfy: aBlock
	1 to: self size do: [:i | (aBlock value: (self at: i)) ifTrue: [^true]].
	^false
!
(reader addMethod: 'gravel')
!
asArray
	^self
!
(reader addMethod: 'gravel')
!
at: index
	^self basicAt: index
!
(reader addMethod: 'gravel')
!
at: index put: anObject
	^self basicAt: index put: anObject
!
(reader addMethod: 'gravel')
!
collect: aBlock
	| newColl |
	newColl := Array new: self size.
	1 to: self size do: [:i | newColl at: i put: (aBlock value: (self at: i))].
	^newColl
!
(reader addMethod: 'gravel')
!
do: aBlock
	1 to: self size do: [:each | aBlock value: (self at: each)]
!
(reader addMethod: 'gravel')
!
printOn: aStream
	| tooMany |
	tooMany := aStream position + self maxPrint.
	aStream nextPutAll: '#('.
	self do: 
			[:element |
			aStream position > tooMany
				ifTrue: 
					[aStream nextPutAll: (#etc << #dialogs >> '...etc...') asString , ')'.
					^self].
			element printOn: aStream]
		separatedBy: [aStream space].
	aStream nextPut: $)
!
(reader addMethod: '')
!
replaceFrom: start to: stop with: replacement startingAt: repStart
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'replaceFrom_to_with_startingAt_')>
	
!
(reader addMethod: '')
!
size
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'size')>
	
!
(reader addMethod: 'gravel')
!
species
	^OrderedCollection
!
(reader addMethod: '')
!
zeroAt: index
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'zeroAt_')>
	
!
(reader addMethod: '')
!
zeroAt: index put: anObject
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'zeroAt_put_')>
	
!
(reader addClassMethod: 'gravel')
!
basicNew
	^#()
!
(reader addClassMethod: 'gravel')
!
new
	^self new: 0
!
(reader addClassMethod: '')
!
new: size
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'newInstance_')>
	
!
