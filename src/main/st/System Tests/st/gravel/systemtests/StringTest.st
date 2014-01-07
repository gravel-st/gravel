(reader defineClass: 'StringTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'gravel')
!
testPrintInteger
	self assert: 0 asString = '0'.
	self assert: 1 asString = '1'.
	self assert: -1 asString = '-1'.
	self assert: -123452345234523452345234 asString = '-123452345234523452345234'.
	self assert: 5348734987348572934572435345 asString = '5348734987348572934572435345'
!
(reader addMethod: 'gravel')
!
testStringEquals
	self assert: 'abc' = ('ab' , 'c')
!
(reader addMethod: 'gravel')
!
testUnicodeRange
	0 to: 1114112
		do: 
			[:i |
			| ch str |
			ch := Character codePoint: i.
			str := String with: ch.
			self assert: str size = 1.
			self assert: str first = ch.
			self assert: str first codePoint = i]
!
