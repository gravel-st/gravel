(reader defineClass: 'Exception' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'currentHandler')
!
(reader addInstVar: 'messageText')
!
(reader addInstVar: 'initialHandler')
!
(reader addInstVar: 'resumeMarker')
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
	^(UnhandledException new)
		unhandledException: self;
		messageText: messageText;
		initialHandler: initialHandler;
		raise
!
(reader addMethod: 'accessing')
!
defaultResumeValue
	^nil
!
(reader addMethod: 'accessing')
!
defaultReturnValue
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
(reader addMethod: 'actions')
!
isNested
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'isNested')>
	
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
outer
	
!
(reader addMethod: 'accessing')
!
parameter
	^self subclassResponsibility
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
(reader addMethod: 'actions')
!
raiseResumable
	^self raise
!
(reader addMethod: 'actions')
!
resignalAs: replacementException
	replacementException initialHandler: initialHandler.
	^replacementException signal
!
(reader addMethod: 'actions')
!
resume
	self resume: self defaultResumeValue
!
(reader addMethod: 'actions')
!
resume: aValue
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'resume_')>
	
!
(reader addMethod: 'accessing')
!
resumeMarker
	^resumeMarker
!
(reader addMethod: 'accessing')
!
resumeMarker: anObject
	resumeMarker := anObject
!
(reader addMethod: 'actions')
!
retry
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'retry')>
	
!
(reader addMethod: 'actions')
!
retryUsing: alternativeBlock
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'retryUsing_')>
	
!
(reader addMethod: 'actions')
!
return
	^self return: self defaultReturnValue
!
(reader addMethod: 'actions')
!
return: aValue
	<primitive: #('st.gravel.support.jvm.ExceptionExtensions' 'return_')>
	
!
(reader addMethod: 'actions')
!
signal
	^self raise
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
raiseResumable
	^self new raiseResumable
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
