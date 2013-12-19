(reader defineClass: 'DiffVisitor' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visit: anObject {ClassDiff} {^Self}
	anObject accept: self
!
(reader addMethod: 'visiting')
!
visitAddClassDiff: anObject {AddClassDiff} {^Self}
	^self visitNewClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitClassDiff: anObject {ClassDiff} {^Self}
	^NodeVisitorError raise
!
(reader addMethod: 'visiting')
!
visitNewClassDiff: anObject {NewClassDiff} {^Self}
	^self visitClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitRemoveClassDiff: anObject {RemoveClassDiff} {^Self}
	^self visitClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitUpdateClassDiff: anObject {UpdateClassDiff} {^Self}
	^self visitClassDiff: anObject
!
(reader addMethod: 'visiting')
!
visitWrapJavaclassDiff: anObject {WrapJavaclassDiff} {^Self}
	^self visitNewClassDiff: anObject
!
