(reader defineClass: 'GravelSymbol' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.Symbol')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.Symbol class')
!
(reader propertyAt: 'javaClass' put: 'org.gravel.core.Symbol')
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
(reader addMethod: 'gravel')
!
asString
	<primitive: 'asString'>
	
!
(reader addMethod: 'gravel')
!
asSymbol
	^self
!
(reader addMethod: 'gravel')
!
at: index
	<primitive: #('org.gravel.support.jvm.SymbolExtensions' 'at_')>
	
!
(reader addMethod: 'gravel')
!
copyFrom: start to: stop
	^self asString copyFrom: start to: stop
!
(reader addMethod: 'gravel')
!
do: aBlock
	<primitive: #('org.gravel.support.jvm.SymbolExtensions' 'do_')>
	
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
(reader addMethod: 'gravel')
!
size
	<primitive: #('org.gravel.support.jvm.SymbolExtensions' 'size')>
	
!
(reader addMethod: 'As yet unclassified')
!
tokensBasedOn: anObject
	^self asString tokensBasedOn: anObject
!
(reader addClassMethod: 'As yet unclassified')
!
allStrings
	<primitive: #('org.gravel.support.jvm.SymbolExtensions' 'allStrings')>
	
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
(reader addClassMethod: 'gravel')
!
value: aString
	<primitive: #('org.gravel.support.jvm.SymbolExtensions' 'newInstance_')>
	
!
