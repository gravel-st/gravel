(reader defineClass: 'Statement' superclass: 'st.gravel.support.compiler.ast.Node')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitStatement: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isTraitRequirementMessage {^Bool}
	^false
!
