(reader defineClass: 'JVMMethodConstant' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'frame' type: 'Frame')
!
(reader addInstVar: 'ownerType' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'type' type: 'JVMType')
!
(reader addInstVar: 'expression' type: 'Expression')
!
(reader addMethod: 'As yet unclassified')
!
asReadInstruction {^GetStatic}
	^GetStatic
		ownerType: ownerType
		name: name
		type: self type
!
(reader addMethod: 'As yet unclassified')
!
clinitInstructions {^Arr[JVMInstruction]}
	^Array with: frame with: (PutStatic ownerType: ownerType name: name type: type)
!
(reader addMethod: 'accessing')
!
expression {^Expression}
	^expression
!
(reader addMethod: 'As yet unclassified')
!
fieldDefinition {^JVMField}
	^JVMField
		ownerType: ownerType
		varName: name
		type: type
		isStatic: true
!
(reader addMethod: 'accessing')
!
frame {^Frame}
	^frame
!
(reader addMethod: 'initialize-release')
!
initializeExpression: anExpression {Expression} name: aString {Str} frame: aFrame {Frame} ownerType: aJVMDefinedObjectType {JVMDefinedObjectType} type: aType {JVMType} {^Self}
	expression := anExpression.
	name := aString.
	frame := aFrame.
	ownerType := aJVMDefinedObjectType.
	type := aType.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^frame type
!
(reader addClassMethod: 'instance creation')
!
expression: anExpression {Expression} name: aString {Str} frame: aFrame {Frame} ownerType: aJVMDefinedObjectType {JVMDefinedObjectType} {^JVMMethodConstant}
	^self
		expression: anExpression
		name: aString
		frame: aFrame
		ownerType: aJVMDefinedObjectType
		type: aFrame endStack peek
!
(reader addClassMethod: 'instance creation')
!
expression: anExpression {Expression} name: aString {Str} frame: aFrame {Frame} ownerType: ownerType {JVMDefinedObjectType} type: type {JVMType} {^JVMMethodConstant}
	self assert: ownerType notNil.
	^self new
		initializeExpression: anExpression
		name: aString
		frame: aFrame
		ownerType: ownerType
		type: type
!
