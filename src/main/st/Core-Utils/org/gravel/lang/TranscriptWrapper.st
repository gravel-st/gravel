(reader defineClass: 'TranscriptWrapper' superclass: 'org.gravel.lang.TextCollectorOutput')
!
(reader addInstVar: 'block')
!
(reader addMethod: 'gravel')
!
initializeBlock: aBlock
	block := aBlock.
	self initialize
!
(reader addMethod: 'gravel')
!
show: aString
	block value: aString
!
(reader addClassMethod: 'gravel')
!
block: aBlock
	^self new initializeBlock: aBlock
!
