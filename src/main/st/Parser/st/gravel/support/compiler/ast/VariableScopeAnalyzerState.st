(reader defineClass: 'VariableScopeAnalyzerState' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
isBlockReadAfterWritten {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isUndecided {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
withBlockRead {^VariableScopeAnalyzerState}
	^self
!
(reader addMethod: 'As yet unclassified')
!
withBlockWrite {^VariableScopeAnalyzerState}
	^VariableScopeAnalyzerStateUndecided new
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
