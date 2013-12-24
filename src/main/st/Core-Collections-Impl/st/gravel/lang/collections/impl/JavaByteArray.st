(reader defineClass: 'JavaByteArray' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Array')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Array class')
!
(reader propertyAt: 'javaClass' put: 'byte[]')
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
