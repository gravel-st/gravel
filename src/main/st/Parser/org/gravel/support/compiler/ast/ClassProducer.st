(reader defineClass: 'ClassProducer' superclass: 'org.gravel.support.compiler.ast.Producer')
!
(reader addMethod: 'As yet unclassified')
!
produceClass: aString {Str} superclassPath: superclassPath {Str} properties: properties {Dict[Str, Str]} instVars: instVars {Arr[VariableDeclarationNode]} classInstVars: classInstVars {Arr[VariableDeclarationNode]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} instanceMethods: instanceMethods {Arr[MethodNode]} classMethods: classMethods {Arr[MethodNode]} namespace: anArray {Arr[Str]} traitUsage: traitUsage {TraitUsageNode} classTraitUsage: classTraitUsage {TraitUsageNode} {^ClassNode}
	^ClassNode
		name: aString asSymbol
		superclassPath: superclassPath
		properties: properties
		instVars: instVars
		classInstVars: classInstVars
		sharedVariables: sharedVariables asArray
		methods: instanceMethods asArray
		classMethods: classMethods asArray
		namespace: (anArray collect: [:str {Str} | str asSymbol])
		isExtension: false
		isTrait: false
		traitUsage: traitUsage
		classTraitUsage: classTraitUsage
!
(reader addMethod: 'As yet unclassified')
!
produceMethod: aString {Str} sourceFile: sourceFile {SourceFile} namespace: anArray {Arr[Str]} {^MethodNode}
	^Parser parseMethod: aString sourceFile: sourceFile
!
(reader addMethod: 'As yet unclassified')
!
produceVariableDeclaration: name {Str} type: type {Str | Nil} {^VariableDeclarationNode}
	type isNil ifTrue: [^VariableDeclarationNode name: name].
	^VariableDeclarationNode name: name type: (Parser parseTypeNode: type)
!
