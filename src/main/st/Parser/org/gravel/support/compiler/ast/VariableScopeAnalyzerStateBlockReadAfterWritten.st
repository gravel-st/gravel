(reader defineClass: 'VariableScopeAnalyzerStateBlockReadAfterWritten' superclass: 'org.gravel.support.compiler.ast.VariableScopeAnalyzerState')
!
(reader addMethod: 'As yet unclassified')
!
withBlockRead {^VariableScopeAnalyzerState}
	^self
!
(reader addMethod: 'As yet unclassified')
!
withLocalRead {^VariableScopeAnalyzerState}
	^self
!
(reader addMethod: 'As yet unclassified')
!
withLocalWrite {^VariableScopeAnalyzerState}
	^VariableScopeAnalyzerStateUndecided new
!
