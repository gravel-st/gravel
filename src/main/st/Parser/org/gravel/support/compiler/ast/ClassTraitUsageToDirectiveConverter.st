(reader defineClass: 'ClassTraitUsageToDirectiveConverter' superclass: 'org.gravel.support.compiler.ast.AbstractTraitUsageToDirectiveConverter')
!
(reader addMethod: 'visiting')
!
produceSimpleNoMethod: aSimpleTraitUsageNode {SimpleTraitUsageNode} {^Arr[Node]}
	^Array with: (self reader send: 'addSimpleClassTrait:'
				with: (StringLiteralNode value: aSimpleTraitUsageNode reference printString))
!
