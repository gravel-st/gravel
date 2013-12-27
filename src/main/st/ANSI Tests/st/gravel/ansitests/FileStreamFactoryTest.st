(reader defineClass: 'FileStreamFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_read_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue read: self parameterAString.
			self assert: (self valueIsKindOfReadFileStream: res)]
!
(reader addMethod: 'tests')
!
test_read_type_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue read: self parameterFileId type: self parameterFileType.
			self assert: (self valueIsKindOfReadFileStream: res)]
!
(reader addMethod: 'tests')
!
test_write_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue write: self parameterFileId.
			self assert: (self valueIsKindOfWriteFileStream: res)]
!
(reader addMethod: 'tests')
!
test_write_mode_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue write: self parameterMode mode: self parameterFileId.
			self assert: (self valueIsKindOfWriteFileStream: res)]
!
(reader addMethod: 'tests')
!
test_write_mode_check_type_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						write: self parameterMode
						mode: self parameterCheck
						check: self parameterFileID
						type: self parameterFileType.
			self assert: (self valueIsKindOfWriteFileStream: res)]
!
(reader addClassMethod: 'testing')
!
isAbstract
	^true
!
