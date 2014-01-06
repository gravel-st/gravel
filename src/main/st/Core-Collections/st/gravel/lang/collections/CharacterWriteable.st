(reader defineTrait: 'CharacterWriteable' superclass: nil)
!
(reader addMethod: 'gravel')
!
cr
	self nextPut: Character cr
!
(reader addMethod: 'gravel')
!
crlf
	self
		cr;
		lf
!
(reader addMethod: 'gravel')
!
lf
	self nextPut: Character lf
!
(reader addMethod: 'gravel')
!
nextPutAllEscaped: aString
	aString isNil ifTrue: [^self].
	aString do: [:c | self nextPutEscapedChar: c]
!
(reader addMethod: 'gravel')
!
nextPutEscapedChar: c
	c = $& ifTrue: [^self nextPutAll: '&amp;'].
	c = $< ifTrue: [^self nextPutAll: '&lt;'].
	c = $> ifTrue: [^self nextPutAll: '&gt;'].
	c = $" ifTrue: [^self nextPutAll: '&quot;'].
	c = Character nbsp ifTrue: [^self nextPutAll: '&nbsp;'].
	c = Character tab ifTrue: [^self nextPutAll: '&#09;'].
	^self nextPutNonAsciiEscapedChar: c
!
(reader addMethod: 'gravel')
!
nextPutNonAsciiEscapedChar: c
	| i |
	(i := c asInteger) >= 128
		ifTrue: 
			[self nextPutAll: '&#'.
			i printOn: self.
			^self nextPut: $;].
	self nextPut: c
!
(reader addMethod: 'gravel')
!
print: anObject
	anObject printOn: self
!
(reader addMethod: 'gravel')
!
space
	self nextPut: Character space
!
(reader addMethod: 'gravel')
!
tab
	self nextPut: Character tab
!
