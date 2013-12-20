(reader defineClass: 'BrowserApplication' superclass: 'st.gravel.ui.Application')
!
(reader addInstVar: 'naam')
!
(reader addInstVar: 'selectedClassMirror')
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
(reader addInstVar: 'toolsActive')
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
	selectedClassMirror := aClassMirror.
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
clearTranscript
	^transcript := ''
!
(reader addMethod: 'gravel')
!
currentClass
	selectedClassMirror isNil ifTrue: [^nil].
	^isMeta ifTrue: [selectedClassMirror meta] ifFalse: [selectedClassMirror]
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
	selectedClassMirror := objectMirror.
	isMeta := false.
	sourceHolder := ValueHolder on: ''.
	evalHolder := ValueHolder on: ''.
	transcript := ''.
	toolsActive := false.
	Transcript addHandler: [:each | self log: each].
	self update
!
(reader addMethod: 'gravel')
!
isInHierarchySelection: aClassMirror
	selectedClassMirror isNil ifTrue: [^true].
	selectedClassMirror = aClassMirror ifTrue: [^true].
	^(selectedClassMirror allSuperclasses includes: aClassMirror)
		or: [aClassMirror allSuperclasses includes: selectedClassMirror]
!
(reader addMethod: 'gravel')
!
isInPackage: anObject
	^selectedPackageName isNil or: [anObject packageName = selectedPackageName]
!
(reader addMethod: 'gravel')
!
isTestClassSelected
	^selectedClassMirror notNil and: [selectedClassMirror includesBehavior: TestCase]
!
(reader addMethod: 'gravel')
!
isToolPanelActive
	^toolsActive
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
	^selectedClassMirror instance suite
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
	html addClasses: #(#ui #segment).
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
					[each = selectedClassMirror
						ifTrue: [html text: (self classString: each)]
						ifFalse: [html link: (self classString: each) do: [self browseClass: each]]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderEditorOn: html
	html
		addClass: #source;
		section: 
				[html
					addClasses: #(#ui #menu);
					div: 
							[html
								addClass: ' item';
								div: [html text: 'Editor'].
							html
								addClasses: #(#menu #right);
								div: 
										[html
											addClass: 'item';
											div: 
													[html
														addClass: 'ui primary button';
														onClick: [self accept];
														div: [html text: 'Accept']].
										html
											addClass: 'item';
											div: 
													[html
														addClass: 'ui button';
														onClick: [self cancel];
														div: [html text: 'Cancel']]]].
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
	html addClasses: #(#ui #segment).
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
renderMainMenuOn: html
	html
		addClasses: #(#ui #fixed #transparent #inverted #main #menu);
		div: 
				[html
					addClasses: #(#title #item);
					div: 
							[html
								bold: [html text: 'Gravel'];
								text: 'IDE']]
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
	self renderMainMenuOn: html.
	html tag: 'header'
		do: 
			[html
				tag: 'table'
				attributes: ((Dictionary new)
						at: 'width' put: '100%';
						yourself)
				do: 
					[html tag: 'tr'
						do: 
							[html
								addClass: #column;
								tag: 'td' do: [self renderPackageListOn: html].
							html
								addClass: #column;
								tag: 'td' do: [self renderMetaListOn: html].
							html
								addClass: #column;
								tag: 'td' do: [self renderClassListOn: html].
							html
								addClass: #column;
								tag: 'td' do: [self renderProtocolListOn: html].
							html
								addClass: #column;
								tag: 'td' do: [self renderSelectorListOn: html]]]].
	self renderEditorOn: html.
	self renderToolsOn: html
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
	| testSelectors |
	testSelectors := self isTestClassSelected
				ifTrue: [selectedClassMirror instance testSelectors]
				ifFalse: [#()].
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
						ifFalse: [html link: label do: [self browseSelector: each]]].
			(testSelectors includes: each)
				ifTrue: 
					[html
						attributeAt: 'style' put: 'float: right;';
						link: 'Run Test' do: [self runTestSelector: each]]]
		on: html
!
(reader addMethod: 'gravel')
!
renderTestRunnerOn: html
	self isTestClassSelected ifFalse: [^self].
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
renderToolsOn: html
	self isToolPanelActive ifTrue: [html addClass: 'active'].
	html
		addClasses: #(#tools #ui #bottom #sidebar);
		section: 
				[html
					addClasses: #(#ui #black #launch #top #tiny #attached #button);
					onClick: [self toggleToolPanel];
					div: 
							[html
								addClasses: (#(#arrow #sign #icon)
											copyWith: (self isToolPanelActive ifTrue: [#down] ifFalse: [#up]));
								italic: [];
								span: [html text: 'Tools']].
				html
					addClasses: #(#ui #grid);
					div: 
							[html
								addClasses: #(#eight #wide #middle #column);
								div: 
										[html
											addClasses: #(#ui #inverted #menu);
											div: 
													[html
														addClasses: #(#ui #header #item);
														div: [html text: 'Workspace'].
													html
														addClasses: #(#ui #item);
														link: 'Print it' do: [self printIt]].
										html
											codearea: evalHolder
											autocompleteTokens: self autocompleteTokens
											rows: 10
											cols: 200
											onAccept: [self printIt]].
							html
								addClasses: #(#eight #wide #middle #column);
								div: 
										[html
											addClasses: #(#ui #inverted #menu);
											div: 
													[html
														addClasses: #(#ui #header #item);
														div: [html text: 'Transcript'].
													html
														addClasses: #(#ui #item);
														link: 'Clear Transcript' do: [self clearTranscript]].
										html
											addClass: #transcript;
											div: [self printIndented: transcript on: html]]]]
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
runTestSelector: aSymbol
	| result |
	toolsActive := true.
	result := selectedClassMirror instance run: aSymbol.
	self log: result printString
!
(reader addMethod: 'gravel')
!
selectedPackage
	^Reflection packages detect: [:each | each name = selectedPackageName] ifNone: [nil]
!
(reader addMethod: 'gravel')
!
toggleToolPanel
	toolsActive := toolsActive not
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
body {
	font-family: ''Source Sans Pro'', sans-serif;
	font-size: 12px;
}
b {
	font-weight: bold;
}

header .column {
	padding: 0;
	margin: 0;
	vertical-align: top;
}

header .column > ul {
	overflow-y: auto;
	list-style-type: none;
	height: 25em;
}

.source {
	
}
'
!
(reader addClassMethod: 'As yet unclassified')
!
cssLinks
	^#('http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' '../gravel/base.css' '../net/codemirror/addon/hint/show-hint.css' '../net/codemirror/lib/codemirror.css' '../semantic/packaged/css/semantic.css')
!
(reader addClassMethod: 'As yet unclassified')
!
scriptLinks
	^#('http://code.jquery.com/jquery-2.0.3.min.js' '../gravel/js/gravel.js' '../net/codemirror/lib/codemirror.js' '../net/codemirror/mode/smalltalk/smalltalk.js' '../net/codemirror/addon/edit/matchbrackets.js' '../net/codemirror/addon/hint/show-hint.js')
!
