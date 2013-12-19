(reader defineClass: 'TraitUsageToDirectiveConverter' superclass: 'org.gravel.support.compiler.ast.AbstractTraitUsageToDirectiveConverter')
!
(reader addMethod: 'visiting')
!
produceSimpleNoMethod: aSimpleTraitUsageNode {SimpleTraitUsageNode} {^Arr[Node]}
	^Array with: (self reader send: 'addSimpleTrait:'
				with: (StringLiteralNode value: aSimpleTraitUsageNode reference printString))
!
