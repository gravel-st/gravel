(reader defineClass: 'ApplicationServlet' superclass: 'com.ag5.jetty.StHttpServlet')
!
(reader addInstVar: 'applicationBuilder')
!
(reader addInstVar: 'sessions')
!
(reader addMethod: 'gravel')
!
addSession: aSession
	^sessions at: aSession sessionID put: aSession
!
(reader addMethod: 'gravel')
!
applicationBuilder
	^applicationBuilder
!
(reader addMethod: 'gravel')
!
doGet: aRequest response: aResponse
	| sessionID state |
	aResponse contentType: 'text/html'.
	aResponse status: 200.
	sessionID := aRequest parameterAt: 'sessionID'.
	state := self sessionOrNewAt: sessionID.
	state writeResponseOn: aResponse writer
!
(reader addMethod: 'gravel')
!
doPost: aRequest response: aResponse
	| sessionID state |
	sessionID := aRequest parameterAt: 'sessionID'.
	state := sessions at: sessionID
				ifAbsent: 
					[aResponse contentType: 'text/html'.
					aResponse status: 200.
					aResponse sendRedirect: 'view'.
					^self].
	state processRequest: aRequest.
	aResponse contentType: 'text/html'.
	aResponse status: 200.
	aResponse sendRedirect: 'view?sessionID=' , state sessionID
!
(reader addMethod: 'gravel')
!
initialize
	sessions := Dictionary new
!
(reader addMethod: 'gravel')
!
initializeApplicationBuilder: aBlock
	applicationBuilder := aBlock.
	self initialize
!
(reader addMethod: 'gravel')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addMethod: 'gravel')
!
sessionOrNewAt: sessionID
	^sessions at: sessionID
		ifAbsent: 
			[self addSession: (ApplicationSession
						sessionID: Random nextUUIDString
						application: applicationBuilder value
						callbackRegistry: Dictionary new)]
!
(reader addMethod: 'gravel')
!
writeTestResponse
	| session |
	session := self sessionOrNewAt: nil.
	^session writeResponseString
!
(reader addClassMethod: 'gravel')
!
applicationBuilder: aBlock
	^self new initializeApplicationBuilder: aBlock
!
