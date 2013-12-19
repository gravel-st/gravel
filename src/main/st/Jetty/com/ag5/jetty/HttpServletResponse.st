(reader defineClass: 'HttpServletResponse' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'javax.servlet.http.HttpServletResponse')
!
(reader addMethod: '')
!
contentType: aString
	<primitive: 'setContentType'>
	
!
(reader addMethod: '')
!
sendRedirect: url
	<primitive: 'sendRedirect'>
	
!
(reader addMethod: '')
!
status: statusCode
	<primitive: 'setStatus'>
	
!
(reader addMethod: '')
!
writer
	<primitive: 'getWriter'>
	^WriteStream on: String new
!
