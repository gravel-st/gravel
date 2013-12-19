(reader defineClass: 'Packet' superclass: 'st.gravel.tests.richards.RBObject')
!
(reader addInstVar: 'link')
!
(reader addInstVar: 'identity')
!
(reader addInstVar: 'kind')
!
(reader addInstVar: 'datum')
!
(reader addInstVar: 'data')
!
(reader addMethod: 'accessing')
!
data
	^data
!
(reader addMethod: 'accessing')
!
datum
	^datum
!
(reader addMethod: 'accessing')
!
datum: someData
	datum := someData
!
(reader addMethod: 'accessing')
!
identity
	^identity
!
(reader addMethod: 'accessing')
!
identity: anIdentity
	identity := anIdentity
!
(reader addMethod: 'accessing')
!
kind
	^kind
!
(reader addMethod: 'accessing')
!
link
	^link
!
(reader addMethod: 'accessing')
!
link: aWorkQueue
	link := aWorkQueue
!
(reader addMethod: 'initialize')
!
link: aLink identity: anIdentity kind: aKind
	link := aLink.
	identity := anIdentity.
	kind := aKind.
	datum := 1.
	data := Array new: 4 withAll: 0
!
(reader addClassMethod: 'instance creation')
!
create: link identity: identity kind: kind
	^super new link: link identity: identity kind: kind
!
