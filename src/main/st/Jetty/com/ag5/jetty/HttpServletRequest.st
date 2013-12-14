(reader defineClass: 'HttpServletRequest' superclass: 'org.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'javax.servlet.http.HttpServletRequest')
!
(reader addMethod: 'gravel')
!
parameterAt: aKey
	<primitive: 'getParameter'>
	
!
(reader addMethod: 'gravel')
!
parameterNames
	<primitive: 'getParameterNames'>
	
!
