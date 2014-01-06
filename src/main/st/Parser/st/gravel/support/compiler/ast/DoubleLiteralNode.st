(reader defineClass: 'DoubleLiteralNode' superclass: 'st.gravel.support.compiler.ast.LimitedPrecisionRealLiteralNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitDoubleLiteralNode: self
!
(reader addMethod: 'As yet unclassified')
!
negated {^DoubleLiteralNode}
	valueString first = $-
		ifTrue: [^DoubleLiteralNode valueString: (valueString copyFrom: 2)].
	^DoubleLiteralNode valueString: '-' , valueString
!
(reader addMethod: 'accessing')
!
value {^Object}
	^valueString parseDouble
!
(reader addClassMethod: 'constants')
!
postfixCharacter {^Char}
	^$d
!
