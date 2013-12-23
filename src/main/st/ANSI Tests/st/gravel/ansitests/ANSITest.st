(reader defineClass: 'ANSITest' superclass: 'st.gravel.sunit.TestCase')
!
(reader addMethod: 'tests')
!
valueIsKindOfAbstractDictionary: aValue
	^aValue class = Dictionary
!
(reader addMethod: 'tests')
!
valueIsKindOfANY: aValue
	^aValue class = Object
!
(reader addMethod: 'tests')
!
valueIsKindOfArray: aValue
	^aValue class = Array
!
(reader addMethod: 'tests')
!
valueIsKindOfArrayFactory: aValue
	^aValue class = Array class
!
(reader addMethod: 'tests')
!
valueIsKindOfBag: aValue
	^aValue class = Bag
!
(reader addMethod: 'tests')
!
valueIsKindOfBagFactory: aValue
	^aValue class = Bag class
!
(reader addMethod: 'tests')
!
valueIsKindOfBoolean: aValue
	^aValue class = Boolean
!
(reader addMethod: 'tests')
!
valueIsKindOfByteArray: aValue
	^aValue class = ByteArray
!
(reader addMethod: 'tests')
!
valueIsKindOfByteArrayFactory: aValue
	^aValue class = ByteArray class
!
(reader addMethod: 'tests')
!
valueIsKindOfCharacter: aValue
	^aValue class = Character
!
(reader addMethod: 'tests')
!
valueIsKindOfCharacterFactory: aValue
	^aValue class = Character class
!
(reader addMethod: 'tests')
!
valueIsKindOfClassDescription: aValue
	^aValue class = ClassDescription
!
(reader addMethod: 'tests')
!
valueIsKindOfCollection: aValue
	^aValue class = Collection
!
(reader addMethod: 'tests')
!
valueIsKindOfCollectionFactory: aValue
	^aValue class = Collection class
!
(reader addMethod: 'tests')
!
valueIsKindOfCollectionStream: aValue
	^aValue class = PositionableStream
!
(reader addMethod: 'tests')
!
valueIsKindOfDateAndTime: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfDateAndTimeFactory: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfDictionary: aValue
	^aValue class = Dictionary
!
(reader addMethod: 'tests')
!
valueIsKindOfDictionaryFactory: aValue
	^aValue class = Dictionary class
!
(reader addMethod: 'tests')
!
valueIsKindOfDuration: aValue
	^aValue class = Duration
!
(reader addMethod: 'tests')
!
valueIsKindOfDurationFactory: aValue
	^aValue class = Duration class
!
(reader addMethod: 'tests')
!
valueIsKindOfDyadicValuable: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfError: aValue
	^aValue class = Error
!
(reader addMethod: 'tests')
!
valueIsKindOfErrorClass: aValue
	^aValue class = Error class
!
(reader addMethod: 'tests')
!
valueIsKindOfException: aValue
	^aValue class = Exception
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionBuilder: aValue
	^aValue class = Exception
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionClass: aValue
	^aValue class = Exception class
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionDescription: aValue
	^aValue class = Exception
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionInstantiator: aValue
	^aValue class = Exception class
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionSelector: aValue
	^aValue class = Exception class
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionSet: aValue
	^aValue class = ExceptionSet
!
(reader addMethod: 'tests')
!
valueIsKindOfExceptionSignaler: aValue
	^aValue class = Exception
!
(reader addMethod: 'tests')
!
valueIsKindOfExtensibleCollection: aValue
	^aValue class = Set
		or: [aValue class = String or: [aValue class = Bag or: [aValue class = OrderedCollection]]]
!
(reader addMethod: 'tests')
!
valueIsKindOfFailedMessage: aValue
	^aValue class = Message
!
(reader addMethod: 'tests')
!
valueIsKindOfFileStream: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfFileStreamFactory: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfFloat: aValue
	^aValue class = Float
!
(reader addMethod: 'tests')
!
valueIsKindOfFloatCharacterization: aValue
	^aValue class = Float class
!
(reader addMethod: 'tests')
!
valueIsKindOfFraction: aValue
	^aValue class = Fraction
!
(reader addMethod: 'tests')
!
valueIsKindOfFractionFactory: aValue
	^aValue class = Fraction class
!
(reader addMethod: 'tests')
!
valueIsKindOfGettableStream: aValue
	^aValue class = PositionableStream
!
(reader addMethod: 'tests')
!
valueIsKindOfIdentityDictionary: aValue
	^aValue class = IdentityDictionary
!
(reader addMethod: 'tests')
!
valueIsKindOfIdentityDictionaryFactory: aValue
	^aValue class = IdentityDictionary class
!
(reader addMethod: 'tests')
!
valueIsKindOfInitializableCollectionFactory: aValue
	^aValue class = Set class or: 
			[aValue class = ArrayedCollection class
				or: [aValue class = Bag class or: [aValue class = OrderedCollection class]]]
!
(reader addMethod: 'tests')
!
valueIsKindOfInstantiator: aValue
	^aValue class = Object class
!
(reader addMethod: 'tests')
!
valueIsKindOfInteger: aValue
	^aValue class = Integer
!
(reader addMethod: 'tests')
!
valueIsKindOfInterval: aValue
	^aValue class = Interval
