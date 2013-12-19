(reader defineClass: 'JVMNonPrimitiveType' superclass: 'st.gravel.support.compiler.jvm.JVMType')
!
(reader addMethod: 'accessing')
!
className {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
dottedClassName {^Str}
	^self subclassResponsibility
!
