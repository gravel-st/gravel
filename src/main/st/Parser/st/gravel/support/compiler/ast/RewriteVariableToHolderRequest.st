(reader defineClass: 'RewriteVariableToHolderRequest' superclass: 'st.gravel.lang.Error')
!
(reader addInstVar: 'varName' type: 'String')
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {Str} {^Self}
	varName := aString.
	self initialize
!
(reader addMethod: 'accessing')
!
varName {^Str}
	^varName
!
(reader addClassMethod: 'instance creation')
!
varName: aString {Str} {^Instance}
	^self new initializeVarName: aString
!
