(reader defineClass: 'TestSuite' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'tests')
!
(reader addInstVar: 'resources')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'gravel')
!
addDependentToHierachy: anObject
	self sunitAddDependent: anObject.
	self tests do: [:each | each addDependentToHierachy: anObject]
!
(reader addMethod: 'gravel')
!
addTest: aTest
	self tests add: aTest
!
(reader addMethod: 'gravel')
!
addTests: aCollection
	aCollection do: [:eachTest | self addTest: eachTest]
!
(reader addMethod: 'gravel')
!
allTestsDo: aBlock
	tests isNil ifTrue: [^self].
	tests do: [:each | each allTestsDo: aBlock]
!
(reader addMethod: 'gravel')
!
defaultResources
	^self tests inject: OrderedCollection new
		into: 
			[:coll :testCase |
			testCase resources do: [:each | (coll includes: each) ifFalse: [coll add: each]].
			coll]
!
(reader addMethod: 'gravel')
!
name
	^name
!
(reader addMethod: 'gravel')
!
name: aString
	name := aString
!
(reader addMethod: 'gravel')
!
removeDependentFromHierachy: anObject
	self sunitRemoveDependent: anObject.
	self tests do: [:each | each removeDependentFromHierachy: anObject]
!
(reader addMethod: 'gravel')
!
resources
	resources isNil ifTrue: [resources := self defaultResources].
	^resources
!
(reader addMethod: 'gravel')
!
resources: someOrderedTestResourceClasses
	resources := someOrderedTestResourceClasses
!
(reader addMethod: 'gravel')
!
run
	| result |
	result := TestResult new.
	[self run: result] sunitEnsure: [TestResource resetResources: self resources].
	^result
!
(reader addMethod: 'gravel')
!
run: aResult
	self tests do: 
			[:each |
			self sunitChanged: each.
			each run: aResult]
!
(reader addMethod: 'gravel')
!
tests
	tests isNil ifTrue: [tests := OrderedCollection new].
	^tests
!
(reader addClassMethod: 'gravel')
!
named: aString
	^(self new)
		name: aString;
		yourself
!
