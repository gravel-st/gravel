(reader defineTrait: 'Array' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ArrayedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ArrayedCollection class')
!
(reader addMethod: 'comparing')
!
= anArray
	self == anArray ifTrue: [^true].
	anArray isArray ifFalse: [^false].
	self size = anArray size ifFalse: [^false].
	self with: anArray do: [:a :b | a = b ifFalse: [^false]].
	^true
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
collect: aBlock
	| newColl |
	newColl := Array new: self size.
	1 to: self size do: [:i | newColl at: i put: (aBlock value: (self at: i))].
	^newColl
!
(reader addMethod: 'comparing')
!
hash
	| sum |
	sum := self class hash.
	self do: [:elem | sum := sum bitXor: elem hash].
	^sum
!
(reader addMethod: 'testing')
!
isArray
	<squeak>
	^true
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
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^JavaArray
!
(reader addClassMethod: 'As yet unclassified')
!
withSize: size
	^self defaultImplementation new: size
!
