(reader defineClass: 'StateAccessNode' superclass: 'org.gravel.support.compiler.ast.IntermediateNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitStateAccessNode: self
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^VariableNode name: self name
!
