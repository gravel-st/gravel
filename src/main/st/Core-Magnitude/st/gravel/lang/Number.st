(reader defineClass: 'Number' superclass: 'st.gravel.lang.Magnitude')
!
(reader addMethod: 'testing')
!
even
	^self \\ 2 = 0
!
(reader addMethod: 'testing')
!
isNumber
	^true
!
(reader addMethod: 'arithmetic')
!
negated
	^0 - self
!
(reader addMethod: 'As yet unclassified')
!
negative
	^self < 0
!
(reader addMethod: 'As yet unclassified')
!
positive
	^self >= 0
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self subclassResponsibility
!
