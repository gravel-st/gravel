(reader defineClass: 'UnaryMessageNode' superclass: 'st.gravel.support.compiler.ast.MessageNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitUnaryMessageNode: self
!
(reader addMethod: 'accessing')
!
argument {^Expression}
	^nil
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[Expression]}
	^#()
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	receiver sourceOn: aStream.
	self sourceSendOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
innerSourceSendOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: selector
!
(reader addMethod: 'As yet unclassified')
!
isTraitRequirementMessage {^Bool}
	^receiver isSelfNode and: [selector = 'traitRequirement']
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: receiver
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^0
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^1
!
(reader addMethod: 'As yet unclassified')
!
withArguments: anArray {Arr[Expression]} {^Self}
	self assert: anArray isEmpty.
	^self
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, String]}
	^#('receiver' 'selector')
!
