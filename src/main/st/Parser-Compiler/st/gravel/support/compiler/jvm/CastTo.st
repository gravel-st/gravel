(reader defineClass: 'CastTo' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastTo: self
!
(reader addMethod: 'As yet unclassified')
!
isCast {^Bool}
	^true
!
