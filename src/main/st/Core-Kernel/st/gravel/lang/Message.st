(reader defineClass: 'Message' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'selector')
!
(reader addInstVar: 'args')
!
(reader addMethod: 'gravel')
!
argument
	^args first
!
(reader addMethod: 'gravel')
!
arguments
	^args
!
(reader addMethod: 'gravel')
!
initializeSelector: aSymbol arguments: anArray
	selector := aSymbol.
	args := anArray
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream
		nextPutAll: 'a Message with selector: ';
		print: selector;
		nextPutAll: ' and arguments: ';
		print: args
!
(reader addMethod: 'gravel')
!
selector
	^selector
!
(reader addMethod: 'gravel')
!
sentTo: receiver
	^receiver perform: selector withArguments: args
!
(reader addClassMethod: 'gravel')
!
selector: aSymbol arguments: anArray
	^self new initializeSelector: aSymbol arguments: anArray
!
