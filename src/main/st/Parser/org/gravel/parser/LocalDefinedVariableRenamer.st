(reader defineClass: 'LocalDefinedVariableRenamer' superclass: 'org.gravel.parser.AbstractVariableRenamer')
!
(reader addMethod: 'visiting')
!
rename: aString {Str} {^Str}
	(aString = oldName and: [localNames includes: aString]) ifTrue: [^newName].
	^aString
!
(reader addMethod: 'visiting')
!
renameDefinition: aString {Str} {^Str}
	aString = oldName ifTrue: [^newName].
	^aString
!
