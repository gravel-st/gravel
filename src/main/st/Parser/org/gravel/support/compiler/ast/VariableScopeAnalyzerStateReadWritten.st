(reader defineClass: 'VariableScopeAnalyzerStateReadWritten' superclass: 'org.gravel.support.compiler.ast.VariableScopeAnalyzerState')
!
(reader addMethod: 'As yet unclassified')
!
withBlockRead {^VariableScopeAnalyzerState}
	^VariableScopeAnalyzerStateBlockReadAfterWritten new
!
(reader addMethod: 'As yet unclassified')
!
withLocalRead {^VariableScopeAnalyzerState}
	^self
!
(reader addMethod: 'As yet unclassified')
!
withLocalWrite {^VariableScopeAnalyzerState}
	^self
!
