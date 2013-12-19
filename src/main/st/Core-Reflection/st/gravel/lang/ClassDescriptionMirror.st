(reader defineClass: 'ClassDescriptionMirror' superclass: 'st.gravel.lang.Mirror')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.support.jvm.ClassDescriptionMirror')
!
(reader addMethod: '')
!
= anObject
	<primitive: 'equals'>
	
!
(reader addMethod: 'gravel')
!
allSubclasses
	| coll |
	coll := OrderedCollection new.
	self allSubclassesDo: [:eachSubclass | coll add: eachSubclass].
	^coll
!
(reader addMethod: 'gravel')
!
allSubclassesDo: aBlock
	| subs |
	subs := self subclasses.
	subs do: 
			[:cl |
			aBlock value: cl.
			cl allSubclassesDo: aBlock]
!
(reader addMethod: 'gravel')
!
allSuperclasses
	| sc |
	sc := self superclass.
	sc isNil ifTrue: [^#()].
	^sc allSuperclasses copyWith: sc
!
(reader addMethod: '')
!
compile: code classified: heading
	<primitive: 'compile_classified_'>
	
!
(reader addMethod: '')
!
definitionSelectors
	<primitive: 'definitionSelectors'>
	
!
(reader addMethod: '')
!
flattenedSelectors
	<primitive: 'flattenedSelectors'>
	
!
(reader addMethod: '')
!
includesBehavior: aClassOrClassMirror
	<primitive: 'includesBehavior_'>
	
!
(reader addMethod: '')
!
instance
	<primitive: 'instance'>
	
!
(reader addMethod: '')
!
isTrait
	<primitive: 'isTrait'>
	
!
(reader addMethod: 'gravel')
!
methodAt: aSymbol ifAbsent: aBlock
	| m |
	m := self pvtMethodAt: aSymbol.
	m isNil ifTrue: [^aBlock value].
	^m
!
(reader addMethod: '')
!
packageName
	<primitive: 'packageName'>
	
!
(reader addMethod: '')
!
pvtMethodAt: aSymbol
	<primitive: 'getMethodMirror'>
	
!
(reader addMethod: 'gravel')
!
selectors
	^self definitionSelectors
!
(reader addMethod: '')
!
subclasses
	<primitive: 'subclasses'>
	
!
(reader addMethod: '')
!
superclass
	<primitive: 'superclass'>
	
!
(reader addMethod: 'gravel')
!
withAllSubclassesDo: aBlock
	aBlock value: self.
	self allSubclassesDo: aBlock
!
