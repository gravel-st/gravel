(reader defineClass: 'NonLocalTempReadWritesToHolderConverter' superclass: 'org.gravel.support.compiler.ast.NonLocalTempAccessToHolderConverter')
!
(reader addMethod: 'visiting')
!
needsRewrite: state {VariableScopeAnalyzerState} {^Bool}
	^state isUndecided or: [state isBlockReadAfterWritten]
!
