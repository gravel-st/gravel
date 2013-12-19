(reader defineClass: 'TestCase' superclass: 'st.gravel.sunit.TestAsserter')
!
(reader addInstVar: 'testSelector')
!
(reader addMethod: 'gravel')
!
addDependentToHierachy: anObject
	
!
(reader addMethod: 'gravel')
!
allTestsDo: aBlock
	aBlock value: self
!
(reader addMethod: 'gravel')
!
debug
	[(self class selector: testSelector) runCase]
		sunitEnsure: [TestResource resetResources: self resources]
!
(reader addMethod: 'gravel')
!
debugAsFailure
	| semaphore |
	semaphore := Semaphore new.
	
	[semaphore wait.
	TestResource resetResources: self resources] fork.
	(self class selector: testSelector) runCaseAsFailure: semaphore
!
(reader addMethod: 'gravel')
!
openDebuggerOnFailingTestMethod
	self
		halt;
		performTest
!
(reader addMethod: 'gravel')
!
performTest
	self perform: testSelector sunitAsSymbol
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream
		nextPutAll: self class printString;
		nextPutAll: '>>#';
		nextPutAll: testSelector
!
(reader addMethod: 'gravel')
!
removeDependentFromHierachy: anObject
	
!
(reader addMethod: 'gravel')
!
resources
	^self class resources
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
	aResult runCase: self
!
(reader addMethod: 'gravel')
!
runCase
	self resources do: [:each | each availableFor: self].
	
	[self setUp.
	self performTest] sunitEnsure: [self tearDown]
!
(reader addMethod: 'gravel')
!
runCaseAsFailure: aSemaphore
	
	[self resources do: [:each | each availableFor: self].
	
	[self setUp.
	self openDebuggerOnFailingTestMethod] sunitEnsure: [self tearDown]]
			sunitEnsure: [aSemaphore signal]
!
(reader addMethod: 'gravel')
!
selector
	^testSelector
!
(reader addMethod: 'gravel')
!
setTestSelector: aSymbol
	testSelector := aSymbol
!
(reader addMethod: 'gravel')
!
setUp
	
!
(reader addMethod: 'gravel')
!
should: aBlock
	self assert: aBlock value
!
(reader addMethod: 'gravel')
!
should: aBlock description: aString
	self assert: aBlock value description: aString
!
(reader addMethod: 'gravel')
!
shouldnt: aBlock
	self deny: aBlock value
!
(reader addMethod: 'gravel')
!
shouldnt: aBlock description: aString
	self deny: aBlock value description: aString
!
(reader addMethod: 'gravel')
!
signalFailure: aString
	TestResult failure sunitSignalWith: aString
!
(reader addMethod: 'gravel')
!
tearDown
	
!
(reader addClassMethod: 'gravel')
!
allTestSelectors
	| answer pivotClass lookupRoot |
	answer := Set withAll: self testSelectors.
	self shouldInheritSelectors
		ifTrue: 
			[pivotClass := self.
			lookupRoot := self lookupHierarchyRoot.
			[pivotClass == lookupRoot] whileFalse: 
					[pivotClass := pivotClass sunitSuperclass.
					answer addAll: pivotClass testSelectors]].
	^answer asSortedCollection asOrderedCollection
!
(reader addClassMethod: 'gravel')
!
buildSuite
	| suite |
	^self isAbstract
		ifTrue: 
			[suite := self suiteClass named: self name asString.
			self sunitAllSubclasses
				do: [:each | each isAbstract ifFalse: [suite addTest: each buildSuiteFromSelectors]].
			suite]
		ifFalse: [self buildSuiteFromSelectors]
!
(reader addClassMethod: 'gravel')
!
buildSuiteFromMethods: testMethods
	^testMethods inject: (self suiteClass named: self sunitName asString)
		into: 
			[:suite :selector |
			suite
				addTest: (self selector: selector);
				yourself]
!
(reader addClassMethod: 'gravel')
!
buildSuiteFromSelectors
	^self buildSuiteFromMethods: self allTestSelectors
!
(reader addClassMethod: 'gravel')
!
debug: aSymbol
	^(self selector: aSymbol) debug
!
(reader addClassMethod: 'gravel')
!
isAbstract
	^self sunitName = #TestCase
!
(reader addClassMethod: 'gravel')
!
lookupHierarchyRoot
	^TestCase
!
(reader addClassMethod: 'gravel')
!
resources
	^#()
!
(reader addClassMethod: 'gravel')
!
run: aSymbol
	^(self selector: aSymbol) run
!
(reader addClassMethod: 'gravel')
!
selector: aSymbol
	^self new setTestSelector: aSymbol
!
(reader addClassMethod: 'gravel')
!
shouldInheritSelectors
	^self ~~ self lookupHierarchyRoot
		and: [self sunitSuperclass isAbstract or: [self testSelectors isEmpty]]
!
(reader addClassMethod: 'gravel')
!
suite
	^self buildSuite
!
(reader addClassMethod: 'gravel')
!
suiteClass
	^TestSuite
!
(reader addClassMethod: 'gravel')
!
sunitVersion
	^'4.0'
!
(reader addClassMethod: 'gravel')
!
testSelectors
	^self sunitSelectors select: [:each | 'test*' sunitMatch: each]
!
