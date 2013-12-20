(reader defineClass: 'HtmlTag' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'element')
!
(reader addInstVar: 'stream')
!
(reader addInstVar: 'callbackRegistry')
!
(reader addInstVar: 'classes')
!
(reader addInstVar: 'eventRegistry')
!
(reader addInstVar: 'attributes')
!
(reader addMethod: 'gravel')
!
addCallback: aBlock
	| callbackName |
	callbackName := Random nextUUIDString.
	callbackRegistry at: callbackName put: aBlock.
	^callbackName
!
(reader addMethod: 'gravel')
!
addClass: aClass
	classes := classes copyWith: aClass asString
!
(reader addMethod: 'gravel')
!
addClasses: anArray
	classes := classes copyWithAll: (anArray collect: [:each | each asString])
!
(reader addMethod: 'gravel')
!
addEvent: anArray
	eventRegistry add: anArray
!
(reader addMethod: 'gravel')
!
attributeAt: k put: v
	attributes at: k put: v
!
(reader addMethod: 'gravel')
!
bind: aBlock on: anEvent to: anId
	
!
(reader addMethod: 'gravel')
!
bindCallback: aBlock on: anEvent to: anId
	| name |
	name := self addCallback: aBlock.
	self addEvent: (Array with: anId with: anEvent with: name)
!
(reader addMethod: 'gravel')
!
body: aBlock
	self tag: #body do: aBlock
!
(reader addMethod: 'gravel')
!
bold: aBlock
	self tag: #b do: aBlock
!
(reader addMethod: 'gravel')
!
break
	^self tag: #br
!
(reader addMethod: 'gravel')
!
callbackRegistry
	^callbackRegistry
!
(reader addMethod: 'gravel')
!
div: aBlock
	self tag: #div do: aBlock
!
(reader addMethod: 'gravel')
!
eventRegistry
	^eventRegistry
!
(reader addMethod: 'gravel')
!
form: method action: action id: id do: aBlock
	self
		tag: #form
		attributes: ((Dictionary new)
				at: 'method' put: method;
				at: 'action' put: action;
				at: 'id' put: id;
				yourself)
		do: aBlock
!
(reader addMethod: 'gravel')
!
head: aBlock
	self tag: #head do: aBlock
!
(reader addMethod: 'gravel')
!
html: aBlock
	self tag: #html do: aBlock
