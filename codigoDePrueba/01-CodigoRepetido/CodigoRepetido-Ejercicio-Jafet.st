!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:25:10'!
assertThatExecutionOf: aClosure raisesErrorNamed: anErrorClass andSatisfies: aClosureOfConditions
"Coloco raisesErrorNamed porque siempre haccemos self fail, por lo que se puede decir que esto solo se usa para errores."
	[aClosure value. self fail]
		on: anErrorClass
		do: aClosureOfConditions! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:28:34'!
assertThatExecutionTimeOf: aClosure takesLessThan: unTiempo

	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < unTiempo! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 01:04:08'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	^self assertThatExecutionTimeOf: [customerBook addCustomerNamed: 'John Lennon'.] takesLessThan: 50 * millisecond! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 01:04:08'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	self assertThatExecutionTimeOf: [	customerBook removeCustomerNamed: paulMcCartney.] takesLessThan: 100 * millisecond
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:24:20'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assertThatExecutionOf: [ customerBook addCustomerNamed: ''.	 ] 
	raisesErrorNamed: Error
	andSatisfies: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:24:20'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self assertThatExecutionOf: 	[ customerBook removeCustomerNamed: 'Paul McCartney'. ]
	raisesErrorNamed: NotFound 
	andSatisfies: [self assert: (customerBook hasOneCustomerWhoseNameIs: 'John Lennon')]
	
	"Pregunta: Es mejor tener hasOneCutomerWhoseNameIs en customerBook 
	o en customerBooktTest y que reciba una instancia de customerBook?"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:55:07'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	self assert: (customerBook checkThatNumberOfActiveCustomersIs: 0
	andNumberOfSuspendedCustomersIs: 1
	andNumberOfTotalCustomersIs: 1).
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 04:00:06'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self assert: (customerBook checkThatNumberOfActiveCustomersIs: 0
	andNumberOfSuspendedCustomersIs: 0
	andNumberOfTotalCustomersIs: 0).
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:24:20'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self assertThatExecutionOf: [ customerBook suspendCustomerNamed: 'George Harrison'. ] 
	raisesErrorNamed: CantSuspend
	andSatisfies: [self assert: (customerBook hasOneCustomerWhoseNameIs: 'John Lennon')]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:24:20'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertThatExecutionOf: 	[ customerBook suspendCustomerNamed: johnLennon. ]
	raisesErrorNamed: CantSuspend 
	andSatisfies: [self assert: (customerBook hasOneCustomerWhoseNameIs: 'John Lennon')]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:58:24'!
checkThatNumberOfActiveCustomersIs: aNumberOfCustomers andNumberOfSuspendedCustomersIs: aNumberOfSuspendedCustomers andNumberOfTotalCustomersIs: aNumberOfTotalCustomers
"Sigo la convencion mia de no poner asserts aca, sino solo retornar booleanos"
	^self numberOfActiveCustomers = aNumberOfCustomers 
	and: self numberOfSuspendedCustomers = aNumberOfSuspendedCustomers
	and: self numberOfCustomers  = aNumberOfTotalCustomers.! !

!CustomerBook methodsFor: 'testing' stamp: 'JAFET 9/6/2023 03:17:55'!
hasOneCustomerWhoseNameIs: aCustomerName
	^self numberOfCustomers = 1 and: (self includesCustomerNamed: aCustomerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:48'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:52'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
