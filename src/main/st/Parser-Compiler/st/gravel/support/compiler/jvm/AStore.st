(reader defineClass: 'AStore' superclass: 'st.gravel.support.compiler.jvm.Store')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitAStore: self
!
