(reader defineClass: 'StHttpServlet' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'gravel')
!
doGet: aRequest response: aResponse
	aResponse contentType: 'text/html'.
	aResponse status: 500.
	aResponse writer println: 'SubclassResponsibility'
!
(reader addMethod: 'gravel')
!
doPost: aRequest response: aResponse
	aResponse contentType: 'text/html'.
	aResponse status: 500.
	aResponse writer println: 'SubclassResponsibility'
!
