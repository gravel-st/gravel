(reader defineTrait: 'CollectionFactory' superclass: nil)
!
(reader addClassMethod: 'gravel')
!
defaultImplementation
	^self traitRequirement
!
(reader addClassMethod: 'gravel')
!
new
	^self defaultImplementation newImpl
!
(reader addClassMethod: 'gravel')
!
new: initialSize
	^self defaultImplementation newImpl: initialSize
!
(reader addClassMethod: 'gravel')
!
newImpl
	^self newImpl: 0
!
(reader addClassMethod: 'gravel')
!
newImpl: initialSize
	^self traitRequirement
!
(reader addClassMethod: 'gravel')
!
ofSize: n
	^self new: n
!
