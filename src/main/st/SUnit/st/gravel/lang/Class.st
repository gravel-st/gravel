(reader extendClass: 'Class')
!
(reader addMethod: 'gravel')
!
name
	^(Reflection reflect: self) classMirror nonmeta name
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream nextPutAll: self name
!
(reader addMethod: 'gravel')
!
sunitAllSubclasses
	^self sunitClassMirror allSubclasses collect: [:each | each instance]
!
(reader addMethod: 'gravel')
!
sunitClassMirror
	^(Reflection reflect: self) classMirror nonmeta
!
(reader addMethod: 'gravel')
!
sunitName
	^self sunitClassMirror name
!
(reader addMethod: 'gravel')
!
sunitSelectors
	^self sunitClassMirror selectors
!
(reader addMethod: 'gravel')
!
sunitSuperclass
	^self sunitClassMirror superclass instance
!
