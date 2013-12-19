(reader defineClass: 'HttpServletRequest' superclass: 'st.gravel.lang.Object')
!
(reader propertyAt: 'javaClass' put: 'javax.servlet.http.HttpServletRequest')
!
(reader addMethod: '')
!
parameterAt: aKey
	<primitive: 'getParameter'>
	
!
(reader addMethod: '')
!
parameterNames
	<primitive: 'getParameterNames'>
	
!
