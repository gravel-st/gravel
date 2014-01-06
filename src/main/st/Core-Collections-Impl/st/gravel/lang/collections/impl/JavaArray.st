(reader defineClass: 'JavaArray' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Array')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Array class')
!
(reader propertyAt: 'javaClass' put: '[Ljava.lang.Object;')
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
(reader addMethod: 'copying')
!
shallowCopy
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'shallowCopy')>
	
!
(reader addMethod: '')
!
size
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'size')>
	
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
(reader addMethod: '')
!
_replaceFrom: start to: stop with: replacement startingAt: repStart
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'replaceFrom_to_with_startingAt_')>
	
!
(reader addClassMethod: 'gravel')
!
basicNew
	^#()
!
(reader addClassMethod: 'gravel')
!
newImpl
	^self newImpl: 0
!
(reader addClassMethod: '')
!
newImpl: size
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'newInstance_')>
	
!
