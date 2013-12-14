(reader defineClass: 'BrowserApplicationTest' superclass: 'org.gravel.sunit.TestCase')
!
(reader addMethod: 'As yet unclassified')
!
testRender
	| servlet session |
	servlet := BrowserApplication asServlet.
	session := servlet sessionOrNewAt: nil.
	session writeResponseString
!
(reader addMethod: 'As yet unclassified')
!
testSelect
	| servlet session pkgName |
	servlet := BrowserApplication asServlet.
	session := servlet sessionOrNewAt: nil.
	session writeResponseString.
	pkgName := session application packageNames second.
	session application browsePackage: pkgName.
	session writeResponseString
!
