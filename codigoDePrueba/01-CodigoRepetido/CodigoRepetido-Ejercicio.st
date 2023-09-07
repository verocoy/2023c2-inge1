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

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:49:10'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertExecutionTimeOf: [customerBook addCustomerNamed: 'John Lennon'.] 
		takeLessThan: 50 * millisecond	.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:54:08'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .

	self assertExecutionTimeOf: [customerBook removeCustomerNamed: paulMcCartney.] 
		takeLessThan: 100 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:51:34'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self executeCollaboration: [ customerBook addCustomerNamed: ''.
			self fail ] 
		throwException:  Error
		thenAsserts: (self assertCustumerBookIsEmptyAfterAddACustumerWithEmptyName: customerBook).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:51:34'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook removeCustomerNamed: 'Paul McCartney'.
			self fail ]
		throwException: NotFound
		thenAsserts: (self assertCustumerBook: customerBook hasClientNamed: johnLennon)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:50:03'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertInCustumerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 1 
		numberOfCustomers:  1
		andHasOrNot: [:collaboration | self assert: collaboration ]
		customerNamed: paulMcCartney.	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:50:03'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertInCustumerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 0 
		numberOfCustomers: 0 
		andHasOrNot: [:aBoolean | self deny: aBoolean ]
		customerNamed: paulMcCartney .

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:51:34'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook suspendCustomerNamed: 'George Harrison'.
			self fail ]
		throwException:  CantSuspend
		thenAsserts: (self assertCustumerBook: customerBook hasClientNamed: johnLennon)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/6/2023 19:51:34'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon .

	customerBook suspendCustomerNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook suspendCustomerNamed: johnLennon . 
			self fail ]
		throwException: CantSuspend
		thenAsserts: (self assertCustumerBook: customerBook hasClientNamed: johnLennon)! !


!CustomerBookTest methodsFor: 'instance creation' stamp: 'VC 9/5/2023 10:15:35'!
custumerBookWith1ClientNamed: aName
	| customerBook |
	customerBook := CustomerBook new.
	^ customerBook addCustomerNamed: aName.
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/6/2023 19:42:18'!
assertCustumerBook: aCustomerBook hasClientNamed: aName

		^ [:anError |
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aName).].! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/6/2023 19:49:33'!
assertCustumerBookIsEmptyAfterAddACustumerWithEmptyName: customerBook

	^ [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/6/2023 19:49:10'!
assertExecutionTimeOf: aClosure takeLessThan: maxTimeRunning

	| millisecondsBeforeRunning millisecondsAfterRunning |
		
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < maxTimeRunning
	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/6/2023 19:50:03'!
assertInCustumerBook: aCustomerBook numberOfActiveCustomers: totalActiveCustumers numberOfSuspendedCustomers: totalSuspendedCustomers numberOfCustomers: totalCustumers andHasOrNot: aClosure customerNamed: aName

	self assert: totalActiveCustumers equals: aCustomerBook numberOfActiveCustomers.
	self assert: totalSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustumers equals: aCustomerBook numberOfCustomers.
	aClosure value: (aCustomerBook includesCustomerNamed: aName).

	! !


!CustomerBookTest methodsFor: 'exceptions' stamp: 'VC 9/6/2023 19:51:34'!
executeCollaboration: method throwException: exception thenAsserts: conditionAssert 

	^ method
		on: exception 
		do: conditionAssert! !


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
