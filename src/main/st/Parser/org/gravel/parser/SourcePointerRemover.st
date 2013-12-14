(reader defineClass: 'SourcePointerRemover' superclass: 'org.gravel.parser.NodeCopier')
!
(reader addMethod: 'visiting')
!
visit: anObject {Node} {^Node}
	| newNode {Node} |
	anObject isNil ifTrue: [^nil].
	newNode := anObject accept: self.
	newNode isNil ifTrue: [^nil].
	^newNode withSourcePosition: nil
!
