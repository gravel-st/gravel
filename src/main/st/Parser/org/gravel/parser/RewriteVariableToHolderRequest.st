(reader defineClass: 'RewriteVariableToHolderRequest' superclass: 'org.gravel.lang.Error')
!
(reader addInstVar: 'varName')
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
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String]}
	^#('varName')
!
(reader addClassMethod: 'instance creation')
!
varName: aString {Str} {^Instance}
	^self new initializeVarName: aString
!
