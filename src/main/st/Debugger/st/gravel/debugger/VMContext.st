(reader defineClass: 'VMContext' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'ip')
!
(reader addMethod: 'As yet unclassified')
!
incrementIP
	ip := ip + 1
!
(reader addMethod: 'initialize-release')
!
initialize
	ip := 0
!
(reader addMethod: 'As yet unclassified')
!
isFrame
	^false
!
