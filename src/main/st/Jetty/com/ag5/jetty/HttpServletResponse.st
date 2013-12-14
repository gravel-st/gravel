(reader defineClass: 'HttpServletResponse' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'javax.servlet.http.HttpServletResponse')
!
(reader addMethod: 'gravel')
!
contentType: aString
	<primitive: 'setContentType'>
	
!
(reader addMethod: 'gravel')
!
sendRedirect: url
	<primitive: 'sendRedirect'>
	
!
(reader addMethod: 'gravel')
!
status: statusCode
	<primitive: 'setStatus'>
	
!
(reader addMethod: 'gravel')
!
writer
	<primitive: 'getWriter'>
	^WriteStream on: String new
!
