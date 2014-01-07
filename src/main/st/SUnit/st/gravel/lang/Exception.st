(reader extendClass: 'Exception')
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
sunitExitWith: aValue
	^self return: aValue
!
(reader addClassMethod: 'gravel')
!
sunitSignalWith: aString
	^self raiseSignal: aString
!
