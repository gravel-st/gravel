(reader defineClass: 'SystemDiff' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'namespaces' type: 'Dictionary[Reference, NamespaceNode]')
!
(reader addInstVar: 'classDiffs' type: 'Array[ClassDiff]')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitSystemDiff: self
!
(reader addMethod: 'accessing')
!
classDiffs {^Arr[ClassDiff]}
	^classDiffs
!
(reader addMethod: 'initialize-release')
!
initializeClassDiffs: anOrderedCollection {Arr[ClassDiff]} namespaces: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	classDiffs := anOrderedCollection.
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
classDiffs: anArray {Arr[ClassDiff]} namespaces: aDictionary {Dict[Reference, NamespaceNode]} {^SystemDiff}
	^self new initializeClassDiffs: anArray namespaces: aDictionary
!
