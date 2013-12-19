(reader defineClass: 'JVMNode' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMNode: self
!
(reader addMethod: 'printing')
!
printOn: aStream {WStream[Char]} {^Self}
	self sourceOn: aStream
!
(reader addMethod: 'printing')
!
printString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: (String new: 16).
	self printOn: aStream.
	^aStream contents
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: self class name
!
(reader addMethod: 'printing')
!
sourceString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self sourceOn: aStream.
	^aStream contents
!
(reader addClassMethod: 'accessing')
!
toolListIcon
	^Tools.BehaviorIcons Point
!
