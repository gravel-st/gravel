(reader extendClass: 'Class')
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream nextPutAll: self name
!
(reader addMethod: 'sunit')
!
sunitAllSubclasses
	^self sunitClassMirror allSubclasses collect: [:each | each instance]
!
(reader addMethod: 'sunit')
!
sunitClassMirror
	^(Reflection reflect: self) classMirror nonmeta
!
(reader addMethod: 'sunit')
!
sunitName
	^self sunitClassMirror name
!
(reader addMethod: 'sunit')
!
sunitSelectors
	^self sunitClassMirror selectors
!
(reader addMethod: 'sunit')
!
sunitSuperclass
	^self sunitClassMirror superclass instance
!
