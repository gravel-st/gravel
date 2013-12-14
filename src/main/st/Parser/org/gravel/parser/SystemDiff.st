(reader defineClass: 'SystemDiff' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'diff')
!
(reader addInstVar: 'namespaces')
!
(reader addMethod: 'accessing')
!
diff {^Diff}
	^diff
!
(reader addMethod: 'initialize-release')
!
initializeDiff: aClassDiffs {Diff} namespaces: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	diff := aClassDiffs.
	namespaces := aDictionary.
	self initialize
!
(reader addMethod: 'accessing')
!
namespaces {^Dict[Reference, NamespaceNode]}
	^namespaces
!
(reader addClassMethod: 'instance creation')
!
diff: aClassDiffs {Diff} namespaces: namespaces {Dict[Reference, NamespaceNode]} {^SystemDiff}
	^self new initializeDiff: aClassDiffs namespaces: namespaces
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Diff, Dict[Reference, NamespaceNode]]}
	^#('diff' 'namespaces')
!
