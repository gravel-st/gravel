(reader defineClass: 'MessageSend' superclass: 'st.gravel.lang.Message')
!
(reader addInstVar: 'receiver')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitMessageSend: self
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anObject selector: aSymbol arguments: anArray
	receiver := anObject.
	selector := aSymbol.
	args := anArray.
	self initialize
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream
		nextPutAll: 'a Message with receiver: ';
		print: receiver;
		nextPutAll: ' selector: ';
		print: selector;
		nextPutAll: ' and arguments: ';
		print: args
!
(reader addMethod: 'accessing')
!
receiver
	^receiver
!
(reader addClassMethod: 'instance creation')
!
receiver: anObject selector: aSymbol arguments: anArray
	^self new initializeReceiver: anObject selector: aSymbol arguments: anArray
!
