(reader defineClass: 'IntermediateNodeRewriterTest' superclass: 'org.gravel.sunit.TestCase')
!
(reader addMethod: 'As yet unclassified')
!
testInstVarAccessToFieldAccessConverter
	(VariableAccessToFieldAccessConverter
		instVarNames: #('x')
		owner: (VariableNode name: 'self')
		ownerReference: (Reference value: 'Foo')
		namespace: (Reference value: 'Foo')) visit: (NonLocalTempWritesToHolderConverter
					visit: (IntermediateNodeRewriter visit: (Parser parseMethod: 'foo ^x'))).
	(VariableAccessToFieldAccessConverter
		instVarNames: #('x')
		owner: (VariableNode name: 'self')
		ownerReference: (Reference value: 'Foo')
		namespace: (Reference value: 'Foo')) visit: (NonLocalTempWritesToHolderConverter
					visit: (IntermediateNodeRewriter visit: (Parser parseMethod: 'foo: bar x := bar')))
!
(reader addMethod: 'As yet unclassified')
!
testNonLocalVariableFinder1
	| method |
	method := Parser
				parseMethod: 'foo: bar 
| baz |
kaas aap.
		^[:boo | boo bar: bar baz: baz foo: foo]'.
	self assert: (NonLocalVariableFinder analyze: method) = #('kaas' 'foo')
!
(reader addMethod: 'As yet unclassified')
!
testNonLocalVariableFinder2
	| method |
	method := Parser
				parseMethod: 'foo: bar 
| baz |
self aap.
		^[:boo | boo bar: bar baz: baz foo: foo]'.
	self assert: (NonLocalVariableFinder analyze: method) = #('self' 'foo')
!
(reader addMethod: 'As yet unclassified')
!
testParseIdentityEquals
	NonLocalTempWritesToHolderConverter
		visit: (IntermediateNodeRewriter visit: (Parser parseMethod: 'foo: a bar: b ^a == b'))
!
