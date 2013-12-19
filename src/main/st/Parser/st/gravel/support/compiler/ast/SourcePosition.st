(reader defineClass: 'SourcePosition' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'sourceFile')
!
(reader addInstVar: 'start')
!
(reader addInstVar: 'stop')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^self == anObject or: 
			[self class = anObject class and: 
					[sourceFile = anObject sourceFile
						and: [start = anObject start and: [stop = anObject stop]]]]
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^((self class hash bitXor: sourceFile hash) bitXor: start hash) bitXor: stop hash
!
(reader addMethod: 'initialize-release')
!
initializeSourceFile: aSourceFile {SourceFile} start: anInteger {Int} stop: anInteger2 {Int} {^Self}
	sourceFile := aSourceFile.
	start := anInteger.
	stop := anInteger2.
	self initialize
!
(reader addMethod: 'accessing')
!
sourceFile {^SourceFile}
	^sourceFile
!
(reader addMethod: 'accessing')
!
start {^Int}
	^start
!
(reader addMethod: 'accessing')
!
stop {^Int}
	^stop
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SourceFile, Int, Int]}
	^#('sourceFile' 'start' 'stop')
!
(reader addClassMethod: 'instance creation')
!
sourceFile: aSourceFile {SourceFile} start: anInteger {Int} stop: anInteger2 {Int} {^SourcePosition}
	^self new initializeSourceFile: aSourceFile start: anInteger stop: anInteger2
!
