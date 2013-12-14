(reader defineClass: 'Stdout' superclass: 'org.gravel.lang.TextCollectorOutput')
!
(reader addMethod: 'As yet unclassified')
!
show: aString
	<primitive: #('org.gravel.support.jvm.TranscriptExtensions' 'show_')>
	
!
