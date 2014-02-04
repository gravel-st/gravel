(reader defineClass: 'AbstractMethodMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMapping')
!
(reader addInstVar: 'methodHandle' type: 'JavaMethodHandle')
!
(reader addInstVar: 'definingClass' type: 'JavaClass')
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
