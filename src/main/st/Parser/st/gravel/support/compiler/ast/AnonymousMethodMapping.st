(reader defineClass: 'AnonymousMethodMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMethodMapping')
!
(reader addMethod: 'initialize-release')
!
initializeMethodHandle: aJavaMethodHandle {JavaMethodHandle} definingClass: aJavaClass {JavaClass} {^Self}
	methodHandle := aJavaMethodHandle.
	definingClass := aJavaClass.
	self initialize
!
(reader addClassMethod: 'instance creation')
!
methodHandle: aJavaMethodHandle {JavaMethodHandle} definingClass: definingClass {JavaClass} {^AbstractMethodMapping}
	^self new initializeMethodHandle: aJavaMethodHandle definingClass: definingClass
!
