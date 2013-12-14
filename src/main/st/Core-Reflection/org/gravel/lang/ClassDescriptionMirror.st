(reader defineClass: 'ClassDescriptionMirror' superclass: 'org.gravel.lang.Mirror')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.support.jvm.ClassDescriptionMirror')
!
(reader addMethod: 'gravel')
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
(reader addMethod: 'gravel')
!
compile: code classified: heading
	<primitive: 'compile_classified_'>
	
!
(reader addMethod: 'gravel')
!
definitionSelectors
	<primitive: 'definitionSelectors'>
	
!
(reader addMethod: 'gravel')
!
flattenedSelectors
	<primitive: 'flattenedSelectors'>
	
!
(reader addMethod: 'gravel')
!
includesBehavior: aClassOrClassMirror
	<primitive: 'includesBehavior_'>
	
!
(reader addMethod: 'gravel')
!
instance
	<primitive: 'instance'>
	
!
(reader addMethod: 'testing')
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
(reader addMethod: 'gravel')
!
packageName
	<primitive: 'packageName'>
	
!
(reader addMethod: 'gravel')
!
pvtMethodAt: aSymbol
	<primitive: 'getMethodMirror'>
	
!
(reader addMethod: 'gravel')
!
selectors
	^self definitionSelectors
!
(reader addMethod: 'gravel')
!
subclasses
	<primitive: 'subclasses'>
	
!
(reader addMethod: 'gravel')
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
