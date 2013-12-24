(reader defineClass: 'JVMDefinedObjectType' superclass: 'st.gravel.support.compiler.jvm.JVMNonPrimitiveType')
!
(reader addInstVar: 'path')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject and: [path = anObject path]
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitJVMDefinedObjectType: self
!
(reader addMethod: 'accessing')
!
className {^Str}
	^path joinWith: '/'
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithDefined: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithDefined: aJVMDefinedObjectType {^JVMDynamicObjectType | Self}
	self = aJVMDefinedObjectType ifTrue: [^self].
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithInt: aJVMIntType {JVMIntType} {^JVMType}
	self = JVMDefinedObjectType integer ifTrue: [^JVMDefinedObjectType integer].
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $L.
	path do: [:each {Str} | aStream nextPutAll: each] separatedBy: [aStream nextPut: $/].
	aStream nextPut: $;
!
(reader addMethod: 'accessing')
!
dottedClassName {^Str}
	^path joinWith: '.'
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash + path hash
!
(reader addMethod: 'initialize-release')
!
initializePath: anOrderedCollection {Arr[Str]} {^Self}
	path := anOrderedCollection.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isDefinedType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isObjectType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDefinedObject: anObject {JVMDefinedObjectType} {^CastTo}
	self = anObject ifTrue: [^IdentityCast new].
	^CastObjectToDefined type: self
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToDefined}
	^CastObjectToDefined type: self
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromDefinedObject: self
!
(reader addMethod: 'accessing')
!
path {^Arr[Str]}
	^path
!
(reader addMethod: 'accessing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self descriptorOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
withArgument: aJVMType {JVMType} {^JVMMethodType}
	^JVMMethodType returnType: self arguments: (Array with: aJVMType)
!
(reader addClassMethod: 'As yet unclassified')
!
bigDecimal {^JVMDefinedObjectType}
	^self className: 'java/math/BigDecimal'
!
(reader addClassMethod: 'As yet unclassified')
!
bigInteger {^JVMDefinedObjectType}
	^self className: 'java/math/BigInteger'
!
(reader addClassMethod: 'instance creation')
!
block: anInteger {Int} {^JVMDefinedObjectType}
	^JVMDefinedObjectType className: 'st/gravel/support/jvm/Block' , anInteger printString
!
(reader addClassMethod: 'As yet unclassified')
!
boolean {^JVMDefinedObjectType}
	^self className: 'java/lang/Boolean'
!
(reader addClassMethod: 'As yet unclassified')
!
character {^JVMDefinedObjectType}
	^self className: 'java/lang/Character'
!
(reader addClassMethod: 'As yet unclassified')
!
charBuffer {^JVMDefinedObjectType}
	^self className: 'java/nio/CharBuffer'
!
(reader addClassMethod: 'instance creation')
!
className: aString {Str} {^JVMDefinedObjectType}
	^self path: (aString tokensBasedOn: $/)
!
(reader addClassMethod: 'instance creation')
!
dottedClassName: aString {Str} {^JVMDefinedObjectType}
	^self path: (aString tokensBasedOn: $.)
!
(reader addClassMethod: 'As yet unclassified')
!
hashMap {^JVMDefinedObjectType}
	^self className: 'java/util/HashMap'
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, Arr[Str]]}
	^#('className' 'path')
!
(reader addClassMethod: 'As yet unclassified')
!
integer {^JVMDefinedObjectType}
	^self className: 'java/lang/Integer'
!
(reader addClassMethod: 'As yet unclassified')
!
nonLocalReturn {^JVMDefinedObjectType}
	^self className: 'st/gravel/support/jvm/NonLocalReturn'
!
(reader addClassMethod: 'As yet unclassified')
!
object {^JVMDefinedObjectType}
	^self className: 'java/lang/Object'
!
(reader addClassMethod: 'As yet unclassified')
!
objectClass {^JVMDefinedObjectType}
	^self className: 'st/gravel/support/jvm/ObjectClass'
!
(reader addClassMethod: 'instance creation')
!
path: anArray {Arr[Str]} {^JVMDefinedObjectType}
	^self new initializePath: anArray asArray
!
(reader addClassMethod: 'As yet unclassified')
!
runtimeException {^JVMDefinedObjectType}
	^self className: 'java/lang/RuntimeException'
!
(reader addClassMethod: 'As yet unclassified')
!
string {^JVMDefinedObjectType}
	^self className: 'java/lang/String'
!
(reader addClassMethod: 'As yet unclassified')
!
stringBuilder {^JVMDefinedObjectType}
	^self className: 'java/lang/StringBuilder'
!
(reader addClassMethod: 'As yet unclassified')
!
symbol {^JVMDefinedObjectType}
	^self className: 'st/gravel/core/Symbol'
!
