(reader extendTrait: 'SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Collection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Collection class')
!
(reader addMethod: 'As yet unclassified')
!
jsonOn: aStream prettyPrint: aBoolean
	| putComma |
	aStream nextPut: $[.
	putComma := false.
	self do: 
			[:elem |
			putComma ifTrue: [aStream nextPut: $,].
			putComma := true.
			elem jsonOn: aStream prettyPrint: aBoolean].
	aStream nextPut: $]
!
