(reader extendClass: 'Class')
!
(reader addMethod: 'reflection-ANSI support')
!
allSubclasses
	^self classMirror allSubclasses collect: [:each | each instance]
!
(reader addMethod: 'reflection-ANSI support')
!
allSuperclasses
	^self classMirror allSuperclasses collect: [:each | each instance]
!
(reader addMethod: 'reflection-ANSI support')
!
classMirror
	^(Reflection reflect: self) classMirror nonmeta
!
(reader addMethod: 'reflection-ANSI support')
!
subclasses
	^self classMirror subclasses collect: [:each | each instance]
!
(reader addMethod: 'reflection-ANSI support')
!
superclass
	^self classMirror superclass ifNotNil: [:scMirror | scMirror instance]
!
