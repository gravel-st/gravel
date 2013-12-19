(reader defineClass: 'TestResource' superclass: 'st.gravel.sunit.TestAsserter')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'description')
!
(reader addClassInstVar: 'current')
!
(reader addMethod: 'gravel')
!
description
	description isNil ifTrue: [^''].
	^description
!
(reader addMethod: 'gravel')
!
description: aString
	description := aString
!
(reader addMethod: 'gravel')
!
initialize
	
!
(reader addMethod: 'gravel')
!
isAvailable
	^true
!
(reader addMethod: 'gravel')
!
name
	name isNil ifTrue: [^self printString].
	^name
!
(reader addMethod: 'gravel')
!
name: aString
	name := aString
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream nextPutAll: self class printString
!
(reader addMethod: 'gravel')
!
resources
	^self class resources
!
(reader addMethod: 'gravel')
!
setUp
	
!
(reader addMethod: 'gravel')
!
tearDown
	
!
(reader addClassMethod: 'gravel')
!
availableFor: aTestAsserter
	aTestAsserter assert: self isAvailable
		description: 'Unavailable resource ' , self name , ' requested by '
				, aTestAsserter printString
!
(reader addClassMethod: 'gravel')
!
current
	self assert: self isAvailable
		description: 'Sent #current to unavailable resource ' , self name
				, '.  Add the resource to the class-side #resources for the test case (recommended), or send #availableFor: beforehand'.
	^current
!
(reader addClassMethod: 'gravel')
!
isAlreadyAvailable
	^current class == self
!
(reader addClassMethod: 'gravel')
!
isAvailable
	current isNil ifTrue: [self makeAvailable].
	^self isAlreadyAvailable
!
(reader addClassMethod: 'gravel')
!
makeAvailable
	| candidate |
	current := false.
	candidate := self new.
	self resources do: [:each | each availableFor: candidate].
	
	[candidate setUp.
	candidate isAvailable ifTrue: [current := candidate]]
			sunitEnsure: [current == candidate ifFalse: [candidate tearDown]]
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
(reader addClassMethod: 'gravel')
!
reset
	[self isAlreadyAvailable ifTrue: [current tearDown]] sunitEnsure: [current := nil]
!
(reader addClassMethod: 'gravel')
!
resetOrAddResourcesTo: aCollection
	current isNil ifTrue: [^self].
	self isAlreadyAvailable
		ifFalse: 
			[self reset.
			self resources do: [:each | each resetOrAddResourcesTo: aCollection]]
		ifTrue: 
			[(aCollection includes: self)
				ifFalse: 
					[self resources do: [:each | each resetOrAddResourcesTo: aCollection].
					aCollection add: self]]
!
(reader addClassMethod: 'gravel')
!
resetResources: topLevelResources
	| availableResources |
	availableResources := OrderedCollection new: topLevelResources size.
	topLevelResources do: [:each | each resetOrAddResourcesTo: availableResources].
	availableResources reverseDo: [:each | each reset]
!
(reader addClassMethod: 'gravel')
!
resources
	^#()
!
