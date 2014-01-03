(reader extendClass: 'Object')
!
(reader addMethod: 'reflection')
!
respondsTo: aSymbol
	^(Reflection reflect: self) instanceRespondsTo: aSymbol
!
