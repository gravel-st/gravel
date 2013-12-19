(reader defineClass: 'DiskClassWriter' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'root')
!
(reader addInstVar: 'formatter')
!
(reader addMethod: 'As yet unclassified')
!
asLiteralNode: aValue {String | Nil} {^Expression}
	aValue isNil ifTrue: [^NilLiteralNode new].
	^StringLiteralNode value: aValue
!
(reader addMethod: 'accessing')
!
formatter {^Formatter}
	^formatter
!
(reader addMethod: 'initialize-release')
!
initializeRoot: anUnixFilename {Filename} formatter: aVWFormatter {Formatter} {^Self}
	root := anUnixFilename.
	formatter := aVWFormatter.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
initializerSource: anExpression {Expression} {^Expression}
	anExpression isNil ifTrue: [^NilLiteralNode new].
	^self asLiteralNode: anExpression sourceString
!
(reader addMethod: 'As yet unclassified')
!
referenceAsLiteralNode: aValue {Reference | Nil} {^Expression}
	aValue isNil ifTrue: [^NilLiteralNode new].
	^StringLiteralNode value: aValue printString
!
(reader addMethod: 'accessing')
!
root {^Filename}
	^root
!
(reader addMethod: 'As yet unclassified')
!
write: aPackageNode {PackageNode} {^Self}
	| pkgRoot {Filename} |
	pkgRoot := root / aPackageNode name asString.
	pkgRoot ensureDirectoryExists.
	aPackageNode classes do: [:cl {ClassNode} | self writeClass: cl in: pkgRoot].
	aPackageNode namespaces do: [:ns {NamespaceNode} | self writeNamespace: ns in: pkgRoot]
!
(reader addMethod: 'As yet unclassified')
!
writeClass: aClassNode {ClassNode} in: aFilename {Filename} {^Self}
	| nsFn {Filename} clFn {Filename} str {WStream[Char]} reader {VariableNode} |
	nsFn := aClassNode reference namespace path inject: aFilename
				into: [:fn {Filename} :each {Sym} | fn / each asString].
	nsFn ensureDirectoryExists.
	clFn := nsFn / (aClassNode reference name asString , '.st').
	str := WriteStream on: String new.
	reader := VariableNode name: 'reader'.
	aClassNode isExtension
		ifTrue: 
			[self writeDirective: (reader
						send: (aClassNode isTrait ifTrue: ['extendTrait:'] ifFalse: ['extendClass:'])
						with: (self asLiteralNode: aClassNode name asString))
				on: str]
		ifFalse: 
			[self writeDirective: (reader
						send: (aClassNode isTrait
								ifTrue: ['defineTrait:superclass:']
								ifFalse: ['defineClass:superclass:'])
						with: (self asLiteralNode: aClassNode name asString)
						with: (self referenceAsLiteralNode: aClassNode superclassReference))
				on: str.
			aClassNode metaclassNode sharedVariables do: 
					[:sv {SharedDeclarationNode} |
					self writeDirective: (reader
								send: 'defineSharedVariable:init:'
								with: (self asLiteralNode: sv name)
								with: (self initializerSource: sv initializer))
						on: str]].
	(TraitUsageToDirectiveConverter visit: aClassNode traitUsage)
		do: [:each {Node} | self writeDirective: each on: str].
	(ClassTraitUsageToDirectiveConverter visit: aClassNode metaclassNode traitUsage)
		do: [:each {Node} | self writeDirective: each on: str].
	aClassNode instVars do: 
			[:each {VariableDeclarationNode} |
			self writeDirective: (reader send: 'addInstVar:' with: (self asLiteralNode: each name))
				on: str].
	aClassNode metaclassNode instVars do: 
			[:each {VariableDeclarationNode} |
			self
				writeDirective: (reader send: 'addClassInstVar:' with: (self asLiteralNode: each name))
				on: str].
	aClassNode properties keysAndValuesDo: 
			[:k {Str} :v {Str} |
			self writeDirective: (reader
						send: 'propertyAt:put:'
						with: (self asLiteralNode: k)
						with: (self asLiteralNode: v))
				on: str].
	aClassNode methods do: 
			[:each {MethodNode} |
			self
				writeDirective: (reader send: 'addMethod:' with: (self asLiteralNode: each protocol))
				on: str.
			self writeMethod: each on: str].
	aClassNode metaclassNode methods do: 
			[:each {MethodNode} |
			self
				writeDirective: (reader send: 'addClassMethod:' with: (self asLiteralNode: each protocol))
				on: str.
			self writeMethod: each on: str].
	str contents writeToFile: clFn
!
(reader addMethod: 'As yet unclassified')
!
writeDirective: aNode {Node} on: aWriteStream {WriteStream[Char]} {^Self}
	aWriteStream
		nextPutAll: aNode sourceString;
		cr;
		nextPut: $!;
		cr
!
(reader addMethod: 'As yet unclassified')
!
writeMethod: aNode {Node} on: aWriteStream {WriteStream[Char]} {^Self}
	aWriteStream
		nextPutAll: (formatter format: aNode);
		cr;
		nextPut: $!;
		cr
!
(reader addMethod: 'As yet unclassified')
!
writeNamespace: aNamespaceNode {NamespaceNode} in: aFilename {Filename} {^Self}
	| nsFn {Filename} json {Str} dict {Dict[Str, Obj]} privateImports {Arr[Str]} publicImports {Arr[Str]} sharedVariables {Dict[Str, Str]} |
	nsFn := aNamespaceNode reference path inject: aFilename
				into: [:fn {Filename} :each {Sym} | fn / each asString].
	nsFn ensureDirectoryExists.
	dict := Dictionary new.
	privateImports := aNamespaceNode privateImports
				collect: [:each {AbsoluteReference} | each printString].
	dict at: 'privateImports' put: privateImports.
	publicImports := aNamespaceNode publicImports
				collect: [:each {AbsoluteReference} | each printString].
	dict at: 'publicImports' put: publicImports.
	sharedVariables := Dictionary new.
	aNamespaceNode sharedVariables do: 
			[:each {SharedDeclarationNode} |
			sharedVariables at: each name
				put: (each initializer isNil ifTrue: [nil] ifFalse: [each initializer sourceString])].
	dict at: 'sharedVariables' put: sharedVariables.
	json := dict asJSON.
	json writeToFile: nsFn / 'properties.json'
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Filename, Formatter]}
	^#('root' 'formatter')
!
(reader addClassMethod: 'instance creation')
!
root: aFilename {Filename} formatter: aVWFormatter {Formatter} {^DiskClassWriter}
	^self new initializeRoot: aFilename formatter: aVWFormatter
!
