(reader defineClass: 'SourceFile' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'directory')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'packageName')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^self == anObject or: [self class = anObject class and: [name = anObject name]]
!
(reader addMethod: 'initialize-release')
!
asFile {^Filename}
	^directory asFilename / name
!
(reader addMethod: 'accessing')
!
from: start {Int} to: stop {Int} {^SourcePosition}
	^SourcePosition sourceFile: self start: start stop: stop
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^self class hash bitXor: name hash
!
(reader addMethod: 'initialize-release')
!
initializeDirectory: aDirectory {Str} name: aName {Str} packageName: anObject {Sym} {^Self}
	directory := aDirectory.
	name := aName.
	packageName := anObject.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
packageName {^Sym}
	^packageName
!
(reader addClassMethod: 'instance creation')
!
directory: directory {Str} name: aName {Str} packageName: packageName {Sym} {^SourceFile}
	^self new initializeDirectory: directory name: aName packageName: packageName
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, Str, Sym]}
	^#('directory' 'name' 'packageName')
!
