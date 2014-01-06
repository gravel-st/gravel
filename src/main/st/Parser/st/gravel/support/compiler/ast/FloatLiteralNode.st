(reader defineClass: 'FloatLiteralNode' superclass: 'st.gravel.support.compiler.ast.LimitedPrecisionRealLiteralNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitFloatLiteralNode: self
!
(reader addMethod: 'As yet unclassified')
!
negated {^FloatLiteralNode}
	valueString first = $- ifTrue: [^FloatLiteralNode valueString: (valueString copyFrom: 2)].
	^FloatLiteralNode valueString: '-' , valueString
!
(reader addMethod: 'accessing')
!
value {^Object}
	^valueString parseFloat
!
