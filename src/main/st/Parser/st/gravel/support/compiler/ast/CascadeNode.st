(reader defineClass: 'CascadeNode' superclass: 'st.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'messages')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [messages = anObject messages]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitCascadeNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: messages hash
!
(reader addMethod: 'initialize-release')
!
initializeMessages: anArray {Array[MessageNode]} {^Self}
	messages := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	self receiver sourceOn: aStream.
	messages do: [:msg {MessageNode} | msg sourceSendOn: aStream]
		separatedBy: 
			[aStream
				nextPut: $;;
				space]
!
(reader addMethod: 'accessing')
!
messages {^Array[MessageNode]}
	^messages
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	messages do: aBlock
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^4
!
(reader addMethod: 'As yet unclassified')
!
receiver {^Expression}
	^messages first receiver
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Array[MessageNode]]}
	^#('messages')
!
(reader addClassMethod: 'instance creation')
!
messages: anArray {Array[MessageNode]} {^Instance}
	^self new initializeMessages: anArray
!
