(reader defineClass: 'JavaByteArray' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Array')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Array class')
!
(reader propertyAt: 'javaClass' put: 'byte[]')
!
(reader addMethod: 'accessing')
!
at: index
	<primitive: #('st.gravel.support.jvm.ByteArrayExtensions' 'at_')>
	
!
(reader addMethod: 'accessing')
!
at: index put: aByte
	<primitive: #('st.gravel.support.jvm.ByteArrayExtensions' 'at_put_')>
	
!
(reader addMethod: 'accessing')
!
size
	<primitive: #('st.gravel.support.jvm.ByteArrayExtensions' 'size')>
	
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
