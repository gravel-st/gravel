(reader defineClass: 'NamespaceNode' superclass: 'org.gravel.parser.Node')
!
(reader addInstVar: 'reference')
!
(reader addInstVar: 'publicImports')
!
(reader addInstVar: 'privateImports')
!
(reader addInstVar: 'sharedVariables')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self == anObject or: 
			[self class = anObject class and: 
					[reference = anObject reference
						and: [publicImports = anObject publicImports and: [privateImports = anObject privateImports]]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNamespaceNode: self
!
(reader addMethod: 'As yet unclassified')
!
allImportsIn: aSystemNode {SystemNode} do: aBlock {[NamespaceNode, ^Object]} {^Self}
	| aSet {Set[AbsoluteReference]} |
	aSet := Set new.
	aSet add: reference.
	aBlock value: self.
	self
		allImportsIn: aSystemNode
		private: true
		except: aSet
		do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
allImportsIn: aSystemNode {SystemNode} private: aBoolean {Bool} except: aSet {Set[AbsoluteReference]} do: aBlock {[NamespaceNode, ^Object]} {^Self}
	self importReferences: aBoolean
		do: 
			[:each {AbsoluteReference} |
			(aSet includes: each)
				ifFalse: 
					[| ns {NamespaceNode} |
					aSet add: each.
					ns := aSystemNode namespaceNodeAt: each.
					aBlock value: ns.
					ns
						allImportsIn: aSystemNode
						private: false
						except: aSet
						do: aBlock]]
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^((self class hash bitXor: reference hash) bitXor: publicImports hash)
		bitXor: privateImports hash
!
(reader addMethod: 'As yet unclassified')
!
importReferences: private {Bool} do: aBlock {[AbsoluteReference, ^Object]} {^Self}
	publicImports do: aBlock.
	private ifTrue: [privateImports do: aBlock]
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {AbsoluteReference} publicImports: anArray {Arr[AbsoluteReference]} privateImports: anArray2 {Arr[AbsoluteReference]} sharedVariables: anArray3 {Arr[SharedDeclarationNode]} {^Self}
	reference := anAbsoluteReference.
	publicImports := anArray.
	privateImports := anArray2.
	sharedVariables := anArray3.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
mergeWith: aNamespaceNode {NamespaceNode} {^Self}
	| nPublic {OrdColl[AbsoluteReference]} nPrivate {OrdColl[AbsoluteReference]} nSharedVariables {Dict[Str, SharedDeclarationNode]} |
	nPublic := OrderedCollection new.
	nPrivate := OrderedCollection new.
	nSharedVariables := Dictionary new.
	aNamespaceNode publicImports
		do: [:each {AbsoluteReference} | (nPublic includes: each) ifFalse: [nPublic add: each]].
	publicImports
		do: [:each {AbsoluteReference} | (nPublic includes: each) ifFalse: [nPublic add: each]].
	aNamespaceNode privateImports
		do: [:each {AbsoluteReference} | ((nPublic includes: each) or: [nPrivate includes: each]) ifFalse: [nPrivate add: each]].
	privateImports
		do: [:each {AbsoluteReference} | ((nPublic includes: each) or: [nPrivate includes: each]) ifFalse: [nPrivate add: each]].
	sharedVariables
		do: [:each {SharedDeclarationNode} | nSharedVariables at: each name put: each].
	aNamespaceNode sharedVariables
		do: [:each {SharedDeclarationNode} | nSharedVariables at: each name put: each].
	^self
		withPrivateImports: nPrivate asArray
		publicImports: nPublic asArray
		sharedVariables: nSharedVariables asArray
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
privateImports {^Arr[AbsoluteReference]}
	^privateImports
!
(reader addMethod: 'accessing')
!
publicImports {^Arr[AbsoluteReference]}
	^publicImports
!
(reader addMethod: 'As yet unclassified')
!
pvtSetPrivateImports: privateArray {Arr[AbsoluteReference]} {^Self}
	privateImports := privateArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetPublicImports: publicArray {Arr[AbsoluteReference]} {^Self}
	publicImports := publicArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetSharedVariables: anArray {Arr[SharedDeclarationNode]} {^Self}
	sharedVariables := anArray
!
(reader addMethod: 'accessing')
!
reference {^AbsoluteReference}
	^reference
!
(reader addMethod: 'As yet unclassified')
!
sharedVariableAt: aName {Str} ifAbsent: aBlock {[^SharedDeclarationNode]} {^SharedDeclarationNode}
	^sharedVariables detect: [:each {SharedDeclarationNode} | each name = aName]
		ifNone: aBlock
!
(reader addMethod: 'accessing')
!
sharedVariables {^Arr[SharedDeclarationNode]}
	^sharedVariables
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: reference printString
!
(reader addMethod: 'As yet unclassified')
!
withPrivateImports: privateArray {Arr[AbsoluteReference]} publicImports: publicArray {Arr[AbsoluteReference]} sharedVariables: sharedVariablesArray {Arr[SharedDeclarationNode]} {^NamespaceNode}
	| cp {NamespaceNode} |
	cp := self copy.
	cp pvtSetPrivateImports: privateArray.
	cp pvtSetPublicImports: publicArray.
	cp pvtSetSharedVariables: sharedVariablesArray.
	^cp
!
(reader addMethod: 'As yet unclassified')
!
withSharedVariable: aSharedDeclarationNode {SharedDeclarationNode} {^Self}
	^self copy pvtSetSharedVariables: (sharedVariables copyWith: aSharedDeclarationNode)
!
(reader addClassMethod: 'instance creation')
!
for: aReference {Reference} {^NamespaceNode}
	| orgGravelLang {AbsoluteReference} |
	orgGravelLang := AbsoluteReference path: #(#org #gravel #lang).
	aReference = orgGravelLang ifTrue: [^NamespaceNode reference: aReference].
	^NamespaceNode
		reference: aReference
		publicImports: #()
		privateImports: (Array with: orgGravelLang)
		sharedVariables: #()
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[AbsoluteReference, Arr[AbsoluteReference], Arr[AbsoluteReference], Arr[SharedDeclarationNode]]}
	^#('reference' 'publicImports' 'privateImports' 'sharedVariables')
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {AbsoluteReference} {^NamespaceNode}
	^self
		reference: anAbsoluteReference
		publicImports: #()
		privateImports: #()
		sharedVariables: #()
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {AbsoluteReference} publicImports: anArray {Arr[AbsoluteReference]} privateImports: anArray2 {Arr[AbsoluteReference]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} {^NamespaceNode}
	^self new
		initializeReference: anAbsoluteReference
		publicImports: anArray
		privateImports: anArray2
		sharedVariables: sharedVariables
!
