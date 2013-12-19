(reader defineClass: 'JavaString' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.String')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.String class')
!
(reader propertyAt: 'javaClass' put: 'java.lang.String')
!
(reader addMethod: 'gravel')
!
, aString
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'comma_')>
	
!
(reader addMethod: 'gravel')
!
< anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'sortsLowerThan_')>
	
!
(reader addMethod: 'gravel')
!
= anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'equals_')>
	
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
(reader addMethod: 'gravel')
!
at: index
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'at_')>
	
!
(reader addMethod: 'gravel')
!
copyFrom: start to: stop
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'copyFrom_to_')>
	
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
(reader addMethod: 'gravel')
!
printOn: aStream
	self storeOn: aStream
!
(reader addMethod: 'gravel')
!
size
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'size')>
	
!
(reader addMethod: 'gravel')
!
species
	^OrderedCollection
!
(reader addMethod: 'As yet unclassified')
!
tokensBasedOn: anObject
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'tokensBasedOn_')>
	
!
(reader addClassMethod: 'instance creation')
!
new: size
	<primitive: #('org.gravel.support.jvm.StringExtensions' 'newInstance_')>
	
!
(reader addClassMethod: 'gravel')
!
with: aCharacter
	| ws |
	ws := WriteStream on: self new.
	ws nextPut: aCharacter.
	^ws contents
!
