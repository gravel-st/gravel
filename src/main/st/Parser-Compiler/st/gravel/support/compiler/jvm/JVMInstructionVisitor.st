(reader defineClass: 'JVMInstructionVisitor' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visit: anObject {JVMInstruction} {^X}
	^anObject accept: self
!
(reader addMethod: 'visiting')
!
visitALoad: anObject {ALoad} {^X}
	^self visitLoad: anObject
!
(reader addMethod: 'visiting')
!
visitAndThenElse: anObject {AndThenElse} {^X}
	^self visitFork: anObject
!
(reader addMethod: 'visiting')
!
visitAReturn: anObject {AReturn} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitArrayLength: anObject {ArrayLength} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitAStore: anObject {AStore} {^X}
	^self visitStore: anObject
!
(reader addMethod: 'visiting')
!
visitAThrow: anObject {AThrow} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitByteArrayStore: anObject {ByteArrayStore} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitCastArrayToObject: anObject {CastArrayToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastBooleanToObject: anObject {CastBooleanToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastCharToObject: anObject {CastCharToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastDefinedToObject: anObject {CastDefinedToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastFloatToObject: anObject {CastFloatToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastIntToObject: anObject {CastIntToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastLongToObject: anObject {CastLongToObject} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToArray: anObject {CastObjectToArray} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToBoolean: anObject {CastObjectToBoolean} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToByte: anObject {CastObjectToByte} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToChar: anObject {CastObjectToChar} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToDefined: anObject {CastObjectToDefined} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToFloat: anObject {CastObjectToFloat} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToInt: anObject {CastObjectToInt} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToLong: anObject {CastObjectToLong} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastObjectToShort: anObject {CastObjectToShort} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitCastTo: anObject {CastTo} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDup: anObject {Dup} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDupX1: anObject {DupX1} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDupX2: anObject {DupX2} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicFieldRead: anObject {DynamicFieldRead} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicFieldWrite: anObject {DynamicFieldWrite} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalRead: anObject {DynamicGlobalRead} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalWrite: anObject {DynamicGlobalWrite} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicMessageSend: anObject {DynamicMessageSend} {^X}
	^self visitDynamicSend: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicSend: anObject {DynamicSend} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicSuperSend: anObject {DynamicSuperSend} {^X}
	^self visitDynamicSend: anObject
!
(reader addMethod: 'visiting')
!
visitFork: anObject {Fork} {^X}
	^self visitJVMControlFlowInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitFrame: anObject {Frame} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitGetField: anObject {GetField} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitGetStatic: anObject {GetStatic} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitIdentityCast: anObject {IdentityCast} {^X}
	^self visitCastTo: anObject
!
(reader addMethod: 'visiting')
!
visitIfBooleanObjectThenElse: anObject {IfBooleanObjectThenElse} {^X}
	^self visitIfThenElse: anObject
!
(reader addMethod: 'visiting')
!
visitIfBooleanValueThenElse: anObject {IfBooleanValueThenElse} {^X}
	^self visitIfThenElse: anObject
!
(reader addMethod: 'visiting')
!
visitIfObjectIsNullThenElse: anObject {IfObjectIsNullThenElse} {^X}
	^self visitFork: anObject
!
(reader addMethod: 'visiting')
!
visitIfObjectsEqualThenElse: anObject {IfObjectsEqualThenElse} {^X}
	^self visitFork: anObject
!
(reader addMethod: 'visiting')
!
visitIfThenElse: anObject {IfThenElse} {^X}
	^self visitFork: anObject
!
(reader addMethod: 'visiting')
!
visitILoad: anObject {ILoad} {^X}
	^self visitLoad: anObject
!
(reader addMethod: 'visiting')
!
visitIncrementLocal: anObject {IncrementLocal} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeInterface: anObject {InvokeInterface} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeSpecial: anObject {InvokeSpecial} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeStatic: anObject {InvokeStatic} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeVirtual: anObject {InvokeVirtual} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitIStore: anObject {IStore} {^X}
	^self visitStore: anObject
!
(reader addMethod: 'visiting')
!
visitJVMControlFlowInstruction: anObject {JVMControlFlowInstruction} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitJVMInstruction: anObject {JVMInstruction} {^X}
	^self error: 'VisitorError'
!
(reader addMethod: 'visiting')
!
visitLabelLineNumber: anObject {LabelLineNumber} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitLoad: anObject {Load} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitLoop: anObject {Loop} {^X}
	^self visitJVMControlFlowInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitNewArray: anObject {NewArray} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitNewInstance: anObject {NewInstance} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitObjectArrayLoad: anObject {ObjectArrayLoad} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitObjectArrayStore: anObject {ObjectArrayStore} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitOrThenElse: anObject {OrThenElse} {^X}
	^self visitFork: anObject
!
(reader addMethod: 'visiting')
!
visitPop: anObject {Pop} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitPushBoolean: anObject {PushBoolean} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushChar: anObject {PushChar} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushConstant: anObject {PushConstant} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitPushFalse: anObject {PushFalse} {^X}
	^self visitPushBoolean: anObject
!
(reader addMethod: 'visiting')
!
visitPushFloat: anObject {PushFloat} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushInt: anObject {PushInt} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushNull: anObject {PushNull} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushString: anObject {PushString} {^X}
	^self visitPushConstant: anObject
!
(reader addMethod: 'visiting')
!
visitPushTrue: anObject {PushTrue} {^X}
	^self visitPushBoolean: anObject
!
(reader addMethod: 'visiting')
!
visitPutField: anObject {PutField} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitPutStatic: anObject {PutStatic} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitReturn: anObject {Return} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitStore: anObject {Store} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitSubtract: anObject {Subtract} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitTryCatch: anObject {TryCatch} {^X}
	^self visitJVMControlFlowInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitWhileFalseLoop: anObject {WhileFalseLoop} {^X}
	^self visitWhileLoop: anObject
!
(reader addMethod: 'visiting')
!
visitWhileGreaterThanLoop: anObject {WhileGreaterThanLoop} {^X}
	^self visitWhileLoop: anObject
!
(reader addMethod: 'visiting')
!
visitWhileLessThanLoop: anObject {WhileLessThanLoop} {^X}
	^self visitWhileLoop: anObject
!
(reader addMethod: 'visiting')
!
visitWhileLoop: anObject {WhileLoop} {^X}
	^self visitLoop: anObject
!
(reader addMethod: 'visiting')
!
visitWhileTrueLoop: anObject {WhileTrueLoop} {^X}
	^self visitWhileLoop: anObject
!
(reader addClassMethod: 'instance creation')
!
typeParameters
	^#(#X)
!