!
(reader addMethod: 'tests')
!
valueIsKindOfIntervalFactory: aValue
	^aValue class = Interval class
!
(reader addMethod: 'tests')
!
valueIsKindOfMagnitude: aValue
	^aValue class = Magnitude
!
(reader addMethod: 'tests')
!
valueIsKindOfMessageNotUnderstood: aValue
	^aValue class = MessageNotUnderstood
!
(reader addMethod: 'tests')
!
valueIsKindOfMessageNotUnderstoodSelector: aValue
	^aValue class = MessageNotUnderstood class
!
(reader addMethod: 'tests')
!
valueIsKindOfMonadicBlock: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfMonadicValuable: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfNil: aValue
	^aValue class = UndefinedObject
!
(reader addMethod: 'tests')
!
valueIsKindOfNiladicBlock: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfNiladicValuable: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfNotification: aValue
	^aValue class = Notification
!
(reader addMethod: 'tests')
!
valueIsKindOfNotificationClass: aValue
	^aValue class = Notification class
!
(reader addMethod: 'tests')
!
valueIsKindOfNumber: aValue
	^aValue class = Number
!
(reader addMethod: 'tests')
!
valueIsKindOfObject: aValue
	^aValue class = Object
!
(reader addMethod: 'tests')
!
valueIsKindOfObjectClass: aValue
	^aValue class = Object class
!
(reader addMethod: 'tests')
!
valueIsKindOfOrderedCollection: aValue
	^aValue class = OrderedCollection
!
(reader addMethod: 'tests')
!
valueIsKindOfOrderedCollectionFactory: aValue
	^aValue class = OrderedCollection class
!
(reader addMethod: 'tests')
!
valueIsKindOfPuttableStream: aValue
	^aValue class = WriteStream
!
(reader addMethod: 'tests')
!
valueIsKindOfRational: aValue
	^aValue class = Fraction or: [aValue class = Integer]
!
(reader addMethod: 'tests')
!
valueIsKindOfReadableString: aValue
	^aValue class = String
!
(reader addMethod: 'tests')
!
valueIsKindOfReadFileStream: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfReadStream: aValue
	^aValue class = ReadStream
!
(reader addMethod: 'tests')
!
valueIsKindOfReadStreamFactory: aValue
	^aValue class = ReadStream class
!
(reader addMethod: 'tests')
!
valueIsKindOfReadWriteStream: aValue
	^aValue class = ReadWriteStream
!
(reader addMethod: 'tests')
!
valueIsKindOfReadWriteStreamFactory: aValue
	^aValue class = ReadWriteStream class
!
(reader addMethod: 'tests')
!
valueIsKindOfScaledDecimal: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfSelector: aValue
	^aValue class = Symbol
!
(reader addMethod: 'tests')
!
valueIsKindOfSequencedCollection: aValue
	^aValue class = SequenceableCollection
!
(reader addMethod: 'tests')
!
valueIsKindOfSequencedContractibleCollection: aValue
	^aValue class = SequenceableCollection
!
(reader addMethod: 'tests')
!
valueIsKindOfSequencedReadableCollection: aValue
	^aValue class = SequenceableCollection
!
(reader addMethod: 'tests')
!
valueIsKindOfSequencedStream: aValue
	^aValue class = PositionableStream
!
(reader addMethod: 'tests')
!
valueIsKindOfSet: aValue
	^aValue class = Set
!
(reader addMethod: 'tests')
!
valueIsKindOfSetFactory: aValue
	^aValue class = Set class
!
(reader addMethod: 'tests')
!
valueIsKindOfSignaledException: aValue
	^aValue class = Exception
!
(reader addMethod: 'tests')
!
valueIsKindOfSortedCollection: aValue
	^aValue class = SortedCollection
!
(reader addMethod: 'tests')
!
valueIsKindOfSortedCollectionFactory: aValue
	^aValue class = SortedCollection class
!
(reader addMethod: 'tests')
!
valueIsKindOfString: aValue
	^aValue class = String
!
(reader addMethod: 'tests')
!
valueIsKindOfStringFactory: aValue
	^aValue class = String class
!
(reader addMethod: 'tests')
!
valueIsKindOfSymbol: aValue
	^aValue class = Symbol
!
(reader addMethod: 'tests')
!
valueIsKindOfTranscript: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfValuable: aValue
	^aValue class = BlockClosure
!
(reader addMethod: 'tests')
!
valueIsKindOfWarning: aValue
	^aValue class = Warning
!
(reader addMethod: 'tests')
!
valueIsKindOfWarningClass: aValue
	^aValue class = Warning class
!
(reader addMethod: 'tests')
!
valueIsKindOfWriteFileStream: aValue
	^false
!
(reader addMethod: 'tests')
!
valueIsKindOfWriteStream: aValue
	^aValue class = WriteStream
!
(reader addMethod: 'tests')
!
valueIsKindOfWriteStreamFactory: aValue
	^aValue class = WriteStream class
!
(reader addMethod: 'tests')
!
valueIsKindOfZeroDivide: aValue
	^aValue class = ZeroDivide
!
(reader addMethod: 'tests')
!
valueIsKindOfZeroDivideFactory: aValue
	^aValue class = ZeroDivide class
!
