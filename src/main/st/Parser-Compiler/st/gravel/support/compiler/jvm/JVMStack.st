(reader defineClass: 'JVMStack' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'elements')
!
(reader addMethod: 'accessing')
!
elementsDo: aBlock {[JVMType, ^Object]} {^Self}
	elements do: aBlock
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	elements := #()
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^elements isEmpty
!
(reader addMethod: 'As yet unclassified')
!
peek {^JVMType}
	^self peek: 1
!
(reader addMethod: 'As yet unclassified')
!
peek: anInteger {Int} {^JVMType}
	^elements at: elements size - (anInteger - 1)
!
(reader addMethod: 'As yet unclassified')
!
pop {^JVMType}
	| last {JVMType} |
	last := elements last.
	elements := elements allButLast.
	^last
!
(reader addMethod: 'As yet unclassified')
!
popLast {^JVMType}
	self assert: self size = 1.
	^self pop
!
(reader addMethod: 'As yet unclassified')
!
push: aType {JVMType} {^Self}
	self deny: aType isBottomType.
	elements := elements copyWith: aType
!
(reader addMethod: 'accessing')
!
size {^Int}
	^elements size
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[JVMType]]}
	^#('elements')
!
(reader addClassMethod: 'instance creation')
!
new {^Instance}
	^super new initialize
!
