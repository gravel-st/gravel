(reader defineClass: 'FixedPointLiteralNode' superclass: 'st.gravel.support.compiler.ast.NumberLiteralNode')
!
(reader addInstVar: 'numerator')
!
(reader addInstVar: 'denominator')
!
(reader addInstVar: 'scale')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitFixedPointLiteralNode: self
!
(reader addMethod: 'accessing')
!
denominator {^LargeInteger}
	^denominator
!
(reader addMethod: 'initialize-release')
!
initializeNumerator: anInteger {LargeInteger} denominator: anInteger2 {LargeInteger} scale: anInteger3 {Int} {^Self}
	numerator := anInteger.
	denominator := anInteger2.
	scale := anInteger3.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	| digits {Int} fractionDigits {Int} firstDigitAfterDot {Int} numeratorString {Str} |
	numeratorString := numerator printString.
	digits := numeratorString size.
	fractionDigits := denominator printString size - 1.
	digits to: fractionDigits
		do: 
			[:i |
			i = 2 ifTrue: [aStream nextPut: $.].
			aStream nextPut: $0].
	firstDigitAfterDot := digits - fractionDigits + 1.
	1 to: digits
		do: 
			[:i {Int} |
			i = firstDigitAfterDot ifTrue: [aStream nextPut: $.].
			aStream nextPut: (numeratorString at: i)].
	aStream nextPut: $s.
	fractionDigits = scale ifFalse: [aStream print: scale]
!
(reader addMethod: 'testing')
!
isFixedPointLiteralNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
negated {^FixedPointLiteralNode}
	^FixedPointLiteralNode
		numerator: numerator negated
		denominator: denominator
		scale: scale
!
(reader addMethod: 'accessing')
!
numerator {^LargeInteger}
	^numerator
!
(reader addMethod: 'accessing')
!
scale {^Int}
	^scale
!
(reader addMethod: 'accessing')
!
value {^Obj}
	^self error: 'Cannot calculate value'
!
(reader addMethod: 'As yet unclassified')
!
valueString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self innerSourceOn: aStream.
	^aStream contents
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[LargeInteger, LargeInteger, Int]}
	^#('numerator' 'denominator' 'scale')
!
(reader addClassMethod: 'instance creation')
!
integer: anInteger {LargeInteger} fractionString: aString {Str} scale: scale {Int} {^FixedPointLiteralNode}
	| denominator {LargeInteger} numerator {LargeInteger} |
	denominator := 10 raisedToInteger: aString size.
	numerator := anInteger * denominator.
	aString isEmpty ifFalse: [numerator := numerator + aString asInteger].
	^FixedPointLiteralNode numerator: numerator denominator: denominator scale: scale
!
(reader addClassMethod: 'instance creation')
!
numerator: anInteger {LargeInteger} denominator: anInteger2 {LargeInteger} scale: anInteger3 {Int} {^FixedPointLiteralNode}
	^self new initializeNumerator: anInteger denominator: anInteger2 scale: anInteger3
!
