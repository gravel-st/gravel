(reader defineClass: 'IdentityDictionaryImpl' superclass: 'st.gravel.lang.collections.impl.DictionaryImpl')
!
(reader addMethod: 'accessing')
!
keyAtValue: value ifAbsent: exceptionBlock
	^self keyAtIdentityValue: value ifAbsent: exceptionBlock
!
(reader addMethod: 'private')
!
scanFor: anObject
	| index start |
	index := start := anObject scaledIdentityHash \\ array size + 1.
	
	[| element |
	((element := array at: index) == nil or: [element key == anObject]) ifTrue: [^index].
	(index := index \\ array size + 1) = start]
			whileFalse.
	self errorNoFreeSpace
!
