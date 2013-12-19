(reader defineTrait: 'ArrayedCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.IndexedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.AddableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.IndexedCollection class')
!
(reader addClassMethod: 'instance creation')
!
new: size withAll: value
	^(self new: size) atAllPut: value
!
(reader addClassMethod: 'instance creation')
!
with: arg1
	^(self new: 1)
		at: 1 put: arg1;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2
	^(self new: 2)
		at: 1 put: arg1;
		at: 2 put: arg2;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3
	^(self new: 3)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4
	^(self new: 4)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5
	^(self new: 5)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6
	^(self new: 6)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		at: 6 put: arg6;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7
	^(self new: 7)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		at: 6 put: arg6;
		at: 7 put: arg7;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8
	^(self new: 8)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		at: 6 put: arg6;
		at: 7 put: arg7;
		at: 8 put: arg8;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9
	^(self new: 9)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		at: 6 put: arg6;
		at: 7 put: arg7;
		at: 8 put: arg8;
		at: 9 put: arg9;
		yourself
!
(reader addClassMethod: 'instance creation')
!
with: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10
	^(self new: 10)
		at: 1 put: arg1;
		at: 2 put: arg2;
		at: 3 put: arg3;
		at: 4 put: arg4;
		at: 5 put: arg5;
		at: 6 put: arg6;
		at: 7 put: arg7;
		at: 8 put: arg8;
		at: 9 put: arg9;
		at: 10 put: arg10;
		yourself
!
(reader addClassMethod: 'instance creation')
!
withAll: aCollection
	| newCollection index |
	newCollection := self new: aCollection size.
	index := 0.
	aCollection do: [:element | newCollection at: (index := index + 1) put: element].
	^newCollection
!
