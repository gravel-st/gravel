(reader defineClass: 'ExceptionSet' superclass: 'st.gravel.lang.Object')
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
handles: anException
	self do: [:exp | (exp handles: anException) ifTrue: [^true]].
	^false
!
