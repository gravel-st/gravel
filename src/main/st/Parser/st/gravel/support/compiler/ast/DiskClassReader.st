(reader defineClass: 'DiskClassReader' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'root')
!
(reader addInstVar: 'producer')
!
(reader addInstVar: 'directives')
!
(reader addMethod: 'directives')
!
addClassInstVar: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode withClassInstVar: (VariableDeclarationNode name: aString)
!
(reader addMethod: 'directives')
!
addClassMethod: aParser {Parser} for: aClassNode {ClassNode} {^ClassNode}
	^self addClassMethod: aParser protocol: 'gravel' for: aClassNode
!
(reader addMethod: 'directives')
!
addClassMethod: aParser {Parser} protocol: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	aParser parseBang.
	^aClassNode withClassMethodNode: (aParser parseMethod withProtocol: aString)
!
(reader addMethod: 'directives')
!
addInstVar: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode withInstVar: (VariableDeclarationNode name: aString)
!
(reader addMethod: 'directives')
!
addMethod: aParser {Parser} for: aClassNode {ClassNode} {^ClassNode}
	^self addMethod: aParser protocol: 'gravel' for: aClassNode
!
(reader addMethod: 'directives')
!
addMethod: aParser {Parser} protocol: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	aParser parseBang.
	^aClassNode withMethodNode: (aParser parseMethod withProtocol: aString)
!
(reader addMethod: 'directives')
!
addSimpleClassTrait: referenceString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode
		withClassTrait: (SimpleTraitUsageNode reference: (Reference value: referenceString))
!
(reader addMethod: 'directives')
!
addSimpleTrait: referenceString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode
		withTrait: (SimpleTraitUsageNode reference: (Reference value: referenceString))
!
(reader addMethod: 'directives')
!
defineClass: name {Str} superclass: superclassPath {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode withSuperclassPath: superclassPath
!
(reader addMethod: 'directives')
!
defineSharedVariable: sharedName {Str} init: initializerSource {Str} for: aClassNode {ClassNode} {^ClassNode}
	| initializer {Expression | Nil} |
	initializer := self parseInitializerSource: initializerSource.
	^aClassNode
		withSharedVariable: (SharedDeclarationNode name: sharedName initializer: initializer)
!
(reader addMethod: 'directives')
!
defineTrait: name {Str} superclass: superclassPath {Str} for: aClassNode {ClassNode} {^ClassNode}
	^(self defineClass: name superclass: superclassPath for: aClassNode) asTrait
!
(reader addMethod: 'As yet unclassified')
!
directiveAt: selector {Str} {^[ClassNode, MessageNode, Parser, ^ClassNode]}
	^directives at: selector ifAbsent: [self error: 'Unknown directive: ' , selector]
!
(reader addMethod: 'initialize-release')
!
evaluate: aLiteralNode {LiteralNode} {^Str}
	^aLiteralNode value
!
(reader addMethod: 'directives')
!
extendClass: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode beExtension
!
(reader addMethod: 'directives')
!
extendTrait: aString {Str} for: aClassNode {ClassNode} {^ClassNode}
	^(self extendClass: aString for: aClassNode) asTrait
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	directives := Dictionary new.
	directives at: 'defineClass:superclass:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				defineClass: (self evaluate: expr arguments first)
				superclass: (self evaluate: expr arguments second)
				for: classNode].
	directives at: 'extendClass:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self extendClass: (self evaluate: expr arguments first) for: classNode].
	directives at: 'defineTrait:superclass:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				defineTrait: (self evaluate: expr arguments first)
				superclass: (self evaluate: expr arguments second)
				for: classNode].
	directives at: 'extendTrait:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self extendTrait: (self evaluate: expr arguments first) for: classNode].
	directives at: 'addSimpleTrait:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addSimpleTrait: (self evaluate: expr arguments first) for: classNode].
	directives at: 'addSimpleClassTrait:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addSimpleClassTrait: (self evaluate: expr arguments first) for: classNode].
	directives at: 'addInstVar:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addInstVar: (self evaluate: expr arguments first) for: classNode].
	directives at: 'addClassInstVar:'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addClassInstVar: (self evaluate: expr arguments first) for: classNode].
	directives at: 'propertyAt:put:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				propertyAt: (self evaluate: expr arguments first)
				put: (self evaluate: expr arguments second)
				for: classNode].
	directives at: 'addMethod'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addMethod: parser for: classNode].
	directives at: 'addClassMethod'
		put: [:classNode {ClassNode} :expr {MessageNode} :parser {Parser} | self addClassMethod: parser for: classNode].
	directives at: 'addMethod:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				addMethod: parser
				protocol: (self evaluate: expr arguments first)
				for: classNode].
	directives at: 'addClassMethod:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				addClassMethod: parser
				protocol: (self evaluate: expr arguments first)
				for: classNode].
	directives at: 'defineSharedVariable:init:'
		put: 
			[:classNode {ClassNode} :expr {MessageNode} :parser {Parser} |
			self
				defineSharedVariable: (self evaluate: expr arguments first)
				init: (self evaluate: expr arguments second)
				for: classNode]
!
(reader addMethod: 'initialize-release')
!
initializeRoot: aFilename {Filename} producer: aProducer {Producer} {^Self}
	root := aFilename.
	producer := aProducer.
	self initialize
