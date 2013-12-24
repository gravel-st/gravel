(reader defineClass: 'HashedCollection' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'tally')
!
(reader addInstVar: 'array')
!
(reader addMethod: 'private')
!
atNewIndex: index put: anObject
	array at: index put: anObject.
	tally := tally + 1.
	array size * 3 < (tally * 4) ifTrue: [self grow]
!
(reader addMethod: 'accessing')
!
capacity
	^array size
!
(reader addMethod: 'copying')
!
copyEmpty
	^self species new
!
(reader addMethod: 'private')
!
grow
	self growTo: self growSize
!
(reader addMethod: 'private')
!
growSize
	^self class goodPrimeAtLeast: array size * 3 // 2 + 2
!
(reader addMethod: 'private')
!
growTo: anInteger
	| oldElements |
	oldElements := array.
	array := self class arrayType new: anInteger.
	self noCheckNoGrowFillFrom: oldElements
!
(reader addMethod: 'private')
!
initialize: n
	array := self class arrayType new: n.
	tally := 0
!
(reader addMethod: 'removing')
!
removeAll
	self initialize: self capacity
!
(reader addMethod: 'private')
!
scanForEmptySlotFor: anObject
	| index start |
	index := start := anObject hash \\ array size + 1.
	
	[(array at: index) ifNil: [^index].
	(index := index \\ array size + 1) = start]
			whileFalse.
	self errorNoFreeSpace
!
(reader addMethod: 'accessing')
!
size
	^tally
!
(reader addClassMethod: 'private')
!
arrayType
	^Array
!
(reader addClassMethod: 'sizing')
!
goodPrimeAtLeast: lowerLimit
	| primes low mid high prime |
	primes := self goodPrimes.
	low := 1.
	high := primes size.
	lowerLimit > (primes at: high) ifTrue: [^lowerLimit bitOr: 1].
	[high - low <= 1] whileFalse: 
			[mid := (high + low) // 2.
			prime := primes at: mid.
			prime = lowerLimit ifTrue: [^prime].
			prime < lowerLimit ifTrue: [low := mid] ifFalse: [high := mid]].
	(primes at: low) >= lowerLimit ifTrue: [^primes at: low].
	^primes at: high
!
(reader addClassMethod: 'sizing')
!
goodPrimes
	^#(5 11 17 23 31 43 59 79 107 149 199 269 359 479 641 857 1151 1549 2069 2237 2423 2617 2797 2999 3167 3359 3539 3727 3911 4441 4787 5119 5471 5801 6143 6521 6827 7177 7517 7853 8783 9601 10243 10867 11549 12239 12919 13679 14293 15013 15731 17569 19051 20443 21767 23159 24611 25847 27397 28571 30047 31397 35771 38201 40841 43973 46633 48989 51631 54371 57349 60139 62969 70589 76091 80347 85843 90697 95791 101051 106261 111143 115777 120691 126311 140863 150523 160969 170557 181243 190717 201653 211891 221251 232591 242873 251443 282089 300869 321949 341227 362353 383681 401411 422927 443231 464951 482033 504011 562621 605779 647659 681607 723623 763307 808261 844709 886163 926623 967229 1014617 1121987 1201469 1268789 1345651 1429531 1492177 1577839 1651547 1722601 1800377 1878623 1942141 2028401 2242727 2399581 2559173 2686813 2836357 3005579 3144971 3283993 3460133 3582923 3757093 3903769 4061261 4455361 4783837 5068529 5418079 5680243 6000023 6292981 6611497 6884641 7211599 7514189 7798313 8077189 9031853 9612721 10226107 10745291 11338417 11939203 12567671 13212697 13816333 14337529 14938571 15595673 16147291 17851577 18993941 20180239 21228533 22375079 23450491 24635579 25683871 26850101 27921689 29090911 30153841 31292507 32467307 35817611 37983761 40234253 42457253 44750177 46957969 49175831 51442639 53726417 55954637 58126987 60365939 62666977 64826669 71582779 76039231 80534381 84995153 89500331 93956777 98470819 102879613 107400389 111856841 116365721 120819287 125246581 129732203 143163379 152076289 161031319 169981667 179000669 187913573 196826447 205826729 214748357 223713691 232679021 241591901 250504801 259470131 285162679 301939921 318717121 335494331 352271573 369148753 385926017 402603193 419480419 436157621 453034849 469712051 486589307 503366497 520043707 570475349 603929813 637584271 671138659 704693081 738247541 771801929 805356457 838910803 872365267 905919671 939574117 973128521 1006682977 1040137411 1073741833)
!
(reader addClassMethod: 'instance creation')
!
new
	^self basicNew initialize: 5
!
(reader addClassMethod: 'instance creation')
!
new: nElements
	^self basicNew initialize: (self sizeFor: nElements)
!
(reader addClassMethod: 'sizing')
!
sizeFor: nElements
	nElements < 4 ifTrue: [^5].
	^self goodPrimeAtLeast: (nElements + 1) * 4 // 3
!
