(reader defineClass: 'JavaString' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.String')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.String class')
!
(reader addInstVar: '____str_Gravel_st_gravel_lang_collections_interface_String__Gravel_st_gravel_lang_collections_impl_JavaString___')
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
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'at_')>
	
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
(reader addMethod: 'gravel')
!
do: aBlock
	1 to: self size do: [:i | aBlock value: (self at: i)]
!
(reader addMethod: 'gravel')
!
isString
	^true
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
	<primitive: #('st.gravel.support.jvm.StringExtensions' 'size')>
	
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
