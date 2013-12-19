(reader defineTrait: 'Array' superclass: nil)
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.ArrayedCollection')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.ArrayedCollection class')
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^JavaArray
!
(reader addClassMethod: 'As yet unclassified')
!
withSize: size
	^self defaultImplementation new: size
!
