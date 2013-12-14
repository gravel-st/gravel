(reader defineClass: 'ClassDiffs' superclass: 'org.gravel.parser.AbstractClassDiff')
!
(reader addInstVar: 'classDiffs')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitClassDiffs: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^classDiffs inject: aSystemNode
		into: [:n {SystemNode} :e {AbstractClassDiff} | e applyOnSystemNode: n]
!
(reader addMethod: 'accessing')
!
classDiffs {^Arr[AbstractClassDiff]}
	^classDiffs
!
(reader addMethod: 'accessing')
!
classDiffsSize {^Int | Nil}
	^classDiffs inject: 0
		into: [:s {Int | Nil} :each {AbstractClassDiff} | s + each classDiffsSize]
!
(reader addMethod: 'initialize-release')
!
initializeClassDiffs: anArray {Arr[AbstractClassDiff]} {^Self}
	classDiffs := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isPrereqOrDependent: anAbstractClassDiff {AbstractClassDiff} {^Bool}
	^classDiffs
		anySatisfy: [:cd {AbstractClassDiff} | cd isPrereqOrDependent: anAbstractClassDiff]
!
(reader addMethod: 'printing')
!
printDescriptionOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: classDiffs printString
!
(reader addMethod: 'As yet unclassified')
!
withAbstractClassDiff: anAbstractClassDiff {AbstractClassDiff} {^Diff}
	| pod {Arr[AbstractClassDiff]} n {Diff} nopod {Arr[AbstractClassDiff]} |
	pod := classDiffs
				select: [:e {AbstractClassDiff} | e cachedIsPrereqOrDependent: anAbstractClassDiff].
	pod isEmpty ifTrue: [^self class classDiffs: (classDiffs copyWith: anAbstractClassDiff)].
	nopod := classDiffs
				reject: [:e {AbstractClassDiff} | e cachedIsPrereqOrDependent: anAbstractClassDiff].
	self assert: pod size + nopod size = classDiffs size.
	n := pod inject: anAbstractClassDiff
				into: [:s {Diff} :e {AbstractClassDiff} | s withDiff: e].
	^nopod inject: n into: [:s {Diff} :e {AbstractClassDiff} | s withDiff: e]
!
(reader addMethod: 'As yet unclassified')
!
withBranchDiff: aBranchDiff {BranchDiff} {^Diff}
	^classDiffs inject: aBranchDiff
		into: [:s {BranchDiff} :e {AbstractClassDiff} | s withDiff: e]
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withClassDiffs: self
!
(reader addMethod: 'As yet unclassified')
!
withNewClassDiff: aNewClassDiff {NewClassDiff} {^AbstractClassDiff}
	^self withAbstractClassDiff: aNewClassDiff
!
(reader addClassMethod: 'instance creation')
!
classDiffs: anArray {Arr[AbstractClassDiff]} {^Diff}
	anArray size = 1 ifTrue: [^anArray first].
	^self new initializeClassDiffs: anArray
!
(reader addClassMethod: 'instance creation')
!
empty {^Diff}
	^self classDiffs: #()
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[AbstractClassDiff]]}
	^#('classDiffs')
!
(reader addClassMethod: 'As yet unclassified')
!
with: aClassDiff1 {AbstractClassDiff} with: aClassDiff2 {AbstractClassDiff} {^Diff}
	^self classDiffs: (Array with: aClassDiff1 with: aClassDiff2)
!
