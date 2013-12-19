(reader defineClass: 'VariableRenamer' superclass: 'st.gravel.support.compiler.ast.AbstractVariableRenamer')
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
