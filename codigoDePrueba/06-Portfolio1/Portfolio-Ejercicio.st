!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 11:15:11'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:39:38'!
test02PortfolioWithAccountsHasSumOfTheirBalances
	| portfolio account1 account2 |
	portfolio := Portfolio new.

	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 10 on: account2.
	
	portfolio addAsset: account1.
	portfolio addAsset: account2.
	
	self assert: 90 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test03PortfolioWithPortfoliosAndAccountsHasSumOfTheirBalances
	| parentPortfolio portfolio1 account1 account2 |
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	portfolio1 addAsset: account1.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 10 on: account2.
	
	parentPortfolio addAsset: portfolio1 .
	parentPortfolio addAsset: account2.
	
	self assert: 90 equals: parentPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test04PortfolioWithPortfoliosAndAccountsKnowsRegisteredTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 on: account1.
	portfolio1 addAsset: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw register: 10 on: account2.
	
	parentPortfolio addAsset: portfolio1 .
	parentPortfolio addAsset: account2.
	
	self assert: (parentPortfolio hasRegistered: transaction1).
	self assert: (parentPortfolio hasRegistered: transaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test05PortfolioWithPortfoliosAndAccountsDoesntKnowUnregisteredTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit for: 100.
	portfolio1 addAsset: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw for: 10.
	
	parentPortfolio addAsset: portfolio1 .
	parentPortfolio addAsset: account2.
	
	self deny: (parentPortfolio hasRegistered: transaction1).
	self deny: (parentPortfolio hasRegistered: transaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test06PortfolioWithPortfoliosAndAccountsKnowsTheirsTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 on: account1 .
	portfolio1 addAsset: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw register: 10 on: account2 .
	
	parentPortfolio addAsset: portfolio1 .
	parentPortfolio addAsset: account2.
	
	self assert: parentPortfolio transactions size = 2.
	self assert: (parentPortfolio transactions includes: transaction1).
	self assert: (parentPortfolio transactions includes: transaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:39:38'!
test07CannotAddAccountThatAlreadyExistsInParentPortfolio
	
	| parentPortfolio account1 |
	
	parentPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.	
	
	parentPortfolio addAsset: account1.
	
	self should: [parentPortfolio addAsset: account1] 
		raise: Error 
		withMessageText: [Portfolio accountAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test08CannotAddAccountThatAlreadyExistsInAnyChildPortfolio

	| account1 parentPortfolio portfolio1 portfolio2 portfolio3 |
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1 .
	portfolio3 addAsset: account1.
	portfolio1 addAsset: portfolio2.
	portfolio2 addAsset: portfolio3.
	
	parentPortfolio addAsset: portfolio1.	
	
	self should: [parentPortfolio addAsset: account1] 
		raise: Error 
		withMessageText: [Portfolio accountAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test09CannotAddTheSameParentPortfolio

	| parentPortfolio |
	parentPortfolio := Portfolio new.
	
	self should: [ parentPortfolio addAsset: parentPortfolio ] 
		raise: Error 
		withMessageText: [Portfolio portfolioAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test10CannotAddPortfolioThatAlreadyExistsInParentPortfolio

	| parentPortfolio portfolio1 |
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	parentPortfolio addAsset: portfolio1.
	
	self should: [ parentPortfolio addAsset: portfolio1 ] 
		raise: Error 
		withMessageText: [Portfolio portfolioAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test11CannotAddPortfolioThatAlreadyExistsInAnyChildPortfolio

	| parentPortfolio portfolio1 portfolio2 portfolio3 |

	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio2 addAsset: portfolio3.
	portfolio1 addAsset: portfolio2.
	
	parentPortfolio addAsset: portfolio1.
	
	self should: [ parentPortfolio addAsset: portfolio3 ] 
		raise: Error 
		withMessageText: [Portfolio portfolioAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test12CannotAddPortfolioWhoseChildrenPortfoliosAlreadyExistInParent
	
	| parentPortfolio portfolio1 portfolio2 portfolio3 portfolio4 |
	
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	
	portfolio3 addAsset: portfolio4.
	portfolio2 addAsset: portfolio3.
	portfolio1 addAsset: portfolio2.
	
	parentPortfolio addAsset: portfolio4.
	
	self should: [ parentPortfolio addAsset: portfolio1 ] 
		raise: Error 
		withMessageText: [Portfolio portfolioAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:40:53'!
test13CannotAddPortfolioWhoseChildrenAccountsAlreadyExistInParent
	
	| parentPortfolio portfolio1 portfolio2 portfolio3 account1 portfolio4 portfolio5 |
	
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	portfolio5 := Portfolio new.
	
	account1 := ReceptiveAccount new.

	portfolio2 addAsset: account1.
	portfolio3 addAsset: portfolio2 .
	parentPortfolio addAsset: portfolio3.
	
	portfolio4 addAsset: account1.
	portfolio5 addAsset: portfolio4.
	portfolio1 addAsset: portfolio5.
	
	self should: [ parentPortfolio addAsset: portfolio1 ] 
		raise: Error 
		withMessageText: [Portfolio accountAlreadyExistsErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/17/2023 14:52:48'!
test14CannotAddAccountAlreadyExistInTreeThatIncludePortfolio
	
	| rootPortfolio1 rootPortfolio2 portfolio1 portfolio2 account1 |
	
	rootPortfolio1 := Portfolio new.
	rootPortfolio2 := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.

	portfolio1 addAsset: account1.
	rootPortfolio1 addAsset: portfolio1.
	rootPortfolio1 addAsset: portfolio2.	
	
	rootPortfolio2 addAsset: portfolio2.
	rootPortfolio2 addAsset: account1.
	
	
	self should: [ portfolio2 addAsset: account1 ] 
		raise: Error 
		withMessageText: [Portfolio accountAlreadyExistsErrorDescription].! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'VC 10/18/2023 14:29:18'!
calculateBalance: anAccumulatedBalance

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'VC 10/18/2023 14:28:46'!
calculateBalance: anAccumulatedBalance 
	^anAccumulatedBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'VC 10/18/2023 14:29:09'!
calculateBalance: anAccumulatedBalance 
	^anAccumulatedBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinantialAsset category: 'Portfolio-Ejercicio'!
Object subclass: #FinantialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinantialAsset methodsFor: 'balance' stamp: 'VC 10/18/2023 14:32:05'!
balance

	self subclassResponsibility! !


!FinantialAsset methodsFor: 'transactions' stamp: 'VC 10/18/2023 14:31:04'!
addTransactionsIn: aTransactionsList

	self subclassResponsibility! !

!FinantialAsset methodsFor: 'transactions' stamp: 'VC 10/18/2023 14:32:23'!
transactions

	self subclassResponsibility! !


!FinantialAsset methodsFor: 'testing' stamp: 'VC 10/18/2023 14:32:12'!
hasRegistered: aTransaction

	self subclassResponsibility! !


!FinantialAsset methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:32:38'!
assertAssetMeetsCriteriaToBeAddIn: aParentPortfolio

	self subclassResponsibility! !

!FinantialAsset methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:31:30'!
assertAssetOf: aPortfolio doesNotIncludeTheAccountToAdd: anAccountToAdd

	self subclassResponsibility! !

!FinantialAsset methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:32:56'!
assertAssetOf: aParentPortfolio doesNotIncludeThePortfolioToAdd: aPortfolioToAdd

	self subclassResponsibility! !


!FinantialAsset methodsFor: 'associating' stamp: 'VC 10/18/2023 14:30:06'!
addParentPortfolio: aParentPortfolio

	self subclassResponsibility! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinantialAsset subclass: #Portfolio
	instanceVariableNames: 'associateAssets parentPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'VC 10/18/2023 14:33:17'!
balance
	^associateAssets sum: [:anAsset | anAsset balance ] ifEmpty: [0].! !


!Portfolio methodsFor: 'initialization' stamp: 'VC 10/17/2023 14:53:48'!
initialize
	associateAssets := OrderedCollection new.
	parentPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'inspecting' stamp: 'VC 10/18/2023 09:15:09'!
addPortfolioTreeRootsIn: aPortfolioTreeRootsList
	
	parentPortfolios 
		ifEmpty: [aPortfolioTreeRootsList add: self]
		ifNotEmpty: [parentPortfolios do: [:aParentPortfolio | aParentPortfolio addPortfolioTreeRootsIn: aPortfolioTreeRootsList ]]! !

!Portfolio methodsFor: 'inspecting' stamp: 'VC 10/18/2023 09:17:51'!
portfoliosTreeRoots

	| rootsList |
	rootsList := OrderedCollection new.
	self addPortfolioTreeRootsIn: rootsList.
	^rootsList! !


!Portfolio methodsFor: 'associating' stamp: 'VC 10/17/2023 15:08:20'!
addAsset: anAssetToAdd
	
	self assertAssetMeetsCriteriaForAllPortfolioAssociateTree: anAssetToAdd.
	associateAssets add: anAssetToAdd.
	anAssetToAdd addParentPortfolio: self.! !

!Portfolio methodsFor: 'associating' stamp: 'VC 10/18/2023 09:15:55'!
addParentPortfolio: aParentPortfolio
	parentPortfolios add: aParentPortfolio.! !

!Portfolio methodsFor: 'associating' stamp: 'VC 10/18/2023 09:16:19'!
assertAssetMeetsCriteriaForAllPortfolioAssociateTree: anAssetToAdd

	^ self portfoliosTreeRoots do: [:aRoot | 	anAssetToAdd assertAssetMeetsCriteriaToBeAddIn: aRoot]! !


!Portfolio methodsFor: 'testing' stamp: 'VC 10/18/2023 09:18:10'!
hasRegistered: aTransaction 
	^associateAssets anySatisfy: [:anAsset | anAsset hasRegistered: aTransaction].! !


!Portfolio methodsFor: 'transactions' stamp: 'VC 10/18/2023 14:24:45'!
addTransactionsIn: aTransactionsList
	
	associateAssets do: [:anAsset | anAsset addTransactionsIn: aTransactionsList ].! !

!Portfolio methodsFor: 'transactions' stamp: 'VC 10/18/2023 14:23:59'!
transactions
	| transactionsList |
	transactionsList := OrderedCollection new.
	self addTransactionsIn: transactionsList. 
	^transactionsList ! !


!Portfolio methodsFor: 'error handling' stamp: 'VC 10/17/2023 14:06:55'!
errorAccountAlreadyExists
	self error: self class accountAlreadyExistsErrorDescription ! !

!Portfolio methodsFor: 'error handling' stamp: 'VC 10/17/2023 14:12:12'!
errorPortfolioAlreadyExists
	self error: self class portfolioAlreadyExistsErrorDescription ! !


!Portfolio methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:34:34'!
assertAssetMeetsCriteriaToBeAddIn: aParentPortfolio 

	aParentPortfolio assertDoesNotAlreadyExistThePortfolioToAdd: self.
	self assertAssetsOfThePortfolioToAddDoNotAlreadyExistIn: aParentPortfolio.! !

!Portfolio methodsFor: 'assertions' stamp: 'VC 10/17/2023 14:33:02'!
assertAssetOf: aPortfolio doesNotIncludeTheAccountToAdd: anAccountToAdd
	self assertDoesNotAlreadyExistTheAccountToAdd: anAccountToAdd ! !

!Portfolio methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:34:53'!
assertAssetOf: aParentPortfolio doesNotIncludeThePortfolioToAdd: aPortfolioToAdd
	self assertDoesNotAlreadyExistThePortfolioToAdd: aPortfolioToAdd ! !

!Portfolio methodsFor: 'assertions' stamp: 'VC 10/18/2023 09:16:47'!
assertAssetsOfThePortfolioToAddDoNotAlreadyExistIn: aParentPortfolio

	associateAssets do: [ :anAsset | anAsset assertAssetMeetsCriteriaToBeAddIn: aParentPortfolio ].! !

!Portfolio methodsFor: 'assertions' stamp: 'VC 10/18/2023 09:17:14'!
assertDoesNotAlreadyExistTheAccountToAdd: anAccountToAdd

	associateAssets do: [ :anAsset | anAsset assertAssetOf: self doesNotIncludeTheAccountToAdd: anAccountToAdd ].! !

!Portfolio methodsFor: 'assertions' stamp: 'VC 10/17/2023 14:33:21'!
assertDoesNotAlreadyExistThePortfolioToAdd: aPortfolioToAdd

	(aPortfolioToAdd = self) ifTrue: [ self errorPortfolioAlreadyExists ].
	associateAssets do: [ :asset | asset assertAssetOf: self doesNotIncludeThePortfolioToAdd: aPortfolioToAdd ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JAFET 10/15/2023 19:03:31'!
accountAlreadyExistsErrorDescription
	^'This account has already been registered in the portfolio.'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JAFET 10/15/2023 20:19:25'!
portfolioAlreadyExistsErrorDescription
	^'This portfolio has already been registered in the portfolio.'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinantialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'VC 10/18/2023 14:26:00'!
addTransactionsIn: aTransactionsList
	
	aTransactionsList addAll: transactions .! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'VC 10/18/2023 14:36:58'!
balance

	^transactions inject: 0 into: [ :accumulateBalance :aTransaction | 
		aTransaction calculateBalance: accumulateBalance]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:35:58'!
assertAssetMeetsCriteriaToBeAddIn: aParentPortfolio 
	^aParentPortfolio assertDoesNotAlreadyExistTheAccountToAdd: self.! !

!ReceptiveAccount methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:36:07'!
assertAssetOf: aParentPortfolio doesNotIncludeTheAccountToAdd: anAccountToAdd
	self = anAccountToAdd ifTrue: [ aParentPortfolio errorAccountAlreadyExists].! !

!ReceptiveAccount methodsFor: 'assertions' stamp: 'VC 10/18/2023 14:36:15'!
assertAssetOf: aParentPortfolio doesNotIncludeThePortfolioToAdd: aPortfolioToAdd
	^true! !


!ReceptiveAccount methodsFor: 'associating' stamp: 'VC 10/18/2023 14:36:30'!
addParentPortfolio: aParentPortfolio! !
