(reader extendClass: 'JavaCharacter')
!
(reader addSimpleTrait: 'st.gravel.lang.Character')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Character class')
!
(reader addMethod: 'printing')
!
putOnStringBuilder: aJavaStringBuilder
	^aJavaStringBuilder nextPutJavaCharacter: self
!
