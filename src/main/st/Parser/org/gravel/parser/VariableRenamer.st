(reader defineClass: 'VariableRenamer' superclass: 'org.gravel.parser.AbstractVariableRenamer')
!
(reader addMethod: 'visiting')
!
rename: aString {Str} {^Str}
	aString = oldName ifTrue: [^newName].
	^aString
!
(reader addMethod: 'visiting')
!
renameDefinition: aString {Str} {^Str}
	^self rename: aString
!
