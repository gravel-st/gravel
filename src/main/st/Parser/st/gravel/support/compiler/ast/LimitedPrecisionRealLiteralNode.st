(reader defineClass: 'LimitedPrecisionRealLiteralNode' superclass: 'st.gravel.support.compiler.ast.NumberLiteralNode')
!
(reader addInstVar: 'valueString' type: 'String')
!
(reader addMethod: 'initialize-release')
!
initializeValueString: aString {Str} {^Self}
	valueString := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: valueString
!
(reader addMethod: 'accessing')
!
valueString {^Str}
	^valueString
!
(reader addClassMethod: 'constants')
!
exponentCharacter {^Char | Nil}
	^self subclassResponsibility
!
(reader addClassMethod: 'constants')
!
exponentCharacterIsMandatory {^Bool}
	^self subclassResponsibility
!
(reader addClassMethod: 'instance creation')
!
integer: anInteger {LargeInteger} fractionString: fractionString {Str | Nil} exponent: exp {LargeInteger | Nil} {^Instance}
	| wstr {WStream[Char]} |
	wstr := WriteStream on: String new.
	wstr nextPutAll: anInteger printString.
	fractionString isNil
		ifFalse: 
			[wstr
				nextPut: $.;
				nextPutAll: fractionString].
	(exp isNil and: [self exponentCharacterIsMandatory not])
		ifFalse: 
			[wstr nextPut: self exponentCharacter.
			(exp isNil or: [exp isZero]) ifFalse: [wstr nextPutAll: exp printString]].
	^self valueString: wstr contents
!
(reader addClassMethod: 'instance creation')
!
valueString: aString {Str} {^Instance}
	^self new initializeValueString: aString
!
