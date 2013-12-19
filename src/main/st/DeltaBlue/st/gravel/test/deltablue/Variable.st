(reader defineClass: 'Variable' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'value')
!
(reader addInstVar: 'constraints')
!
(reader addInstVar: 'determinedBy')
!
(reader addInstVar: 'walkStrength')
!
(reader addInstVar: 'stay')
!
(reader addInstVar: 'mark')
!
(reader addMethod: 'gravel')
!
addConstraint: aConstraint
	constraints add: aConstraint
!
(reader addMethod: 'gravel')
!
constraints
	^constraints
!
(reader addMethod: 'gravel')
!
determinedBy
	^determinedBy
!
(reader addMethod: 'gravel')
!
determinedBy: aConstraint
	determinedBy := aConstraint
!
(reader addMethod: 'gravel')
!
initialize
	value := 0.
	constraints := OrderedCollection new: 2.
	determinedBy := nil.
	walkStrength := Strength absoluteWeakest.
	stay := true.
	mark := 0
!
(reader addMethod: 'gravel')
!
longPrintOn: aStream
	self shortPrintOn: aStream.
	aStream nextPutAll: '   Constraints: '.
	constraints isEmpty
		ifTrue: 
			[aStream
				cr;
				tab;
				nextPutAll: 'none']
		ifFalse: 
			[constraints do: 
					[:c |
					aStream
						cr;
						tab.
					c shortPrintOn: aStream]].
	determinedBy isNil
		ifFalse: 
			[aStream
				cr;
				nextPutAll: '   Determined by: '.
			aStream
				cr;
				tab.
			determinedBy shortPrintOn: aStream].
	aStream cr
!
(reader addMethod: 'gravel')
!
mark
	^mark
!
(reader addMethod: 'gravel')
!
mark: markValue
	mark := markValue
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self shortPrintOn: aStream
!
(reader addMethod: 'gravel')
!
removeConstraint: c
	constraints remove: c ifAbsent: [].
	determinedBy == c ifTrue: [determinedBy := nil]
!
(reader addMethod: 'gravel')
!
setValue: aValue
	self setValue: aValue strength: #preferred
!
(reader addMethod: 'gravel')
!
setValue: aValue strength: strengthSymbol
	| editConstraint |
	editConstraint := EditConstraint var: self strength: strengthSymbol.
	editConstraint isSatisfied
		ifTrue: 
			[self value: aValue.
			Planner propagateFrom: self].
	editConstraint destroyConstraint
!
(reader addMethod: 'gravel')
!
shortPrintOn: aStream
	aStream nextPutAll: 'V(' , self asOop printString , ', '.
	aStream nextPutAll: walkStrength printString , ', '.
	stay isNil
		ifFalse: [aStream nextPutAll: (stay ifTrue: ['stay, '] ifFalse: ['changing, '])].
	aStream nextPutAll: value printString.
	aStream nextPutAll: ')'.
	aStream cr
!
(reader addMethod: 'gravel')
!
stay
	^stay
!
(reader addMethod: 'gravel')
!
stay: aBoolean
	stay := aBoolean
!
(reader addMethod: 'gravel')
!
value
	^value
!
(reader addMethod: 'gravel')
!
value: anObject
	value := anObject
!
(reader addMethod: 'gravel')
!
walkStrength
	^walkStrength
!
(reader addMethod: 'gravel')
!
walkStrength: aStrength
	walkStrength := aStrength
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
(reader addClassMethod: 'gravel')
!
value: aValue
	^(super new)
		initialize;
		value: aValue
!
