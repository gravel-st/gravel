(reader defineClass: 'ApplicationSession' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'application')
!
(reader addInstVar: 'callbackRegistry')
!
(reader addInstVar: 'sessionID')
!
(reader addMethod: 'gravel')
!
accept: visitor
	^visitor visitApplicationState: self
!
(reader addMethod: 'gravel')
!
application
	^application
!
(reader addMethod: 'gravel')
!
callbackRegistry
	^callbackRegistry
!
(reader addMethod: 'gravel')
!
initializeSessionID: aString application: anApplication callbackRegistry: aDictionary
	sessionID := aString.
	application := anApplication.
	callbackRegistry := aDictionary.
	self initialize
!
(reader addMethod: 'gravel')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream
		nextPutAll: 'sessionID: ';
		print: sessionID.
	aStream nextPut: $]
!
(reader addMethod: 'gravel')
!
processCallback: callbackID
	(callbackRegistry at: callbackID ifAbsent: [^nil]) value
!
(reader addMethod: 'gravel')
!
processRequest: aRequest
	| callbackID |
	aRequest parameterNames do: 
			[:each |
			(callbackRegistry includesKey: each)
				ifTrue: [(callbackRegistry at: each) value: (aRequest parameterAt: each)]].
	callbackID := aRequest parameterAt: 'callbackID'.
	self processCallback: callbackID
!
(reader addMethod: 'gravel')
!
sessionID
	^sessionID
!
(reader addMethod: 'gravel')
!
writeResponseOn: aStream
	| html |
	aStream
		nextPutAll: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'.
	html := HtmlTag on: aStream.
	html html: 
			[html head: 
					[| css |
					css := application class css.
					css isNil ifFalse: [html style: css].
					application class cssLinks do: [:each | html linkCss: each].
					application class scriptLinks do: [:each | html linkScript: each]].
			html body: 
					[html
						form: 'post'
						action: 'process?sessionID=' , sessionID
						id: 'processForm'
						do: 
							[html input: 'callbackID' type: 'hidden' id: 'callbackField'.
							callbackRegistry := html callbackRegistry.
							application renderOn: html.
							html script: 'Gravel = { Events: ' , html eventRegistry asArray asJSON , ' };']]]
!
(reader addMethod: 'gravel')
!
writeResponseString
	| writeStream |
	writeStream := WriteStream on: String new.
	self writeResponseOn: writeStream.
	^writeStream contents
!
(reader addClassMethod: 'gravel')
!
sessionID: aString application: anApplication callbackRegistry: aDictionary
	^self new
		initializeSessionID: aString
		application: anApplication
		callbackRegistry: aDictionary
!
