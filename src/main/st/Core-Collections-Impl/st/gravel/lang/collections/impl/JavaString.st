(reader defineClass: 'JavaString' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.String')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.String class')
!
(reader propertyAt: 'javaClass' put: 'java.lang.String')
!
(reader addMethod: '')
!
, aString
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'comma_')>
	
!
(reader addMethod: '')
!
< anObject
	^anObject lessFromJavaString: self
!
(reader addMethod: '')
!
= anObject
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'equals_')>
	
!
(reader addMethod: 'converting')
!
asScaledDecimal
	^ScaledDecimal readFrom: self
!
(reader addMethod: 'gravel')
!
asString
	^self
!
(reader addMethod: 'gravel')
!
asSymbol
	^Symbol value: self
!
(reader addMethod: '')
!
at: index
	^Character codePoint: (self codePointAtCodePointIndex: index)
!
(reader addMethod: 'private-java')
!
codePointAt: codeUnitsIndex
	<primitive: 'codePointAt'>
	
!
(reader addMethod: 'private-java')
!
codePointAtCodePointIndex: index
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'codePointAtCodePointIndex_')>
	
!
(reader addMethod: 'private-java')
!
codeUnitsSize
	<primitive: 'length'>
	
!
(reader addMethod: '')
!
copyFrom: start to: stop
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'copyFrom_to_')>
	
!
(reader addMethod: 'copying')
!
copyWith: aCharacter
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'copyWith_')>
	
!
(reader addMethod: 'copying')
!
copyWithAll: aString
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'copyWithAll_')>
	
!
(reader addMethod: 'gravel')
!
do: aBlock
	| codeUnitsSize i |
	codeUnitsSize := self codeUnitsSize.
	i := 0.
	[i < codeUnitsSize] whileTrue: 
			[| char |
			char := Character codePoint: (self codePointAt: i).
			aBlock value: char.
			i := i + char codeUnitsSize]
!
(reader addMethod: 'private-comparing')
!
lessFromGravelSymbol: aSymbol
	^aSymbol asString < self
!
(reader addMethod: 'private-comparing')
!
lessFromJavaString: aString
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'lessFromJavaString_')>
	
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
readStream
	^JavaCharBuffer on: self
!
(reader addMethod: '')
!
size
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'codePointsSize')>
	
!
(reader addMethod: 'gravel')
!
species
	^OrderedCollection
!
(reader addMethod: '')
!
tokensBasedOn: anObject
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'tokensBasedOn_')>
	
!
(reader addMethod: 'converting')
!
writeStream
	^JavaStringBuilder on: self
!
(reader addClassMethod: '')
!
new: size
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'newInstance_')>
	
!
(reader addClassMethod: '')
!
newImpl: size
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'newInstance_')>
	
!
(reader addClassMethod: 'gravel')
!
with: aCharacter
	| ws |
	ws := WriteStream on: self new.
	ws nextPut: aCharacter.
	^ws contents
!
