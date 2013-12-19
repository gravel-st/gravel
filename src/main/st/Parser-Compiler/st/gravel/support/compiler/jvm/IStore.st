(reader defineClass: 'IStore' superclass: 'st.gravel.support.compiler.jvm.Store')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIStore: self
!
