(reader extendClass: 'Exception')
!
(reader addInstVar: 'currentHandler')
!
(reader addInstVar: 'resume')
!
(reader addInstVar: 'messageText')
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
