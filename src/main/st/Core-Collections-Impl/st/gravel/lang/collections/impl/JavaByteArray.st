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
(reader addClassMethod: 'instance creation')
!
newImpl
	^self newImpl: 0
!
(reader addClassMethod: 'instance creation')
!
newImpl: size
	<primitive: #('st.gravel.support.jvm.ArrayExtensions' 'newInstance_')>
	
!
