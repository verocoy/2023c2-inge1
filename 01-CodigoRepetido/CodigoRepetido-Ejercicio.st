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

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:51:33'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertTimeOfExecute: [customerBook addCustomerNamed: 'John Lennon'.] 
		isLessThan: 50 * millisecond	.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:51:41'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .

	self assertTimeOfExecute: [customerBook removeCustomerNamed: paulMcCartney.] 
		isLessThan: 100 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:46:24'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self executeCollaboration: [ customerBook addCustomerNamed: ''.
			self fail ] 
		throwException:  Error
		thenCheckExpectedResults: (self checkCustumerBookIsEmptyAfterAddACustumerWithEmptyName: customerBook).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:46:10'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook removeCustomerNamed: 'Paul McCartney'.
			self fail ]
		throwException: NotFound
		thenCheckExpectedResults: (self checkCustumerBook: customerBook hasOnly1ClientWhichNameIs: johnLennon)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 15:08:12'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkCustumerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 1 
		numberOfCustomers:  1
		isOrNot: [:collaboration | self assert: collaboration ]
		customer: paulMcCartney.	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 15:08:12'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self custumerBookWith1ClientNamed: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkCustumerBook: customerBook 
		numberOfActiveCustomers: 0 
		numberOfSuspendedCustomers: 0 
		numberOfCustomers: 0 
		isOrNot: [:collaboration|self deny: collaboration ]
		customer: paulMcCartney .

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:46:10'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook suspendCustomerNamed: 'George Harrison'.
			self fail ]
		throwException:  CantSuspend
		thenCheckExpectedResults: (self checkCustumerBook: customerBook hasOnly1ClientWhichNameIs: johnLennon)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VC 9/5/2023 14:46:10'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self custumerBookWith1ClientNamed: johnLennon .

	customerBook suspendCustomerNamed: johnLennon.
	
	self executeCollaboration:  [ customerBook suspendCustomerNamed: johnLennon . 
			self fail ]
		throwException: CantSuspend
		thenCheckExpectedResults: (self checkCustumerBook: customerBook hasOnly1ClientWhichNameIs: johnLennon)! !


!CustomerBookTest methodsFor: 'instance creation' stamp: 'VC 9/5/2023 10:15:35'!
custumerBookWith1ClientNamed: aName
	| customerBook |
	customerBook := CustomerBook new.
	^ customerBook addCustomerNamed: aName.
! !


!CustomerBookTest methodsFor: 'running time' stamp: 'VC 9/5/2023 13:56:23'!
assertTimeOfExecute: aClosure isLessThan: maxTimeRunning

	| millisecondsBeforeRunning millisecondsAfterRunning |
		
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < maxTimeRunning
	
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/5/2023 14:46:10'!
checkCustumerBook: aCustomerBook hasOnly1ClientWhichNameIs: aName

		^ [:anError |
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aName).].! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/5/2023 15:08:12'!
checkCustumerBook: aCustomerBook numberOfActiveCustomers: totalActiveCustumers numberOfSuspendedCustomers: totalSuspendedCustomers numberOfCustomers: totalCustumers isOrNot: aClosure customer: aName

	self assert: totalActiveCustumers equals: aCustomerBook numberOfActiveCustomers.
	self assert: totalSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustumers equals: aCustomerBook numberOfCustomers.
	aClosure value: (aCustomerBook includesCustomerNamed: aName).

	! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'VC 9/5/2023 14:46:24'!
checkCustumerBookIsEmptyAfterAddACustumerWithEmptyName: customerBook

	^ [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !


!CustomerBookTest methodsFor: 'exceptions' stamp: 'VC 9/5/2023 14:20:53'!
executeCollaboration: method throwException: exception thenAssert: conditionAssert1 andAssert: conditionAssert2 

	^ method
		on: exception 
		do: [ :anError | 
			self assert: conditionAssert1.
			self assert: conditionAssert2]! !

!CustomerBookTest methodsFor: 'exceptions' stamp: 'VC 9/5/2023 14:15:00'!
executeCollaboration: method throwException: exception thenCheckExpectedResults: conditionAssert 

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