!
(reader addMethod: 'gravel')
!
if: aBoolean bold: aBlock
	aBoolean ifTrue: [self tag: #b do: aBlock] ifFalse: [aBlock value]
!
(reader addMethod: 'gravel')
!
initializeStream: aStream callbackRegistry: aDictionary
	stream := aStream.
	callbackRegistry := aDictionary.
	eventRegistry := OrderedCollection new.
	classes := #().
	attributes := Dictionary new
!
(reader addMethod: 'gravel')
!
input: name type: type
	self
		tag: #input
		attributes: ((Dictionary new)
				at: 'name' put: name;
				at: 'type' put: type;
				yourself)
		do: []
!
(reader addMethod: 'gravel')
!
input: name type: type id: id
	self
		tag: #input
		attributes: ((Dictionary new)
				at: 'name' put: name;
				at: 'type' put: type;
				at: 'id' put: id;
				yourself)
		do: []
!
(reader addMethod: 'gravel')
!
input: name type: type id: id value: aValue
	self
		tag: #input
		attributes: ((Dictionary new)
				at: 'name' put: name;
				at: 'type' put: type;
				at: 'id' put: id;
				at: 'value' put: aValue;
				yourself)
		do: []
!
(reader addMethod: 'gravel')
!
italic: aBlock
	self tag: #i do: aBlock
!
(reader addMethod: 'gravel')
!
link: aString do: aBlock
	self
		tag: #a
		attributes: ((Dictionary new)
				at: 'href' put: 'javascript:click(' , (self addCallback: aBlock) printString , ');';
				yourself)
		do: [self text: aString]
!
(reader addMethod: 'gravel')
!
linkCss: url
	stream crlf.
	self tag: #link
		attributes: ((Dictionary new)
				at: 'rel' put: 'stylesheet';
				at: 'href' put: url;
				yourself)
!
(reader addMethod: 'gravel')
!
linkScript: url
	stream crlf.
	self
		tag: #script
		attributes: ((Dictionary new)
				at: 'src' put: url;
				yourself)
		do: [].
	stream crlf
!
(reader addMethod: 'gravel')
!
listItem: aBlock
	self tag: #li do: aBlock
!
(reader addMethod: 'gravel')
!
nbsp
	stream nextPutEscapedChar: Character nbsp
!
(reader addMethod: 'gravel')
!
nextPut: aCharacter
	stream nextPutEscapedChar: aCharacter
!
(reader addMethod: 'gravel')
!
onClick: aBlock
	| id |
	id := attributes at: 'id' ifAbsentPut: [Random nextUUIDString].
	self bindCallback: aBlock on: 'click' to: id
!
(reader addMethod: 'gravel')
!
script: aString
	stream crlf.
	self
		tag: #script
		attributes: ((Dictionary new)
				at: 'type' put: 'text/javascript';
				yourself)
		do: 
			[stream
				crlf;
				nextPutAll: aString;
				crlf].
	stream crlf
!
(reader addMethod: 'gravel')
!
section: aBlock
	self tag: #section do: aBlock
!
(reader addMethod: 'gravel')
!
span: aBlock
	self tag: #span do: aBlock
!
(reader addMethod: 'gravel')
!
style: aString
	self tag: #style
		do: 
			[stream
				crlf;
				nextPutAll: aString;
				crlf]
!
(reader addMethod: 'gravel')
!
tag: aString
	^self tag: aString do: nil
!
(reader addMethod: 'gravel')
!
tag: aString attributes: aDictionary
	self tag: aString attributes: aDictionary do: nil
!
(reader addMethod: 'gravel')
!
tag: aString attributes: aDictionary do: aBlock
	aDictionary keysAndValuesDo: [:k :v | self attributeAt: k put: v].
	self tag: aString do: aBlock
!
(reader addMethod: 'gravel')
!
tag: aString do: aBlock
	stream
		nextPut: $<;
		nextPutAll: aString;
		space.
	classes isEmpty
		ifFalse: 
			[stream nextPutAll: 'class="'.
			classes do: [:each | stream nextPutAll: each] separatedBy: [stream space].
			stream nextPutAll: '" '.
			classes := #()].
	attributes keysAndValuesDo: 
			[:k :v |
			stream
				nextPutAll: k;
				nextPutAll: '="';
				nextPutAll: v asString;
				nextPutAll: '" '].
	attributes := Dictionary new.
	aBlock isNil
		ifTrue: [stream nextPutAll: '/>']
		ifFalse: 
			[stream nextPut: $>.
			aBlock value.
			stream
				nextPutAll: '</';
				nextPutAll: aString;
				nextPut: $>]
!
(reader addMethod: 'gravel')
!
text: aString
	stream nextPutAllEscaped: aString
!
(reader addMethod: 'gravel')
!
textarea: aHolder
	self textarea: aHolder rows: 20 cols: 100
!
(reader addMethod: 'gravel')
!
textarea: aHolder rows: rows cols: cols
	self
		tag: #textarea
		attributes: ((Dictionary new)
				at: 'name' put: (self addCallback: aHolder);
				at: 'rows' put: rows;
				at: 'cols' put: cols;
				yourself)
		do: [self text: aHolder value]
!
(reader addMethod: 'gravel')
!
unorderedList: aBlock
	self tag: #ul do: aBlock
!
(reader addClassMethod: 'gravel')
!
on: aStream
	^self on: aStream callbackRegistry: Dictionary new
!
(reader addClassMethod: 'gravel')
!
on: aStream callbackRegistry: callbackRegistry
	^self new initializeStream: aStream callbackRegistry: callbackRegistry
!
