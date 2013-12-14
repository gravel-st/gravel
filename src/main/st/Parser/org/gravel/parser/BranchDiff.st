(reader defineClass: 'BranchDiff' superclass: 'org.gravel.parser.AbstractClassDiff')
!
(reader addInstVar: 'root')
!
(reader addInstVar: 'children')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitBranchDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^children inject: (root applyOnSystemNode: aSystemNode)
		into: [:n {SystemNode} :e {Diff} | e applyOnSystemNode: n]
!
(reader addMethod: 'accessing')
!
children {^Arr[AbstractClassDiff]}
	^children
!
(reader addMethod: 'accessing')
!
classDiffsSize {^Int | Nil}
	^children inject: root classDiffsSize
		into: [:s {Int | Nil} :each {AbstractClassDiff} | s + each classDiffsSize]
!
(reader addMethod: 'initialize-release')
!
initializeRoot: anExtendClassDiff {NewClassDiff} children: anArray {Arr[AbstractClassDiff]} {^Self}
	root := anExtendClassDiff
				beStatic: (anArray anySatisfy: [:elem {AbstractClassDiff} | elem isStatic]).
	children := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependent: anAbstractClassDiff {AbstractClassDiff} {^Bool}
	^(root isPrereqOrDependent: anAbstractClassDiff) or: 
			[children
				anySatisfy: [:ch {AbstractClassDiff} | ch isPrereqOrDependent: anAbstractClassDiff]]
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^root notNil
		and: [root isStatic or: [children anySatisfy: [:elem {AbstractClassDiff} | elem isStatic]]]
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: 'root: (';
		nextPutAll: root printString;
		nextPutAll: ') children: (';
		nextPutAll: children printString;
		nextPutAll: ')'
!
(reader addMethod: 'As yet unclassified')
!
pvtSetChildren: anArray {Arr[AbstractClassDiff]} {^Self}
	isStatic := isStatic
				or: [anArray anySatisfy: [:elem {AbstractClassDiff} | elem isStatic]].
	root := root beStatic: isStatic.
	children := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetRoot: aRoot {NewClassDiff} {^Self}
	root := aRoot
!
(reader addMethod: 'accessing')
!
root {^NewClassDiff}
	^root
!
(reader addMethod: 'As yet unclassified')
!
withBranchDiff: aBranchDiff {BranchDiff} {^Diff}
	(self cachedIsPrereqOrDependent: aBranchDiff)
		ifFalse: [^ClassDiffs with: self with: aBranchDiff].
	aBranchDiff root classNode superclassReference = root reference
		ifTrue: [^self withSubclassDiff: aBranchDiff].
	root classNode superclassReference = aBranchDiff root reference
		ifTrue: [^aBranchDiff withSubclassDiff: self].
	^children inject: (root withDiff: aBranchDiff)
		into: [:s {Diff} :e {AbstractClassDiff} | s withDiff: e]
!
(reader addMethod: 'As yet unclassified')
!
withChildren: anArray {Arr[AbstractClassDiff]} {^BranchDiff}
	^self copy pvtSetChildren: anArray
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withBranchDiff: self
!
(reader addMethod: 'As yet unclassified')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^AbstractClassDiff}
	(self cachedIsPrereqOrDependent: aNewClassDiff)
		ifFalse: [^ClassDiffs with: self with: aNewClassDiff].
	aNewClassDiff classNode superclassReference = root reference
		ifTrue: [^self withSubclassDiff: aNewClassDiff].
	root classNode superclassReference = aNewClassDiff reference
		ifTrue: [^aNewClassDiff withSubclassDiff: self].
	^self
		withChildren: (children collect: 
					[:ch {AbstractClassDiff} |
					(ch isPrereqOrDependent: aNewClassDiff)
						ifTrue: [ch withNewClassDiff: aNewClassDiff]
						ifFalse: [ch]])
!
(reader addMethod: 'As yet unclassified')
!
withRoot: aRoot {NewClassDiff} {^BranchDiff}
	^self copy pvtSetRoot: aRoot
!
(reader addMethod: 'As yet unclassified')
!
withSubclassDiff: aClassDiff {AbstractClassDiff} {^BranchDiff}
	^self withChildren: (children copyWith: aClassDiff)
!
(reader addMethod: 'diff merging')
!
withUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Diff}
	root reference = anUpdateClassDiff reference
		ifTrue: [^self withRoot: (root withDiff: anUpdateClassDiff)].
	self halt
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[NewClassDiff, Array[AbstractClassDiff]]}
	^#('root' 'children')
!
(reader addClassMethod: 'instance creation')
!
root: anExtendClassDiff {NewClassDiff} children: anArray {Arr[AbstractClassDiff]} {^BranchDiff}
	^self new initializeRoot: anExtendClassDiff children: anArray
!
