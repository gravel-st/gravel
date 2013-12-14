(reader defineClass: 'BrowserApplication' superclass: 'org.gravel.ui.Application')
!
(reader addInstVar: 'naam')
!
(reader addInstVar: 'selectedClass')
!
(reader addInstVar: 'selectedSelector')
!
(reader addInstVar: 'packageNames')
!
(reader addInstVar: 'selectedPackageName')
!
(reader addInstVar: 'selectedProtocol')
!
(reader addInstVar: 'rootClasses')
!
(reader addInstVar: 'isMeta')
!
(reader addInstVar: 'sourceHolder')
!
(reader addInstVar: 'transcript')
!
(reader addInstVar: 'evalHolder')
!
(reader addMethod: 'gravel')
!
accept
	| method |
	method := self currentClass compile: sourceHolder value
				classified: (selectedProtocol ifNil: ['gravel']).
	self browseSelector: method selector
!
(reader addMethod: 'gravel')
!
autocompleteTokens
	| s |
	s := Set new.
	Symbol allStrings do: [:each | s addAll: each keywords].
	^s asSortedCollection
!
(reader addMethod: 'gravel')
!
browseClass: aClassMirror
	selectedClass := aClassMirror.
	(self currentProtocols includes: selectedProtocol) ifFalse: [self browseProtocol: nil].
	self update
!
(reader addMethod: 'gravel')
!
browseMeta: aBoolean
	isMeta := aBoolean.
	self update
!
(reader addMethod: 'gravel')
!
browsePackage: aSymbol
	selectedPackageName := aSymbol.
	(self currentClasses includes: self currentClass) ifFalse: [self browseClass: nil].
	self update
!
(reader addMethod: 'gravel')
!
browseProtocol: aString
	selectedProtocol := aString.
	(self currentSelectors includes: selectedSelector) ifFalse: [self browseSelector: nil].
	self update
!
(reader addMethod: 'gravel')
!
browseSelector: aSymbol
	selectedSelector := aSymbol.
	self update
!
(reader addMethod: 'gravel')
!
cancel
	self update
!
(reader addMethod: 'gravel')
!
categoryString: aString
	aString isNil ifTrue: [^'--all--'].
	^aString
!
(reader addMethod: 'gravel')
!
classOrSubclassesIsInPackage: aClass
	^(self isInPackage: aClass)
		or: [aClass subclasses anySatisfy: [:cl | self classOrSubclassesIsInPackage: cl]]
!
(reader addMethod: 'gravel')
!
classString: aClass
	^isMeta ifTrue: [aClass meta name] ifFalse: [aClass name]
!
(reader addMethod: 'gravel')
!
currentClass
	selectedClass isNil ifTrue: [^nil].
	^isMeta ifTrue: [selectedClass meta] ifFalse: [selectedClass]
!
(reader addMethod: 'gravel')
!
currentClasses
	| set toAdd |
	set := Set new.
	toAdd := OrderedCollection new.
	toAdd addAll: rootClasses.
	[toAdd isEmpty] whileFalse: 
			[| each |
			each := toAdd removeFirst.
			set add: each.
			toAdd addAll: (each subclasses select: [:sc | self classOrSubclassesIsInPackage: sc])].
	^set
