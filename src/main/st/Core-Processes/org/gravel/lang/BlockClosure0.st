(reader extendClass: 'BlockClosure0')
!
(reader addMethod: 'As yet unclassified')
!
fork
	| forkedProcess |
	forkedProcess := Process forBlock: self.
	forkedProcess resume.
	^forkedProcess
!
