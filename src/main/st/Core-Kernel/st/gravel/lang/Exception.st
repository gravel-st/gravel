(reader defineClass: 'Exception' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'currentHandler')
!
(reader addInstVar: 'resume')
!
(reader addInstVar: 'messageText')
!
(reader addInstVar: 'initialHandler')
!
(reader addMethod: 'gravel')
!
creator
	^self class
!
(reader addMethod: 'accessing')
!
currentHandler
	^currentHandler
!
(reader addMethod: 'accessing')
!
currentHandler: anObject
	currentHandler := anObject
!
(reader addMethod: 'accessing')
!
defaultAction
	self subclassResponsibility
!
(reader addMethod: 'accessing')
!
defaultResumeValue
	^nil
!
(reader addMethod: 'accessing')
!
description
	messageText isNil ifTrue: [^self class name].
	^messageText
!
(reader addMethod: 'accessing')
!
initialHandler
	^initialHandler
!
(reader addMethod: 'accessing')
!
initialHandler: anObject
	initialHandler := anObject
!
(reader addMethod: 'testing')
!
isException
	^true
!
(reader addMethod: 'testing')
!
isExceptionBuilder
	^true
!
(reader addMethod: 'testing')
!
isResumable
	^true
!
(reader addMethod: 'testing')
!
isSignalledException
	^true
!
(reader addMethod: 'accessing')
!
messageText
	^messageText == nil ifTrue: [''] ifFalse: [messageText asString]
!
(reader addMethod: 'accessing')
!
messageText: anObject
	messageText := anObject
!
(reader addMethod: 'actions')
!
pass
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'pass')>
	
!
(reader addMethod: 'actions')
!
raise
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'raise')>
	
!
(reader addMethod: 'gravel')
!
resume
	^resume == true
!
(reader addMethod: 'actions')
!
return: aValue
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'return_')>
	
!
(reader addMethod: 'accessing')
!
tag
	^messageText
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
(reader addClassMethod: 'gravel')
!
signal
	^self raiseSignal
!