!
(reader addMethod: 'gravel')
!
currentProtocols
	| set |
	self currentClass isNil ifTrue: [^#()].
	set := Set new.
	self currentClass selectors do: [:sel | set add: (self protocolOf: sel)].
	^set asSortedCollection asArray copyWithFirst: nil
!
(reader addMethod: 'gravel')
!
currentSelectors
	self currentClass isNil ifTrue: [^#()].
	selectedProtocol isNil ifTrue: [^self currentClass flattenedSelectors asSortedCollection].
	^(self currentClass flattenedSelectors
		select: [:sel | (self protocolOf: sel) = selectedProtocol]) asSortedCollection
!
(reader addMethod: 'gravel')
!
debugTest: test
	self log: 'Debugging ' , test printString.
	test debug
!
(reader addMethod: 'gravel')
!
initialize
	| objectMirror |
	super initialize.
	objectMirror := (Reflection reflect: Object new) classMirror.
	rootClasses := Array with: objectMirror.
	packageNames := #().
	selectedClass := objectMirror.
	isMeta := false.
	sourceHolder := ValueHolder on: ''.
	evalHolder := ValueHolder on: ''.
	transcript := ''.
	Transcript addHandler: [:each | self log: each].
	self update
!
(reader addMethod: 'gravel')
!
isInHierarchySelection: aClassMirror
	selectedClass isNil ifTrue: [^true].
	selectedClass = aClassMirror ifTrue: [^true].
	^(selectedClass allSuperclasses includes: aClassMirror)
		or: [aClassMirror allSuperclasses includes: selectedClass]
!
(reader addMethod: 'gravel')
!
isInPackage: anObject
	^selectedPackageName isNil or: [anObject packageName = selectedPackageName]
!
(reader addMethod: 'gravel')
!
log: aString
	transcript := transcript , '
' , aString
!
(reader addMethod: 'gravel')
!
metaString: aBoolean
	^aBoolean ifTrue: ['Class'] ifFalse: ['Instance']
!
(reader addMethod: 'gravel')
!
methodAt: aSymbol ifAbsent: aBlock
	self currentClass isNil ifTrue: [^aBlock value].
	^self currentClass methodAt: aSymbol ifAbsent: aBlock
!
(reader addMethod: 'gravel')
!
methodIsInPackage: aSymbol
	self currentClass isNil ifTrue: [^false].
	^self isInPackage: (self methodAt: aSymbol ifAbsent: [^false])
!
(reader addMethod: 'gravel')
!
newTestSuite
	^selectedClass instance suite
!
(reader addMethod: 'accessing')
!
packageNames
	^packageNames
!
(reader addMethod: 'gravel')
!
printIndented: aString on: html
	^aString do: 
			[:ch |
			ch isLineBreak
				ifTrue: [html break]
				ifFalse: 
					[ch = Character tab
						ifTrue: 
							[html
								nbsp;
								nbsp;
								nbsp;
								nbsp]
						ifFalse: [html nextPut: ch]]]
!
(reader addMethod: 'gravel')
!
printIt
	| expr result |
	self log: 'Evaluating:'.
	self log: evalHolder value.
	
	[expr := Parser parseExpression: evalHolder value.
	self log: 'Expr: ' , expr prettySourceString]
			on: Error
			do: 
				[:ex |
				self log: 'Parse Error:' , ex printString.
				^self].
	
	[result := Interpreter visit: expr.
	self log: 'Result: ' , result printString] on: Error
			do: 
				[:ex |
				self log: 'Evaluation Error: ' , ex printString.
				^self]
!
(reader addMethod: 'gravel')
!
protocolOf: sel
	^(self methodAt: sel ifAbsent: [nil]) protocol ifNil: ['As yet unclassified']
!
(reader addMethod: 'gravel')
!
renderClassListOn: html
	self
		renderList: rootClasses , self traitsInCurrentPackage
		subElements: 
			[:each |
			(each subclasses
				select: [:sc | (self classOrSubclassesIsInPackage: sc) and: [self isInHierarchySelection: sc]])
					asSortedCollection: [:a :b | a name < b name]]
		do: 
			[:each |
			html if: (self isInPackage: each)
				bold: 
					[each = selectedClass
						ifTrue: [html text: (self classString: each)]
						ifFalse: [html link: (self classString: each) do: [self browseClass: each]]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderInnerList: elements subElements: seBlock do: aBlock indent: depth on: html
	elements do: 
			[:each |
			html listItem: 
					[depth timesRepeat: 
							[html
								nbsp;
								nbsp;
								nbsp;
								nbsp].
					aBlock value: each].
			self
				renderInnerList: (seBlock value: each)
				subElements: seBlock
				do: aBlock
				indent: depth + 1
				on: html]
!
(reader addMethod: 'gravel')
!
renderList: elements do: aBlock on: html
	self
		renderList: elements
		subElements: [:each | #()]
		do: aBlock
		on: html
!
(reader addMethod: 'gravel')
!
renderList: elements subElements: seBlock do: aBlock on: html
	html addClass: #column.
	html unorderedList: 
			[self
				renderInnerList: elements
				subElements: seBlock
				do: aBlock
				indent: 0
				on: html]
!
(reader addMethod: 'gravel')
!
renderMetaListOn: html
	self
		renderList: #(false true)
		do: 
			[:each |
			each = isMeta
				ifTrue: [html bold: [html text: (self metaString: each)]]
				ifFalse: [html link: (self metaString: each) do: [self browseMeta: each]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderOn: html
	self renderPackageListOn: html.
	self renderMetaListOn: html.
	self renderClassListOn: html.
	self renderProtocolListOn: html.
	self renderSelectorListOn: html.
	html break.
	self renderTestRunnerOn: html.
	html addClass: #source.
	html div: 
			[html link: 'Clear Transcript' do: [transcript := ''].
			self printIndented: transcript on: html.
			html
				codearea: evalHolder
				autocompleteTokens: self autocompleteTokens
				rows: 10
				cols: 200
				onAccept: [self printIt].
			html link: 'Print It' do: [self printIt].
			html
				codearea: sourceHolder
				autocompleteTokens: self autocompleteTokens
				rows: 40
				cols: 200
				onAccept: [self accept].
			html link: 'Accept' do: [self accept].
			html link: 'Cancel' do: [self cancel]]
!
(reader addMethod: 'gravel')
!
renderPackageListOn: html
	self
		renderList: packageNames
		do: 
			[:each |
			each = selectedPackageName
				ifTrue: [html bold: [html text: (self categoryString: each)]]
				ifFalse: [html link: (self categoryString: each) do: [self browsePackage: each]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderProtocolListOn: html
	self
		renderList: self currentProtocols
		do: 
			[:each |
			each = selectedProtocol
				ifTrue: [html text: (self categoryString: each)]
				ifFalse: [html link: (self categoryString: each) do: [self browseProtocol: each]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderSelectorListOn: html
	self
		renderList: self currentSelectors
		do: 
			[:each |
			| currentImpl label |
			currentImpl := self methodAt: each ifAbsent: [nil].
			label := currentImpl mclass = self currentClass
						ifTrue: [currentImpl selector]
						ifFalse: [currentImpl selector , ' (' , currentImpl mclass name , ')'].
			html if: (self isInPackage: currentImpl)
				bold: 
					[each = selectedSelector
						ifTrue: [html text: label]
						ifFalse: [html link: label do: [self browseSelector: each]]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderTestRunnerOn: html
	(selectedClass notNil and: [selectedClass includesBehavior: TestCase]) ifFalse: [^self].
	html div: 
			[| suite |
			html link: 'Run testcase' do: [self runTest].
			suite := self newTestSuite.
			suite allTestsDo: 
					[:each |
					html
						break;
						text: each printString;
						text: ' ['.
					html link: 'Run ' do: [self runTest: each].
					html text: ' | '.
					html link: 'Debug ' do: [self debugTest: each].
					html text: ']']].
	html break
!
(reader addMethod: 'gravel')
!
runTest
	| suite result |
	suite := self newTestSuite.
	self log: 'Running...'.
	result := suite run.
	self log: result printString
!
(reader addMethod: 'gravel')
!
runTest: test
	| result |
	self log: 'Running ' , test printString , '...'.
	result := test run.
	self log: result printString
!
(reader addMethod: 'gravel')
!
selectedPackage
	^Reflection packages detect: [:each | each name = selectedPackageName] ifNone: [nil]
!
(reader addMethod: 'gravel')
!
traitsInCurrentPackage
	^(self selectedPackage ifNil: [^#()]) definedTraits
!
(reader addMethod: 'gravel')
!
update
	| method objectMirror |
	objectMirror := (Reflection reflect: Object new) classMirror.
	rootClasses := Array with: objectMirror.
	packageNames := (Reflection packages collect: [:each | each name]) asSortedCollection
				asArray copyWithFirst: nil.
	method := self methodAt: selectedSelector ifAbsent: [nil].
	sourceHolder value: (method isNil
				ifTrue: 
					['message selector and argument names
	"comment stating purpose of message"

	| temporary variable names |
	statements']
				ifFalse: [method source])
!
(reader addClassMethod: 'gravel')
!
asServlet
	^ApplicationServlet applicationBuilder: [self new]
!
(reader addClassMethod: 'gravel')
!
css
	^super css
		, '
b {
	font-weight: bold;
}
.column {
	padding: 0;
	margin: 0;
	float: left;
	width: 20em;
	height: 25em;
	overflow-y: auto;
}
.source {
	position: absolute;
	float: left;
	top: 26em;
}
'
!
(reader addClassMethod: 'As yet unclassified')
!
cssLinks
	^#('../net/codemirror/addon/hint/show-hint.css' '../net/codemirror/lib/codemirror.css')
!
(reader addClassMethod: 'As yet unclassified')
!
scriptLinks
	^#('../net/codemirror/lib/codemirror.js' '../net/codemirror/mode/smalltalk/smalltalk.js' '../net/codemirror/addon/edit/matchbrackets.js' '../net/codemirror/addon/hint/show-hint.js')
!
