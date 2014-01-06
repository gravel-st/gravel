(reader extendTrait: 'String')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequencedReadable')
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequencedReadable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
!
(reader addMethod: 'As yet unclassified')
!
jsonBodyOn: aStream startChar: startChar
	self do: 
			[:ch |
			ch = Character lf
				ifTrue: [aStream nextPutAll: '\n']
				ifFalse: 
					[ch = Character cr
						ifTrue: [aStream nextPutAll: '\r']
						ifFalse: 
							[ch = Character tab
								ifTrue: [aStream nextPutAll: '\t']
								ifFalse: 
									[ch = startChar
										ifTrue: 
											[aStream
												nextPut: $\;
												nextPut: startChar]
										ifFalse: 
											[ch = $\
												ifTrue: [aStream nextPutAll: '\\']
												ifFalse: 
													[ch = Character euro
														ifTrue: [aStream nextPutAll: '\u20AC']
														ifFalse: 
															[ch asInteger < 128
																ifTrue: [aStream nextPut: ch]
																ifFalse: 
																	[| codepoint |
																	codepoint := ch asInteger.
																	codepoint < 65536
																		ifTrue: 
																			[aStream nextPutAll: '\u'.
																			codepoint printOn: aStream base: 16 digitsToPad: 4]
																		ifFalse: 
																			[| first second |
																			codepoint := codepoint - 65536.
																			first := ((codepoint bitAnd: 1047552) bitShift: -10) + 55296.
																			second := (codepoint bitAnd: 1023) + 56320.
																			aStream nextPutAll: '\u'.
																			first printOn: aStream base: 16 digitsToPad: 4.
																			aStream nextPutAll: '\u'.
																			second printOn: aStream base: 16 digitsToPad: 4]]]]]]]]]
!
(reader addMethod: 'As yet unclassified')
!
jsonOn: aStream prettyPrint: aBoolean
	self jsonOn: aStream startChar: $"
!
(reader addMethod: 'As yet unclassified')
!
jsonOn: aStream startChar: startChar
	aStream nextPut: startChar.
	self jsonBodyOn: aStream startChar: startChar.
	aStream nextPut: startChar
!