!
(reader addMethod: 'directives')
!
parseInitializerSource: initializerSource {Str} {^Expression | Nil}
	^initializerSource isNil
		ifTrue: [nil]
		ifFalse: [Parser parseExpression: initializerSource]
!
(reader addMethod: 'accessing')
!
producer {^Producer}
	^producer
!
(reader addMethod: 'directives')
!
propertyAt: key {Str} put: value {Str} for: aClassNode {ClassNode} {^ClassNode}
	^aClassNode withPropertyAt: key put: value
!
(reader addMethod: 'As yet unclassified')
!
read {^SystemDefinitionNode}
	| coll {OrdColl[PackageNode]} |
	coll := OrderedCollection new.
	root directoryContents
		do: [:packageName {Str} | coll add: (self readPackage: packageName)].
	^SystemDefinitionNode packageNodes: coll asArray
!
(reader addMethod: 'As yet unclassified')
!
readClass: aName {Str} packageName: packageName {Sym} file: aFilename {Filename} namespace: anArray {Arr[Str]} {^ClassNode}
	| parser {Parser} expr {MessageNode} cn {ClassNode} directive {[ClassNode, MessageNode, Parser, ^ClassNode]} start {Int} |
	cn := ClassNode name: aName asSymbol
				namespacePath: (anArray collect: [:each {Str} | each asSymbol]).
	parser := Parser source: aFilename contentsOfEntireFile
				sourceFile: (SourceFile
						directory: aFilename head
						name: aFilename tail
						packageName: packageName).
	start := parser position.
	[parser atEnd] whileFalse: 
			[expr := parser parseExpression.
			directive := self directiveAt: expr selector.
			cn := directive value: cn value: expr value: parser.
			parser atEnd ifFalse: [parser parseBang]].
	^parser setSourcePosition: start node: cn
!
(reader addMethod: 'As yet unclassified')
!
readClassesIn: fn {Filename} packageName: packageName {Sym} namespace: anArray {Arr[Str]} {^PackageNode}
	| pkg {PackageNode} |
	pkg := PackageNode name: packageName.
	fn directoryContents do: 
			[:sf {Str} |
			| subfile {Filename} |
			subfile := fn / sf.
			subfile isDirectory
				ifTrue: 
					[pkg := pkg withPackage: (self
										readClassesIn: subfile
										packageName: packageName
										namespace: (anArray copyWith: sf))]
				ifFalse: 
					[(sf endsWith: '.st')
						ifTrue: 
							[pkg := pkg withClass: (self
												readClass: (sf allButLast: '.st' size)
												packageName: packageName
												file: subfile
												namespace: anArray)]
						ifFalse: 
							[sf = 'properties.json'
								ifTrue: [pkg := pkg withNamespace: (self readNamespace: subfile namespace: anArray)]]]].
	^pkg
!
(reader addMethod: 'As yet unclassified')
!
readNamespace: aFilename {Filename} namespace: namespaceStrings {Arr[Str]} {^NamespaceNode}
	| dict {Dict[Str, Object]} publicImports {Arr[AbsoluteReference]} privateImports {Arr[AbsoluteReference]} publicImportStrings {Arr[Object]} privateImportStrings {Arr[Object]} sharedVariableStrings {Dict[Str, Str]} sharedVariables {OrdColl[SharedDeclarationNode]} |
	dict := self readPropertiesFile: aFilename.
	publicImportStrings := dict at: 'publicImports' ifAbsent: [#()].
	privateImportStrings := dict at: 'privateImports' ifAbsent: [#()].
	sharedVariableStrings := dict at: 'sharedVariables' ifAbsent: [Dictionary new].
	publicImports := publicImportStrings collect: 
					[:obj {Object} |
					| str {Str} |
					str := obj.
					Reference value: str].
	privateImports := privateImportStrings collect: 
					[:obj {Object} |
					| str {Str} |
					str := obj.
					Reference value: str].
	sharedVariables := OrderedCollection new.
	sharedVariableStrings keysAndValuesDo: 
			[:name {Str} :initializerString {Str} |
			sharedVariables add: (SharedDeclarationNode name: name
						initializer: (self parseInitializerSource: initializerString))].
	^NamespaceNode
		reference: (AbsoluteReference
				path: (namespaceStrings collect: [:each {Str} | each asSymbol]))
		publicImports: publicImports
		privateImports: privateImports
		sharedVariables: sharedVariables asArray
!
(reader addMethod: 'As yet unclassified')
!
readPackage: aString {Str} {^PackageNode}
	^self
		readClassesIn: root / aString
		packageName: aString asSymbol
		namespace: #()
!
(reader addMethod: 'As yet unclassified')
!
readPropertiesFile: aFilename {Filename} {^Dict[Str, Object]}
	aFilename exists ifFalse: [^Dictionary new].
	^aFilename contentsOfEntireFile parseAsJSONValue
!
(reader addMethod: 'accessing')
!
root {^Filename}
	^root
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Filename, Producer, Dict[Str, [ClassNode, MessageNode, Parser, ^ClassNode]]]}
	^#('root' 'producer' 'directives')
!
(reader addClassMethod: 'instance creation')
!
root: aFilename {Filename} producer: aProducer {Producer} {^DiskClassReader}
	^self new initializeRoot: aFilename producer: aProducer
!
