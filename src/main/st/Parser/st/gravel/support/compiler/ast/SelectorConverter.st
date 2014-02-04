(reader defineClass: 'SelectorConverter' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'map' type: 'Dictionary[Symbol, String]')
!
(reader addInstVar: 'specialCharacters' type: 'Dictionary[Character, String]')
!
(reader addInstVar: 'reverseMap' type: 'Dictionary[String, Symbol]')
!
(reader addInstVar: 'specialCharactersReverse' type: 'Dictionary[String, Character]')
!
(reader addMethod: 'initialize-release')
!
addSelector: sel {Sym} functionName: fn {Str} {^Self}
	map at: sel put: fn.
	reverseMap at: fn put: sel
!
(reader addMethod: 'As yet unclassified')
!
decodeSelector: aString {Str} {^Sym}
	| str {RStream[Char]} directive {Str} wstr {WStream[Char]} |
	wstr := WriteStream on: String new.
	str := ReadStream on: aString.
	[str atEnd] whileFalse: 
			[| ch {Char} |
			ch := str next.
			ch = $_
				ifTrue: [wstr nextPut: $:]
				ifFalse: 
					[ch = $$
						ifTrue: 
							[directive := str upTo: $$.
							wstr nextPut: (specialCharactersReverse at: directive)]
						ifFalse: [wstr nextPut: ch]]].
	^wstr contents asSymbol
!
(reader addMethod: 'As yet unclassified')
!
encodeSelector: aSymbol {Sym} {^Str}
	| wStr {WStream[Char]} str {Str} rstr {RStream[Char]} |
	str := aSymbol asString.
	str isEmpty ifTrue: [^'$empty'].
	wStr := WriteStream on: String new.
	rstr := ReadStream on: str.
	[rstr atEnd] whileFalse: 
			[| sc {Str} ch {Char | Nil} |
			ch := rstr next.
			ch = $:
				ifTrue: [wStr nextPut: $_]
				ifFalse: 
					[sc := specialCharacters at: ch ifAbsent: [nil].
					sc isNil
						ifTrue: [wStr nextPut: ch]
						ifFalse: 
							[wStr
								nextPut: $$;
								nextPutAll: sc;
								nextPut: $$]]].
	^wStr contents
!
(reader addMethod: 'As yet unclassified')
!
functionNameAsSelector: aString {Str} {^Sym}
	^reverseMap at: aString ifAbsent: [self decodeSelector: aString]
!
(reader addMethod: 'As yet unclassified')
!
functionNameForNumArgs: numArgs {Int} {^Str}
	numArgs = 0 ifTrue: [^'value'].
	^(1 to: numArgs) join: [:i {Int} | 'value_']
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	self initializeForStaticLinking: false
!
(reader addMethod: 'initialize-release')
!
initializeForStaticLinking: aBoolean {Bool} {^Self}
	self initializeSpecialCharacters.
	map := Dictionary new.
	reverseMap := Dictionary new.
	reverseMap at: '$empty' put: #''.
	aBoolean ifTrue: [self mapForStaticLinking].
	self javaReservedKeywords
		do: [:sym {Sym} | self addSelector: sym functionName: 'r_' , sym asString].
	map values copy do: [:v {Str} | self addSelector: v asSymbol functionName: '_lit_' , v]
!
(reader addMethod: 'initialize-release')
!
initializeSpecialCharacters {^Self}
	specialCharacters := Dictionary new.
	specialCharactersReverse := Dictionary new.
	specialCharacters
		at: $~ put: 'tilde';
		at: $! put: 'exclamation';
		at: $@ put: 'at';
		at: $% put: 'percent';
		at: $& put: 'and';
		at: $* put: 'times';
		at: $- put: 'minus';
		at: $+ put: 'plus';
		at: $= put: 'equals';
		at: $| put: 'pipe';
		at: $/ put: 'slash';
		at: $\ put: 'backslash';
		at: $< put: 'less';
		at: $> put: 'more';
		at: $, put: 'comma';
		at: $? put: 'wat';
		at: $_ put: 'underscore';
		at: $$ put: 'dollar';
		at: $: put: '_'.
	specialCharacters copy
		keysAndValuesDo: [:k {Char} :v {Str} | specialCharactersReverse at: v put: k]
!
(reader addMethod: 'initialize-release')
!
javaReservedKeywords {^Arr[Sym]}
	^#(#abstract #assert #boolean #break #byte #case #catch #char #class #const #continue #default #do #double #else #enum #extends #false #final #finally #float #for #goto #if #implements #import #instanceof #int #interface #long #native #new #package #private #protected #public #return #short #static #strictfp #super #switch #synchronized #this #throw #throws #transient #true #try #void #volatile #wait #while)
!
(reader addMethod: 'As yet unclassified')
!
keywordFunctionNameAsSelector: aString {Str} {^Sym}
	^((aString tokensBasedOn: $_) joinWith: ':') asSymbol
!
(reader addMethod: 'initialize-release')
!
mapForStaticLinking {^Self}
	self addSelector: #= functionName: 'equals'.
	self addSelector: #hash functionName: 'hashCode'.
	self addSelector: #copy functionName: 'clone'.
	self addSelector: #printString functionName: 'toString'
!
(reader addMethod: 'As yet unclassified')
!
selectorAsFunctionName: aSymbol {Sym} {^Str}
	^map at: aSymbol ifAbsent: [self encodeSelector: aSymbol]
!
(reader addMethod: 'As yet unclassified')
!
selectorForNumArgs: numArgs {Int} {^Str}
	numArgs = 0 ifTrue: [^'value'].
	^(1 to: numArgs) join: [:i {Int} | 'value:']
!
(reader addMethod: 'initialize-release')
!
specialCharacterAt: aChar
	^specialCharacters at: aChar
!
(reader addClassMethod: 'instance creation')
!
forStaticLinking
	^super new initializeForStaticLinking: true
!
(reader addClassMethod: 'instance creation')
!
new {^Instance}
	^super new initialize
!
(reader addClassMethod: 'As yet unclassified')
!
selectorAsFunctionName: aSymbolOrString {Str} {^Str}
	^self new selectorAsFunctionName: aSymbolOrString asSymbol
!
