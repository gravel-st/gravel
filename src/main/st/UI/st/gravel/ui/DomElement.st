(reader defineClass: 'DomElement' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'type')
!
(reader addInstVar: 'attributes')
!
(reader addInstVar: 'children')
!
(reader addMethod: 'gravel')
!
appendChild: aJSElement
	children add: aJSElement
!
(reader addMethod: 'gravel')
!
initialize
	attributes := Dictionary new.
	children := OrderedCollection new
!
(reader addMethod: 'gravel')
!
initializeType: aSymbol
	type := aSymbol.
	self initialize
!
(reader addMethod: 'gravel')
!
setAttribute: aKey _: aValue
	attributes at: aKey put: aValue
!
(reader addMethod: 'gravel')
!
type
	^type
!
(reader addClassMethod: 'gravel')
!
createElement: aSymbol
	^self type: aSymbol
!
(reader addClassMethod: 'gravel')
!
type: aSymbol
	^self new initializeType: aSymbol
!
