(reader defineClass: 'ClassMapping' superclass: 'org.gravel.support.compiler.ast.AbstractMapping')
!
(reader addInstVar: 'identityMapping')
!
(reader addInstVar: 'extensions')
!
(reader addInstVar: 'instVarMappings')
!
(reader addInstVar: 'classNode')
!
(reader addMethod: 'As yet unclassified')
!
allInstVarsIn: aSystemMapping {SystemMapping} {^Arr[BoundVariableDeclarationNode]}
	| arr {Arr[BoundVariableDeclarationNode]} scm {ClassMapping | Nil} |
	arr := self boundInstVars.
	scm := self superclassMappingIn: aSystemMapping.
	scm isNil ifFalse: [^arr copyWithAll: (scm allInstVarsIn: aSystemMapping)].
	^arr
!
(reader addMethod: 'As yet unclassified')
!
allSelectorsIn: aSystemMapping {SystemMapping} {^Set[Sym]}
	| set {Set[Sym]} scm {ClassMapping | Nil} |
	set := Set new.
	set addAll: self selectors.
	scm := self superclassMappingIn: aSystemMapping.
	scm isNil ifFalse: [set addAll: (scm allSelectorsIn: aSystemMapping)].
	^set
!
(reader addMethod: 'As yet unclassified')
!
boundInstVars {^Arr[BoundVariableDeclarationNode]}
	^classNode boundInstVars
!
(reader addMethod: 'accessing')
!
classNode {^ClassDescriptionNode}
	^classNode
!
(reader addMethod: 'As yet unclassified')
!
extensionMethodMappingAt: aSymbol {Sym} ifAbsent: aBlock {[^AbstractMethodMapping]} {^AbstractMethodMapping}
	extensions do: 
			[:ex {ExtensionClassPartMapping} |
			| m {AbstractMethodMapping} |
			m := ex methodMappingAt: aSymbol ifAbsent: [nil].
			m isNil ifFalse: [^m]].
	^aBlock value
!
(reader addMethod: 'accessing')
!
extensions {^Arr[ExtensionClassPartMapping]}
	^extensions
!
(reader addMethod: 'As yet unclassified')
!
generatedJavaClassesDo: aBlock {[JavaClass, ^Object]} {^Self}
	identityMapping isGenerated ifTrue: [aBlock value: identityMapping javaClass].
	extensions
		do: [:each {ExtensionClassPartMapping} | each isGenerated ifTrue: [aBlock value: each javaClass]]
!
(reader addMethod: 'As yet unclassified')
!
identityClass {^JavaClass}
	^identityMapping javaClass
!
(reader addMethod: 'accessing')
!
identityMapping {^IdentityClassPartMapping}
	^identityMapping
!
(reader addMethod: 'initialize-release')
!
initializeIdentityMapping: anIdentityClassPartMapping {IdentityClassPartMapping} extensions: anArray {Arr[ExtensionClassPartMapping]} instVarMappings: aDictionary {Dict[Str, InstVarMapping]} classNode: aClassNode {ClassDescriptionNode} {^Self}
	identityMapping := anIdentityClassPartMapping.
	extensions := anArray.
	instVarMappings := aDictionary.
	classNode := aClassNode.
	self initialize
!
(reader addMethod: 'accessing')
!
instVarMappings {^Dict[Str, InstVarMapping]}
	^instVarMappings
!
(reader addMethod: 'As yet unclassified')
!
instVars {^Arr[VariableDeclarationNode]}
	^classNode instVars
!
(reader addMethod: 'As yet unclassified')
!
javaClassesDo: aBlock {[JavaClass, ^Object]} {^Self}
	aBlock value: identityMapping javaClass.
	extensions do: [:each {ExtensionClassPartMapping} | aBlock value: each javaClass]
!
(reader addMethod: 'As yet unclassified')
!
methodMappingAt: aSymbol {Sym} ifAbsent: aBlock {[^AbstractMethodMapping]} {^AbstractMethodMapping}
	^identityMapping methodMappingAt: aSymbol
		ifAbsent: [self extensionMethodMappingAt: aSymbol ifAbsent: aBlock]
!
(reader addMethod: 'As yet unclassified')
!
pvtSetClassNode: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	classNode := aClassDescriptionNode
!
(reader addMethod: 'As yet unclassified')
!
pvtSetExtensions: anArray {Arr[ExtensionClassPartMapping]} {^Self}
	extensions := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetIdentityMapping: anObject {IdentityClassPartMapping} {^Self}
	identityMapping := anObject
!
(reader addMethod: 'accessing')
!
reference {^Reference}
	^classNode reference
!
(reader addMethod: 'As yet unclassified')
!
selectors {^Set[Sym]}
	| set {Set[Sym]} |
	set := Set new.
	classNode methods do: [:each {MethodNode} | set add: each selector asSymbol].
	^set
!
(reader addMethod: 'As yet unclassified')
!
superclassMappingIn: aSystemMapping {SystemMapping} {^ClassMapping | Nil}
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
(reader addMethod: 'accessing')
!
superclassReferenceForMethodLookup {^Reference}
	^classNode superclassReferenceForMethodLookup
!
(reader addMethod: 'As yet unclassified')
!
withClassNode: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	^self copy pvtSetClassNode: aClassDescriptionNode
!
(reader addMethod: 'As yet unclassified')
!
withExtension: anExtensionClassPartMapping {ExtensionClassPartMapping} {^Self}
	^self withExtensions: (extensions copyWith: anExtensionClassPartMapping)
!
(reader addMethod: 'As yet unclassified')
!
withExtensions: anArray {Arr[ExtensionClassPartMapping]} {^Self}
	^self copy pvtSetExtensions: anArray
!
(reader addMethod: 'As yet unclassified')
!
withoutMethodMapping: aSelector {Str} {^Self}
	^(self copy)
		pvtSetIdentityMapping: (identityMapping withoutMethodMapping: aSelector);
		pvtSetExtensions: (extensions
					collect: [:each {ExtensionClassPartMapping} | each withoutMethodMapping: aSelector])
!
(reader addClassMethod: 'instance creation')
!
identityMapping: anIdentityClassPartMapping {IdentityClassPartMapping} extensions: anArray {Arr[ExtensionClassPartMapping]} instVarMappings: aDictionary {Dict[Str, InstVarMapping]} classNode: aClassNode {ClassDescriptionNode} {^Instance}
	^self new
		initializeIdentityMapping: anIdentityClassPartMapping
		extensions: anArray
		instVarMappings: aDictionary
		classNode: aClassNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[IdentityClassPartMapping, Arr[ExtensionClassPartMapping], Dict[Str, InstVarMapping], ClassDescriptionNode]}
	^#('identityMapping' 'extensions' 'instVarMappings' 'classNode')
!
