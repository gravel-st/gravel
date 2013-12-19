(reader defineClass: 'SystemMappingCompilerTools' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
createInvokeInstruction: type {JVMDefinedObjectType} name: name {Str} numArgs: numArgs {Int} {^Invoke}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
evaluateBlock0Class: aClass {JavaClass} {^Object}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
findJavaClass: anArray {Arr[Sym]} {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
initializeClass: aClassMapping {ClassMapping} systemMapping: systemMapping {SystemMapping} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isAssignable: aClass {JavaClass} from: bClass {JavaClass} {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
javaClassSuperclass {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
jvmTypeForClass: aClass {JavaClass} {^JVMType}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
linkInNamespace: aClassMapping {ClassMapping} systemMapping: aSystemMapping {SystemMapping} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
methodHandleAt: aString {Str} numArgs: numArgs {Int} in: aJavaClass {JavaClass} identityClass: identityClass {JavaClass} isStatic: aBoolean {Bool} {^JavaMethodHandle}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
methodNamesIn: receiverClass {JavaClass} do: aBlock {[Str, ^Object]} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
newSingletonHolder: reference {AbsoluteReference} value: value {Obj} {^AlmostFinalValue}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
nextExtensionPostfix {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
nextNlrMarker {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
referenceAsClassName: aReference {Reference} {^Str}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
resetCallsites {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
superclassOf: aClass {JavaClass} {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
valueOfSingletonHolder: holder {AlmostFinalValue} {^Obj}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
writeClass: aJVMClass {JVMClass} {^JavaClass}
	^self subclassResponsibility
!
