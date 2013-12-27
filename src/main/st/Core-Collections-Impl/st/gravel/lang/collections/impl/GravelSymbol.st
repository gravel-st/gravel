(reader defineClass: 'GravelSymbol' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Symbol')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Symbol class')
!
(reader propertyAt: 'javaClass' put: 'st.gravel.core.Symbol')
!
(reader addMethod: 'gravel')
!
< anObject
	^self asString < anObject asString
!
(reader addMethod: 'gravel')
!
= anObject
	^self == anObject
!
(reader addMethod: '')
!
asString
	<primitive: 'asString'>
	
!
(reader addMethod: 'gravel')
!
asSymbol
	^self
!
(reader addMethod: '')
!
at: index
	<primitive: #('st.gravel.support.jvm.SymbolExtensions' 'at_')>
	
!
(reader addMethod: 'gravel')
!
copyFrom: start to: stop
	^self asString copyFrom: start to: stop
!
(reader addMethod: '')
!
do: aBlock
	<primitive: #('st.gravel.support.jvm.SymbolExtensions' 'do_')>
	
!
(reader addMethod: 'gravel')
!
isLiteralSymbol
	| parser res |
	parser := Parser source: self asString.
	[res := parser parseSymbolNoHash: parser parseIdentifier] on: Error do: [:ex | ^false].
	^parser atEnd and: [res isSymbolLiteralNode]
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: '')
!
size
	<primitive: #('st.gravel.support.jvm.SymbolExtensions' 'size')>
	
!
(reader addMethod: 'As yet unclassified')
!
tokensBasedOn: anObject
	^self asString tokensBasedOn: anObject
!
(reader addClassMethod: '')
!
allStrings
	<primitive: #('st.gravel.support.jvm.SymbolExtensions' 'allStrings')>
	
!
(reader addClassMethod: 'instance creation')
!
basicNew
	self error: 'Cannot create symbols'
!
(reader addClassMethod: 'instance creation')
!
basicNew: size
	self error: 'Cannot create symbols'
!
(reader addClassMethod: '')
!
value: aString
	<primitive: #('st.gravel.support.jvm.SymbolExtensions' 'newInstance_')>
	
!
