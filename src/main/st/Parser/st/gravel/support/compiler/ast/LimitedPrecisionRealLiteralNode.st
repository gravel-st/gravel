(reader defineClass: 'LimitedPrecisionRealLiteralNode' superclass: 'st.gravel.support.compiler.ast.NumberLiteralNode')
!
(reader addInstVar: 'valueString')
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
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('valueString')
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
	exp isNil
		ifFalse: 
			[wstr
				nextPut: $e;
				nextPutAll: exp printString].
	self postfixCharacter isNil ifFalse: [wstr nextPut: self postfixCharacter].
	^self valueString: wstr contents
!
(reader addClassMethod: 'constants')
!
postfixCharacter {^Char | Nil}
	^nil
!
(reader addClassMethod: 'instance creation')
!
valueString: aString {Str} {^Instance}
	^self new initializeValueString: aString
!
