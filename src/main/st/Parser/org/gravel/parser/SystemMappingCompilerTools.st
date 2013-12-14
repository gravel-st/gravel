(reader defineClass: 'SystemMappingCompilerTools' superclass: 'org.gravel.lang.Object')
!
(reader addMethod: 'As yet unclassified')
!
bindMethodHandle: methodHandle {JavaMethodHandle} to: object {Object} {^JavaMethodHandle}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
compileExtensionJavaClass: reference {Reference} prefix: namePrefix {Str} methods: methods {Array[MethodNode]} identityClass: identityClass {JavaClass} instVars: instVars {Arr[BoundVariableDeclarationNode]} allInstVars: allInstVars {Arr[BoundVariableDeclarationNode]} instVarOwners: instVarOwners {Dict[Reference, JavaClass]} sourceFile: sourceFile {SourceFile} {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
compileJavaClass: reference {Reference} name: aName {Str} superclass: aJavaClass {JavaClass} methods: methods {Array[MethodNode]} instVars: instVars {Arr[BoundVariableDeclarationNode]} allInstVars: allInstVars {Arr[BoundVariableDeclarationNode]} instVarOwners: instVarOwners {Dict[Reference, JavaClass]} sourceFile: sourceFile {SourceFile} {^JavaClass}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
evaluateExpression: expression {Expression} reference: reference {AbsoluteReference} {^Object}
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
