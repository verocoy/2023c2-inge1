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

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:08:56'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertExecutionTimeOf: [customerBook addCustomerNamed: 'John Lennon'.] 
		takesLessThan: 50 * millisecond	.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:08:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .

	self assertExecutionTimeOf: [customerBook removeCustomerNamed: paulMcCartney.] 
		takesLessThan: 100 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:26:01'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assertExecutionOf: [ customerBook addCustomerNamed: ''.	 ] 
		raisesErrorOfClass: Error
		andSatisfies: (self assertCustomerBookIsEmptyAfterAddingACustomerWithEmptyName: customerBook)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:28:47'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self assertExecutionOf: [ customerBook removeCustomerNamed: 'Paul McCartney'. ]
		raisesErrorOfClass: NotFound
		andSatisfies: (self assertCustomerBook: customerBook hasAClientNamed: johnLennon).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:16:43'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertInCustomerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 1 
		numberOfCustomers:  1.
		
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:18:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertInCustomerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 0 
		numberOfCustomers: 0.
		
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:28:47'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self assertExecutionOf: [ customerBook suspendCustomerNamed: 'George Harrison'. ] 
		raisesErrorOfClass: CantSuspend
		andSatisfies: (self assertCustomerBook: customerBook hasAClientNamed: johnLennon).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JAFET 9/7/2023 13:28:47'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon .

	customerBook suspendCustomerNamed: johnLennon.
	
	self assertExecutionOf: [ customerBook suspendCustomerNamed: johnLennon. ] 
		raisesErrorOfClass: CantSuspend
		andSatisfies: (self assertCustomerBook: customerBook hasAClientNamed: johnLennon).! !


!CustomerBookTest methodsFor: 'instance creation' stamp: 'VC 9/5/2023 10:15:35'!
custumerBookWith1ClientNamed: aName
	| customerBook |
	customerBook := CustomerBook new.
	^ customerBook addCustomerNamed: aName.
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'JAFET 9/7/2023 13:28:47'!
assertCustomerBook: aCustomerBook hasAClientNamed: aName

		^ [:anError |
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aName).].! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JAFET 9/7/2023 13:14:48'!
assertCustomerBookIsEmptyAfterAddingACustomerWithEmptyName: customerBook

	^ [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JAFET 9/7/2023 13:26:01'!
assertExecutionOf: aClosure raisesErrorOfClass: anErrorClass andSatisfies: aClosureOfConditions
	[aClosure value. self fail]
		on: anErrorClass
		do: aClosureOfConditions! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JAFET 9/7/2023 13:08:56'!
assertExecutionTimeOf: aClosure takesLessThan: maxTimeRunning

	| millisecondsBeforeRunning millisecondsAfterRunning |
		
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < maxTimeRunning
	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JAFET 9/7/2023 13:17:11'!
assertInCustomerBook: aCustomerBook numberOfActiveCustomers: totalActiveCustumers numberOfSuspendedCustomers: totalSuspendedCustomers numberOfCustomers: totalCustumers

	self assert: totalActiveCustumers equals: aCustomerBook numberOfActiveCustomers.
	self assert: totalSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustumers equals: aCustomerBook numberOfCustomers.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

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

!CustomerBook methodsFor: 'customer management' stamp: 'VC 9/6/2023 19:17:22'!
removeCustomerNamed: aName 
 
	| aMessage | 
	aMessage:= self removeFrom:  active customerNamed: aName errorIfNotFound: [NotFound signal].
	aMessage:= self removeFrom: suspended customerNamed: aName errorIfNotFound: aMessage.
	^aMessage value
! !

!CustomerBook methodsFor: 'customer management' stamp: 'VC 9/6/2023 19:16:22'!
removeFrom: aList customerNamed: aName errorIfNotFound: aMessage

	1 to: aList size do: 
	[ :index |
		aName = (aList at: index)
			ifTrue: [
				aList removeAt: index.
				^ [aName] 
			] 
	].
	^ aMessage .! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'VC 9/6/2023 19:17:34'!
suspendCustomerNamed: aName 

	(self removeFrom: active customerNamed: aName errorIfNotFound:[^CantSuspend signal]) value. 		
	
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
