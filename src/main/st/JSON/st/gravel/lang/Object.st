(reader extendClass: 'Object')
!
(reader addMethod: 'converting')
!
asJSON {^Str}
	| stream |
	stream := WriteStream on: String new.
	self jsonOn: stream.
	^stream contents
!
(reader addMethod: 'printing')
!
jsonOn: aStream
	self jsonOn: aStream prettyPrint: true
!
