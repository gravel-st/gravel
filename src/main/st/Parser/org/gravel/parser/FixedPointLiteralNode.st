(reader defineClass: 'FixedPointLiteralNode' superclass: 'org.gravel.parser.NumberLiteralNode')
!
(reader addInstVar: 'fixedPoint')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitFixedPointLiteralNode: self
!
(reader addMethod: 'accessing')
!
fixedPoint {^FixedPoint}
	^fixedPoint
!
(reader addMethod: 'initialize-release')
!
initializeFixedPoint: aFixedPoint {FixedPoint} {^Self}
	fixedPoint := aFixedPoint.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: fixedPoint printString
!
(reader addMethod: 'testing')
!
isFixedPointLiteralNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
negated {^FixedPointLiteralNode}
	^FixedPointLiteralNode fixedPoint: fixedPoint negated
!
(reader addMethod: 'accessing')
!
value {^FixedPoint}
	^fixedPoint
!
(reader addClassMethod: 'instance creation')
!
fixedPoint: aFixedPoint {FixedPoint} {^Instance}
	^self new initializeFixedPoint: aFixedPoint
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[FixedPoint]}
	^#('fixedPoint')
!
(reader addClassMethod: 'As yet unclassified')
!
integer: anInteger {LargeInteger} fractionString: aString {Str} {^FixedPointLiteralNode}
	^FixedPointLiteralNode
		fixedPoint: (FixedPoint fromString: anInteger printString , '.' , aString)
!
