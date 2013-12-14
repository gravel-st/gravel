(reader defineClass: 'InterpreterTest' superclass: 'org.gravel.sunit.TestCase')
!
(reader addMethod: 'As yet unclassified')
!
testInterpreter1
	self assert: (Interpreter evaluate: '3+4') = 7
!
(reader addMethod: 'As yet unclassified')
!
testInterpreterTwoArgBlock
	self assert: (Interpreter evaluate: '[:a :b | a + b] value: 3 value: 4') = 7
!
