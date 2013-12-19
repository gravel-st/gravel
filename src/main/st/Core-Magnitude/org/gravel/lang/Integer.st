(reader defineClass: 'Integer' superclass: 'org.gravel.lang.Number')
!
(reader addMethod: 'gravel')
!
> aMagnitude
	^aMagnitude < self
!
(reader addMethod: 'As yet unclassified')
!
benchFib
	^self < 2 ifTrue: [1] ifFalse: [(self - 1) benchFib + (self - 2) benchFib + 1]
!
(reader addMethod: 'As yet unclassified')
!
benchmark
	| size flags prime k count |
	size := 8190.
	1 to: self
		do: 
			[:iter |
			count := 0.
			flags := (Array new: size) atAllPut: true.
			1 to: size
				do: 
					[:i |
					(flags at: i)
						ifTrue: 
							[prime := i + 1.
							k := i + prime.
							[k <= size] whileTrue: 
									[flags at: k put: false.
									k := k + prime].
							count := count + 1]]].
	^count
!
(reader addMethod: 'gravel')
!
factorial
	| tmp |
	tmp := 1.
	2 to: self do: [:i | tmp := tmp * i].
	^tmp
!
(reader addMethod: 'testing')
!
isInteger
	^true
!
(reader addMethod: 'gravel')
!
printBase: base
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self printOn: aStream base: 10
!
(reader addMethod: 'gravel')
!
printOn: aStream base: base
	aStream nextPutAll: (self printBase: base)
!
(reader addMethod: 'As yet unclassified')
!
raisedTo: aNumber
	| n |
	(n := aNumber toMinimumGenerality) isInteger ifTrue: [^self raisedToInteger: n].
	self notImplementedYet
!
(reader addMethod: 'As yet unclassified')
!
raisedToInteger: aNumber
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
rounded
	^self
!
(reader addMethod: 'As yet unclassified')
!
tinyBenchmarks
	| t1 t2 r n1 n2 |
	n1 := 1.
	
	[t1 := Time millisecondsToRun: [n1 benchmark].
	t1 < 1000] whileTrue: [n1 := n1 * 2].
	n2 := 28.
	
	[t2 := Time millisecondsToRun: [r := n2 benchFib].
	t2 < 1000] whileTrue: [n2 := n2 + 1].
	^(n1 * 500000 * 1000 // t1) printString , ' bytecodes/sec; '
		, (r * 1000 // t2) printString , ' sends/sec'
!
(reader addMethod: 'gravel')
!
to: stop
	^Interval from: self to: stop by: 1
!
