!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack prefix1 stackPrefix1 sentenceFinder sentencesPrefix1 stack5Elements sentences5Elements prefix2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:00:35'!
test01FindEmptyStackReturnsEmptyCollection

	| sentences |
	sentences := sentenceFinder findAllSentencesWith: prefix1 in: emptyStack.

	self assert: sentences isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:07:55'!
test02FindReturnsCollection

	| sentences |
	sentences := sentenceFinder findAllSentencesWith: prefix1 in: stackPrefix1 .

	self assert: (sentences isKindOf: OrderedCollection) ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:08:43'!
test03FindStack1ElementEqualPrefix

	| sentences |
	sentences := sentenceFinder findAllSentencesWith: prefix1 in: stackPrefix1 .

	self assert: (sentences = sentencesPrefix1 )! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:09:32'!
test04FindDifferentUsesOfPrefixInStack

	| sentences |
	sentences := sentenceFinder findAllSentencesWith: prefix1 in: stack5Elements .

	self assert: (sentences = sentences5Elements )! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:13:04'!
test05CanNotFindIfPrefixIsBlank

	
	self
		should: [ sentenceFinder findAllSentencesWith: '' in: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix blankPrefixErrorDescription ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 19:17:17'!
test06CanNotFindIfPrefixHasSpace

"	
	self
		should: [ sentenceFinder findAllSentencesWith: prefix2 in: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix spacesInPrefixErrorDescription ]
"! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'VC 9/17/2023 18:32:09'!
test07CanNotFindIfPrefixIsNotString

	
	self
		should: [ sentenceFinder findAllSentencesWith: 1 in: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix notStringPrefixErrorDescription ]
	! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'VC 9/17/2023 19:12:44'!
setUp

	sentenceFinder := SentenceFinderByPrefix new.

	emptyStack := OOStack new.

	prefix1 := 'hola'.
	prefix2 := 'h́ola h'.
	stackPrefix1 := OOStack new.
	stackPrefix1 push: prefix1.
	sentencesPrefix1 := OrderedCollection new.
	sentencesPrefix1 addLast: prefix1.
	
	stack5Elements := OOStack new.
	stack5Elements push: 'hola'.
	stack5Elements push: 'hola chau'.
	stack5Elements push: 	'Hola'.
	stack5Elements push:  'hola hola'.
	stack5Elements push: 	'chau hola'.
	sentences5Elements := OrderedCollection new.
	sentences5Elements addLast:  'hola hola'.
	sentences5Elements addLast: 'hola chau'.
	sentences5Elements addLast: 'hola'.
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'VC 9/15/2023 13:05:12'!
isEmpty

	^self size = 0! !

!OOStack methodsFor: 'accessing' stamp: 'VC 9/15/2023 12:44:21'!
size
	
	^stack size - 1! !

!OOStack methodsFor: 'accessing' stamp: 'VC 9/15/2023 13:13:12'!
top
	| element |
	element := stack last.

	^element elementValue: self! !


!OOStack methodsFor: 'adding' stamp: 'VC 9/15/2023 12:56:54'!
push: aElementValue
	| stackContainer |
	stackContainer := StackElementContainer with: aElementValue.
	stack addLast: stackContainer ! !


!OOStack methodsFor: 'initialization' stamp: 'VC 9/15/2023 12:43:00'!
initialize
	
	stack := OrderedCollection new.
	stack addLast: StackBase new! !


!OOStack methodsFor: 'removing' stamp: 'VC 9/15/2023 11:13:09'!
pop
	| element |
	element := self top.
	stack removeLast.
	^element! !


!OOStack methodsFor: 'error handling' stamp: 'VC 9/15/2023 13:02:44'!
raiseErrorStackEmpty

	^self error: self class stackEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackElementContainer category: 'Stack-Exercise'!
Object subclass: #OOStackElementContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!OOStackElementContainer methodsFor: 'accessing' stamp: 'VC 9/15/2023 13:13:37'!
elementValue: aEmptyStack

	self subclassResponsibility! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
OOStackElementContainer subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!StackBase methodsFor: 'accessing' stamp: 'VC 9/15/2023 13:13:37'!
elementValue: aEmptyStack

	^ aEmptyStack raiseErrorStackEmpty! !


!classDefinition: #StackElementContainer category: 'Stack-Exercise'!
OOStackElementContainer subclass: #StackElementContainer
	instanceVariableNames: 'elementValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!StackElementContainer methodsFor: 'initialization' stamp: 'VC 9/15/2023 13:01:45'!
initializeWith: anElementValue

	elementValue := anElementValue! !


!StackElementContainer methodsFor: 'accessing' stamp: 'VC 9/15/2023 13:13:37'!
elementValue: aStack

	^ elementValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElementContainer class' category: 'Stack-Exercise'!
StackElementContainer class
	instanceVariableNames: ''!

!StackElementContainer class methodsFor: 'instance creation' stamp: 'VC 9/15/2023 13:10:00'!
with: anElementValue

	^self new initializeWith: anElementValue! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'VC 9/17/2023 18:30:01'!
findAllSentencesWith: aPrefix in: aSentenceStack

	self shouldBeValidPrefix: aPrefix. 	
	^self selectIf: [:sentence | sentence beginsWith: aPrefix] in: aSentenceStack ! !

!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'VC 9/17/2023 17:55:06'!
selectIf: aConditionBlock in: aSentenceStack

	| selectSentences sentence|
	selectSentences := OrderedCollection new.
	aSentenceStack isEmpty ifFalse: [
		sentence := aSentenceStack pop.
		selectSentences := self selectIf: aConditionBlock in: aSentenceStack .
		(aConditionBlock value: sentence) ifTrue: [selectSentences addFirst: sentence ].
		aSentenceStack push: sentence .
		].
	^selectSentences ! !


!SentenceFinderByPrefix methodsFor: 'error handling' stamp: 'VC 9/17/2023 18:58:52'!
shouldBeValidPrefix: aPrefix 

	(aPrefix isKindOf: String) ifFalse: [^self error: self class notStringPrefixErrorDescription ].
	aPrefix = '' ifTrue: [^self error: self class blankPrefixErrorDescription ].
	aPrefix detect: [:character | character = Character space ] ifFound: [^self error: self class spacesInPrefixErrorDescription ]
		ifNone: [ ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'VC 9/17/2023 18:14:48'!
blankPrefixErrorDescription
	^ 'El prefijo no puede ser el string vacio'! !

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'VC 9/17/2023 18:28:08'!
notStringPrefixErrorDescription
	^ 'El prefijo debe ser string'! !

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'VC 9/17/2023 18:18:12'!
spacesInPrefixErrorDescription
	^ 'El prefijo no puede tener espacios'! !
