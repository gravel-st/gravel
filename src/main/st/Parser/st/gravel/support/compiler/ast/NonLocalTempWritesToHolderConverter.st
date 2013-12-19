(reader defineClass: 'NonLocalTempWritesToHolderConverter' superclass: 'st.gravel.support.compiler.ast.NonLocalTempAccessToHolderConverter')
!
(reader addMethod: 'visiting')
!
needsRewrite: state {VariableScopeAnalyzerState} {^Bool}
	^state isUndecided
!
