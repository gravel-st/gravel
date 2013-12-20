(reader defineClass: 'ExceptionSet' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.AddableCollection class')
!
(reader addInstVar: 'handlers')
!
(reader addMethod: 'gravel')
!
, anExceptionSelector
	^(self copy)
		add: anExceptionSelector;
		yourself
!
(reader addMethod: 'gravel')
!
accepts: anExceptionCreator
	self do: [:exp | (exp accepts: anExceptionCreator) ifTrue: [^true]].
	^false
!
(reader addMethod: 'gravel')
!
add: aHandler
	handlers add: aHandler
!
(reader addMethod: 'gravel')
!
do: aBlock
	handlers do: aBlock
!
(reader addMethod: 'gravel')
!
handles: anException
	self do: [:exp | (exp handles: anException) ifTrue: [^true]].
	^false
!
(reader addMethod: 'gravel')
!
initialize
	super initialize.
	handlers := OrderedCollection new
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
