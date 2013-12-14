(reader defineClass: 'Exception' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'currentHandler')
!
(reader addInstVar: 'resume')
!
(reader addInstVar: 'messageText')
!
(reader addMethod: 'gravel')
!
creator
	^self class
!
(reader addMethod: 'gravel')
!
currentHandler
	^currentHandler
!
(reader addMethod: 'gravel')
!
currentHandler: anObject
	currentHandler := anObject
!
(reader addMethod: 'gravel')
!
messageText
	^messageText
!
(reader addMethod: 'gravel')
!
messageText: anObject
	messageText := anObject
!
(reader addMethod: 'gravel')
!
pass
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'pass')>
	
!
(reader addMethod: 'gravel')
!
raise
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'raise')>
	
!
(reader addMethod: 'gravel')
!
resume
	^resume == true
!
(reader addMethod: 'gravel')
!
return: aValue
	<primitive: #('org.gravel.support.jvm.ExceptionExtensions' 'return_')>
	
!
(reader addClassMethod: 'gravel')
!
, anExceptionSelector
	^ExceptionSet with: self with: anExceptionSelector
!
(reader addClassMethod: 'gravel')
!
accepts: anExceptionCreator
	^anExceptionCreator == self or: [anExceptionCreator inheritsFrom: self]
!
(reader addClassMethod: 'gravel')
!
handles: aSignalledException
	^self accepts: aSignalledException creator
!
(reader addClassMethod: 'gravel')
!
raise
	^self new raise
!
(reader addClassMethod: 'gravel')
!
raiseSignal
	^self raise
!
(reader addClassMethod: 'gravel')
!
raiseSignal: aString
	^(self new)
		messageText: aString;
		raise
!
