(reader defineClass: 'JVMLocalDeclaration' superclass: 'st.gravel.support.compiler.jvm.JVMVariable')
!
(reader addInstVar: 'index')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMLocalDeclaration: self
!
(reader addMethod: 'accessing')
!
index {^Int}
	^index
!
(reader addMethod: 'initialize-release')
!
initializeVarName: aString {Str} type: aJVMObjectType {JVMType} index: anInteger {Int} {^Self}
	varName := aString.
	type := aJVMObjectType.
	index := anInteger.
	self initialize
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: varName
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Int]}
	^#('index')
!
(reader addClassMethod: 'instance creation')
!
self {^JVMLocalDeclaration}
	^self
		varName: 'self'
		type: JVMDynamicObjectType new
		index: 0
!
(reader addClassMethod: 'instance creation')
!
varName: aString {Str} type: aJVMObjectType {JVMType} index: anInteger {Int} {^JVMLocalDeclaration}
	^self new initializeVarName: aString type: aJVMObjectType index: anInteger
!
