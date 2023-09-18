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
	instanceVariableNames: 'emptyStack prefix1 stackPrefix1 sentenceFinder sentencesPrefix1 stack5Elements sentences5Elements prefix2 stackDeConsigna sentencesDeConsigna caseSensitivePrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test01FindEmptyStackReturnsEmptyCollection

	| sentences |
	sentences := sentenceFinder findAllSentencesWithPrefix: prefix1 inStack: emptyStack.

	self assert: sentences isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test02FindReturnsCollection

	| sentences |
	sentences := sentenceFinder findAllSentencesWithPrefix: prefix1 inStack: stackPrefix1 .

	self assert: (sentences isKindOf: OrderedCollection) ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test03FindStack1ElementEqualPrefix

	| sentences |
	sentences := sentenceFinder findAllSentencesWithPrefix: prefix1 inStack: stackPrefix1 .

	self assert: (sentences = sentencesPrefix1 )! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test04FindDifferentUsesOfPrefixInStack

	| sentences |
	sentences := sentenceFinder findAllSentencesWithPrefix: prefix1 inStack: stack5Elements .

	self assert: (sentences = sentences5Elements )! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:27:28'!
test05CanNotFindIfPrefixIsBlank

	self
		should: [ sentenceFinder findAllSentencesWithPrefix: '' inStack: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix blankPrefixErrorDescription ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test06CanNotFindIfPrefixHasSpace

	self
		should: [ sentenceFinder findAllSentencesWithPrefix: prefix2 inStack: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix spacesInPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test07CanNotFindIfPrefixIsNotString

	self
		should: [ sentenceFinder findAllSentencesWithPrefix: 1 inStack: stack5Elements ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix notStringPrefixErrorDescription ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test08FindIsCaseSensitive

	| sentences |
	sentences := sentenceFinder findAllSentencesWithPrefix: caseSensitivePrefix inStack: 	stackDeConsigna.

	self assert: (sentences = sentencesDeConsigna).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JAFET 9/17/2023 22:25:51'!
test09StackRemainsUnchangedAfterFind

	| tempStack |
	tempStack := stackDeConsigna.
	sentenceFinder findAllSentencesWithPrefix: caseSensitivePrefix inStack: 	tempStack.

	self assert: (tempStack = stackDeConsigna).! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'JAFET 9/17/2023 22:27:06'!
setUp

	sentenceFinder := SentenceFinderByPrefix new.

	emptyStack := OOStack new.

	prefix1 := 'hola'.
	prefix2 := 'hola h'.
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
	sentences5Elements addLast: 'hola hola'.
	sentences5Elements addLast: 'hola chau'.
	sentences5Elements addLast: 'hola'.
	
	"----------------------------------------"
	"Definimos colaboradores para implementar el test de la consigna."
	caseSensitivePrefix := 'Wint'.
	
	stackDeConsigna := OOStack new.
	stackDeConsigna push: 'winter is coming'.
	stackDeConsigna push: 'winning is everything'.
	stackDeConsigna push: 'The winds of Winter'.
	stackDeConsigna push: 'Winter is here'.
	stackDeConsigna push: 'Wint'.
	
	sentencesDeConsigna := OrderedCollection new.
	sentencesDeConsigna addFirst: 'Winter is here'.
	sentencesDeConsigna addFirst: 'Wint'.	
	"----------------------------------------"
	
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


!OOStack methodsFor: 'adding' stamp: 'JAFET 9/17/2023 19:57:36'!
push: anElementValue
	| stackContainer |
	stackContainer := StackElementContainer with: anElementValue.
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

!OOStackElementContainer methodsFor: 'accessing' stamp: 'JAFET 9/17/2023 19:52:59'!
elementValue: anEmptyStack

	self subclassResponsibility! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
OOStackElementContainer subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accessing' stamp: 'JAFET 9/17/2023 19:53:15'!
elementValue: anEmptyStack

	^ anEmptyStack raiseErrorStackEmpty! !


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

!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'JAFET 9/17/2023 22:25:36'!
findAllSentencesWithPrefix: aStringAsPrefix inStack: aStackOfStrings

	self shouldBeAValidPrefix: aStringAsPrefix. 	
	^self selectIf: [:string | string beginsWith: aStringAsPrefix] in: aStackOfStrings.! !

!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'JAFET 9/17/2023 22:19:47'!
selectIf: aConditionBlock in: aStackOfStrings

	| selectedStrings currentString|
	selectedStrings := OrderedCollection new.
	aStackOfStrings isEmpty ifFalse: [
		currentString := aStackOfStrings pop.
		selectedStrings := self selectIf: aConditionBlock in: aStackOfStrings.
		(aConditionBlock value: currentString) ifTrue: [selectedStrings addFirst: currentString].
		aStackOfStrings push: currentString.
		].
	^selectedStrings ! !


!SentenceFinderByPrefix methodsFor: 'error handling' stamp: 'JAFET 9/17/2023 21:54:09'!
shouldBeAValidPrefix: aStringAsPrefix

	(aStringAsPrefix isKindOf: String) ifFalse: [^self error: self class notStringPrefixErrorDescription ].
	aStringAsPrefix = '' ifTrue: [^self error: self class blankPrefixErrorDescription ].
	(aStringAsPrefix includesSubString: ' ') ifTrue: [^self error: self class spacesInPrefixErrorDescription ]. 
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
