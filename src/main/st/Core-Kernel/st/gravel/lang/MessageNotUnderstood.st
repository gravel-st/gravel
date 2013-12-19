(reader defineClass: 'MessageNotUnderstood' superclass: 'st.gravel.lang.Error')
!
(reader addInstVar: 'message')
!
(reader addInstVar: 'receiver')
!
(reader addMethod: 'gravel')
!
accept: visitor
	^visitor visitMessageNotUnderstood: self
!
(reader addMethod: 'gravel')
!
initializeMessage: aMessage receiver: anObject
	message := aMessage.
	receiver := anObject.
	messageText := 'DNU: ' , (Reflection reflect: receiver) classMirror name
				, ' does not understand: ' , aMessage selector.
	self initialize
!
(reader addMethod: 'gravel')
!
message
	^message
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream
		nextPutAll: 'Message not understood: ';
		nextPutAll: messageText
!
(reader addMethod: 'gravel')
!
receiver
	^receiver
!
(reader addClassMethod: 'gravel')
!
message: aMessage receiver: anObject
	^self new initializeMessage: aMessage receiver: anObject
!
