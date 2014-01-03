(reader defineClass: 'Producer' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
produceClass: aString {Str} superclassPath: superclassPath {Str} properties: properties {Dict[Str, Str]} instVars: instVars {Arr[VariableDeclarationNode]} classInstVars: classInstVars {Arr[VariableDeclarationNode]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} instanceMethods: instanceMethods {Arr[MethodNode]} classMethods: classMethods {Arr[MethodNode]} namespace: anArray {Arr[Str]} traitUsage: traitUsage {TraitUsageNode} classTraitUsage: classTraitUsage {TraitUsageNode} {^ClassNode}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
produceMethod: aString {Str} namespace: anArray {Arr[Str]} {^MethodNode}
	^self produceMethod: aString sourceFile: nil namespace: anArray
!
(reader addMethod: 'As yet unclassified')
!
produceMethod: aString {Str} sourceFile: sourceFile {SourceFile} namespace: anArray {Arr[Str]} {^MethodNode}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
produceVariableDeclaration: name {Str} type: type {Str | Nil} {^VariableDeclarationNode}
	^self subclassResponsibility
!
