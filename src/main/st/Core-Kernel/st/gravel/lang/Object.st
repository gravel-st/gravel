(reader defineClass: 'Object' superclass: nil)
!
(reader propertyAt: 'javaClass' put: 'java.lang.Object')
!
(reader addMethod: 'comparing')
!
= anObject
	<squeak>
	^self == anObject
!
(reader addMethod: '')
!
== aMagnitude
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'identityEquals_')>
	
!
(reader addMethod: 'class membership')
!
class
	<primitive: #('org.gravel.support.jvm.ObjectExtensions' 'r_class')>
	<squeak>
	self primitiveFailed
!
(reader addMethod: 'copying')
!
copy
	^self shallowCopy postCopy
!
(reader addMethod: 'gravel')
!
doesNotUnderstand: aMessage
	(MessageNotUnderstood message: aMessage receiver: self) raise.
	^aMessage sentTo: self
!
(reader addMethod: 'gravel')
!
doesNotUnderstand: aSelector arguments: arguments
	^self doesNotUnderstand: (Message selector: aSelector arguments: arguments)
!
(reader addMethod: 'error handling')
!
error: aString
	^Error new signal: aString
!
(reader addMethod: 'gravel')
!
halt
	HaltInterrupt raiseSignal: 'Halt encountered.'
!
(reader addMethod: 'comparing')
!
hash
	<primitive: 'hashCode'>
	
!
(reader addMethod: 'gravel')
!
ifEmpty: aBlock
	self isEmpty ifTrue: [^aBlock value].
	^self
!
(reader addMethod: 'gravel')
!
ifNil: aBlock
	^self
!
(reader addMethod: 'gravel')
!
ifNil: nilBlock ifNotNil: notNilBlock
	^notNilBlock cull: self
!
(reader addMethod: 'gravel')
!
ifNotEmpty: aBlock
	self isEmpty ifFalse: [^aBlock cull: self].
	^self
!
(reader addMethod: 'gravel')
!
ifNotNil: aBlock
	^aBlock cull: self
!
(reader addMethod: 'gravel')
!
ifNotNil: notNilBlock ifNil: nilBlock
	^notNilBlock cull: self
!
(reader addMethod: 'gravel')
!
initialize
	
!
(reader addMethod: 'class membership')
!
isKindOf: aClass
	^self class == aClass or: [self class inheritsFrom: aClass]
!
(reader addMethod: 'class membership')
!
isMemberOf: aClass
	^self class == aClass
!
(reader addMethod: 'gravel')
!
isNil
	^false
!
(reader addMethod: 'gravel')
!
isNilOrEmpty
	^false
!
(reader addMethod: 'gravel')
!
isString
	^false
!
(reader addMethod: 'gravel')
!
notNil
	^true
!
(reader addMethod: '')
!
perform: aSymbol
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'perform_')>
	
!
(reader addMethod: '')
!
perform: aSymbol with: anObject
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'perform_with_')>
	
!
(reader addMethod: '')
!
perform: aSymbol with: firstObject with: secondObject
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'perform_with_with_')>
	
!
(reader addMethod: '')
!
perform: aSymbol with: firstObject with: secondObject with: thirdObject
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'perform_with_with_with_')>
	
!
(reader addMethod: '')
!
perform: selector withArguments: anArray
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'perform_withArguments_')>
	
!
(reader addMethod: 'copying')
!
postCopy
	
!
(reader addMethod: 'gravel')
!
printOn: aStream
	| title |
	title := self class title.
	aStream nextPutAll: ((title at: 1) isVowel ifTrue: ['an '] ifFalse: ['a ']).
	aStream nextPutAll: title
!
(reader addMethod: 'gravel')
!
printString
	| aStream |
	aStream := WriteStream on: String new.
	self printOn: aStream.
	^aStream contents
!
(reader addMethod: 'gravel')
!
release
	
!
(reader addMethod: 'copying')
!
shallowCopy
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'shallowCopy')>
	
!
(reader addMethod: 'error handling')
!
subclassResponsibility
	^self error: 'My subclass should have overridden this message'
!
(reader addMethod: 'gravel')
!
yourself
	^self
!
(reader addMethod: 'gravel')
!
~= anObject
	^(self = anObject) not
!
(reader addMethod: 'gravel')
!
~~ anObject
	^(self == anObject) not
!
(reader addClassMethod: '')
!
inheritsFrom: aClass
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'inheritsFrom_')>
	^super inheritsFrom: aClass
!
(reader addClassMethod: 'gravel')
!
new
	^self basicNew
!
(reader addClassMethod: '')
!
title
	<primitive: #('st.gravel.support.jvm.ObjectExtensions' 'classTitle')>
	
!
