(reader defineClass: 'PopFrame' superclass: 'st.gravel.support.compiler.jvm.SimulatedInstruction')
!
(reader addMethod: 'As yet unclassified')
!
accept: visitor
	^visitor visitPopFrame: self
!
