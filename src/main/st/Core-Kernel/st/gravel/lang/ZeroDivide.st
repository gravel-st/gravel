(reader defineClass: 'ZeroDivide' superclass: 'st.gravel.lang.Error')
!
(reader addInstVar: 'dividend')
!
(reader addMethod: 'accessing')
!
dividend
	^dividend
!
(reader addMethod: 'accessing')
!
dividend: argument
	dividend := argument
!
(reader addMethod: 'accessing')
!
isResumable
	^true
!
(reader addClassMethod: 'instance creation')
!
dividend: argument
	^(self new)
		dividend: argument;
		yourself
!
