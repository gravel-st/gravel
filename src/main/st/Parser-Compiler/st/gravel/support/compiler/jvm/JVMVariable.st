(reader defineClass: 'JVMVariable' superclass: 'st.gravel.support.compiler.jvm.JVMNode')
!
(reader addInstVar: 'varName')
!
(reader addInstVar: 'type')
!
(reader addMethod: 'As yet unclassified')
!
asField: ownerType {JVMDefinedObjectType} isStatic: isStatic {Bool} {^JVMField}
	^JVMField
		ownerType: ownerType
		varName: varName
		type: type
		isStatic: isStatic
!
(reader addMethod: 'As yet unclassified')
!
asLocalDeclaration: index {Int} {^JVMLocalDeclaration}
	^JVMLocalDeclaration varName: varName type: type index: index
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^type
!
(reader addMethod: 'accessing')
!
varName {^Str}
	^varName
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, JVMType]}
	^#('varName' 'type')
!
