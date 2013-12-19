(reader defineClass: 'AbstractMethodMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMapping')
!
(reader addInstVar: 'methodHandle')
!
(reader addInstVar: 'definingClass')
!
(reader addMethod: 'accessing')
!
definingClass {^JavaClass}
	^definingClass
!
(reader addMethod: 'accessing')
!
methodHandle {^JavaMethodHandle}
	^methodHandle
!
(reader addMethod: 'As yet unclassified')
!
methodNode {^MethodNode}
	^nil
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JavaMethodHandle, JavaClass]}
	^#('methodHandle' 'definingClass')
!
