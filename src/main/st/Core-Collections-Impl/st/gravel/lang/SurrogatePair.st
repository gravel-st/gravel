(reader extendClass: 'SurrogatePair')
!
(reader addSimpleTrait: 'st.gravel.lang.Character')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Character class')
!
(reader addInstVar: 'characters')
!
(reader addMethod: 'printing')
!
putOnStringBuilder: aJavaStringBuilder
	^aJavaStringBuilder nextPutSurrogatePairCharacters: characters
!
