(reader defineClass: 'ValueHolder' superclass: 'org.gravel.ui.ValueModel')
!
(reader addInstVar: 'contents')
!
(reader addMethod: 'gravel')
!
initializeValue: aValue
	contents := aValue.
	self initialize
!
(reader addMethod: 'gravel')
!
value
	^contents
!
(reader addMethod: 'gravel')
!
value: anObject
	contents = anObject ifTrue: [^self].
	contents := anObject.
	self contentsChanged: contents
!
(reader addClassMethod: 'gravel')
!
on: aValue
	^self new initializeValue: aValue
!
