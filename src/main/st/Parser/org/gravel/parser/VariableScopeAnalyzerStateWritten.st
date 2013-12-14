(reader defineClass: 'VariableScopeAnalyzerStateWritten' superclass: 'org.gravel.parser.VariableScopeAnalyzerState')
!
(reader addMethod: 'As yet unclassified')
!
withBlockRead {^VariableScopeAnalyzerState}
	^VariableScopeAnalyzerStateBlockReadAfterWritten new
!
(reader addMethod: 'As yet unclassified')
!
withLocalRead {^VariableScopeAnalyzerState}
	^VariableScopeAnalyzerStateReadWritten new
!
(reader addMethod: 'As yet unclassified')
!
withLocalWrite {^VariableScopeAnalyzerState}
	^self
!
