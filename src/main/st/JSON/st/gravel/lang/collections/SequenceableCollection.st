(reader extendTrait: 'SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequencedReadable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequencedReadable class')
!
(reader addMethod: 'printing')
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
