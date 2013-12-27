(reader defineClass: 'JavaTestcaseClassWriter' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'root')
!
(reader addInstVar: 'systemNode')
!
(reader addMethod: 'initialize-release')
!
initializeRoot: anUnixFilename {Filename} systemNode: aSystemNode {SystemNode} {^Self}
	root := anUnixFilename.
	systemNode := aSystemNode.
	self initialize
!
(reader addMethod: 'accessing')
!
root {^Filename}
	^root
!
(reader addMethod: 'accessing')
!
systemNode {^SystemNode}
	^systemNode
!
(reader addMethod: 'As yet unclassified')
!
write {^Self}
	systemNode classDescriptionNodes
		do: [:each {ClassDescriptionNode} | each isSystemTest ifTrue: [self write: each]]
!
(reader addMethod: 'As yet unclassified')
!
write: aClassNode {ClassNode} {^Self}
	| testMethods {Arr[MethodNode]} wstr {WStream[Char]} className {Str} dir {Filename} |
	testMethods := aClassNode methods
				select: [:m {MethodNode} | m selector startsWith: 'test'].
	testMethods isEmpty ifTrue: [^self].
	className := aClassNode name asString.
	dir := root / 'st' / 'gravel' / 'systemtests'.
	dir ensureDirectoryExists.
	wstr := WriteStream on: String new.
	wstr
		nextPutAll: 'package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ';
		nextPutAll: className;
		nextPutAll: ' {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
'.
	testMethods do: 
			[:each {MethodNode} |
			wstr
				nextPutAll: '	@Test
	public void ';
				nextPutAll: each selector;
				nextPutAll: '() throws Throwable {
		MethodTools.debugTest("';
				nextPutAll: aClassNode reference printString;
				nextPutAll: '", "';
				nextPutAll: each selector;
				nextPutAll: '");
	}
'].
	wstr nextPutAll: '}'.
	wstr contents writeToFile: dir / (className , '.java')
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Filename, SystemNode]}
	^#('root' 'systemNode')
!
(reader addClassMethod: 'instance creation')
!
root: anUnixFilename {Filename} systemNode: aSystemNode {SystemNode} {^JavaTestcaseClassWriter}
	^self new initializeRoot: anUnixFilename systemNode: aSystemNode
!
