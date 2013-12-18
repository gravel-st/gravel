(reader defineClass: 'SelectorConverterTest' superclass: 'org.gravel.sunit.TestCase')
!
(reader addMethod: 'As yet unclassified')
!
testSelectorConverter
	| sc |
	sc := SelectorConverter new.
	Core.Symbol table allSymbolsDo: 
			[:sym |
			| fn fns dfn |
			fn := sc selectorAsFunctionName: sym.
			self assert: (sc functionNameAsSelector: fn) = sym.
			fns := fn asSymbol.
			dfn := sc selectorAsFunctionName: fns.
			self assert: (sc functionNameAsSelector: dfn) = fns]
!
