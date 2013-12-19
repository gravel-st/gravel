(reader defineClass: 'NonLocalTempReadWritesToHolderConverter' superclass: 'st.gravel.support.compiler.ast.NonLocalTempAccessToHolderConverter')
!
(reader addMethod: 'visiting')
!
needsRewrite: state {VariableScopeAnalyzerState} {^Bool}
	^state isUndecided or: [state isBlockReadAfterWritten]
!
