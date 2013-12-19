(reader defineClass: 'Stdout' superclass: 'st.gravel.lang.TextCollectorOutput')
!
(reader addMethod: '')
!
show: aString
	<primitive: #('st.gravel.support.jvm.TranscriptExtensions' 'show_')>
	
!
