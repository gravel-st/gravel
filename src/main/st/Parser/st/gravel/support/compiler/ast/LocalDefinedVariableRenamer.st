(reader defineClass: 'LocalDefinedVariableRenamer' superclass: 'st.gravel.support.compiler.ast.AbstractVariableRenamer')
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
