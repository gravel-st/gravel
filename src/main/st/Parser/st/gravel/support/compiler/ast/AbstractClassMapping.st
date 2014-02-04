(reader defineClass: 'AbstractClassMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMapping')
!
(reader addInstVar: 'classNode' type: 'ClassDescriptionNode')
!
(reader addMethod: 'As yet unclassified')
!
allInstVarsIn: aSystemMapping {SystemMapping} {^Arr[BoundVariableDeclarationNode]}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
classNode {^ClassDescriptionNode}
	^classNode
!
(reader addMethod: 'As yet unclassified')
!
identityClass {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^classNode reference
!
(reader addMethod: 'As yet unclassified')
!
superclassMappingIn: aSystemMapping {SystemMapping} {^AbstractClassMapping | Nil}
	| superclassReference {Reference} |
	superclassReference := self superclassReference.
	superclassReference isNil ifTrue: [^nil].
	^aSystemMapping classMappingAtReference: superclassReference
!
(reader addMethod: 'accessing')
!
superclassReference {^Reference}
	^classNode superclassReference
!
