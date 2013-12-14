(reader defineClass: 'AbstractMethodMapping' superclass: 'org.gravel.parser.AbstractMapping')
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
