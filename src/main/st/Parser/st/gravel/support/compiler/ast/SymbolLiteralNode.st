(reader defineClass: 'SymbolLiteralNode' superclass: 'st.gravel.support.compiler.ast.LiteralNode')
!
(reader addInstVar: 'value' type: 'Symbol')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [value = anObject value]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSymbolLiteralNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeValue: aSymbol {Symbol} {^Self}
	value := aSymbol.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream print: value
!
(reader addMethod: 'As yet unclassified')
!
isSymbolLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^Symbol}
	^value
!
(reader addClassMethod: 'instance creation')
!
value: aSymbol {Symbol} {^Instance}
	^self new initializeValue: aSymbol
!
