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

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 11:15:25'!
test02PortfolioWithAccountsHasSumOfTheirBalances
	| portfolio account1 account2 |
	portfolio := Portfolio new.

	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 10 on: account2.
	
	portfolio addPortfolio: account1.
	portfolio addPortfolio: account2.
	
	self assert: 90 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 11:14:41'!
test03PortfolioWithPortfoliosAndAccountsHasSumOfTheirBalances
	| parentPortfolio portfolio1 account1 account2 |
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	portfolio1 addAccount: account1.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 10 on: account2.
	
	parentPortfolio addPortfolio: portfolio1 .
	parentPortfolio addAccount: account2.
	
	self assert: 90 equals: parentPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 12:24:18'!
test04PortfolioWithPortfoliosAndAccountsKnowsRegisterTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 on: account1.
	portfolio1 addAccount: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw register: 10 on: account2.
	
	parentPortfolio addPortfolio: portfolio1 .
	parentPortfolio addAccount: account2.
	
	self assert: (parentPortfolio hasRegistered: transaction1).
	self assert: (parentPortfolio hasRegistered: transaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 13:53:27'!
test05PortfolioWithPortfoliosAndAccountsDoesntKnowUnregisterTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit for: 100.
	portfolio1 addAccount: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw for: 10.
	
	parentPortfolio addPortfolio: portfolio1 .
	parentPortfolio addAccount: account2.
	
	self deny: (parentPortfolio hasRegistered: transaction1).
	self deny: (parentPortfolio hasRegistered: transaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'VC 10/10/2023 14:00:16'!
test06PortfolioWithPortfoliosAndAccountsKnowsTheirsTransactions
	
	| parentPortfolio portfolio1 account1 account2 transaction1 transaction2 |
	
	parentPortfolio := Portfolio new.
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 on: account1 .
	portfolio1 addAccount: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Withdraw register: 10 on: account2 .
	
	parentPortfolio addPortfolio: portfolio1 .
	parentPortfolio addAccount: account2.
	
	self assert: parentPortfolio transactions size = 2.
	self assert: (parentPortfolio transactions includes: transaction1).
	self assert: (parentPortfolio transactions includes: transaction2).! !


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


!AccountTransaction methodsFor: 'balance' stamp: 'VC 10/10/2023 10:43:51'!
calculateBalance: accumilateBalance

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


!Deposit methodsFor: 'balance' stamp: 'VC 10/10/2023 10:43:14'!
calculateBalance: accumilateBalance 
	^accumilateBalance + value! !

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


!Withdraw methodsFor: 'balance' stamp: 'VC 10/10/2023 10:43:35'!
calculateBalance: accumilateBalance 
	^accumilateBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'associateAccounts associatePortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'VC 10/10/2023 11:07:22'!
associateAccountsBalance

	^ associateAccounts sum: [:account | account balance ] ifEmpty: [0]! !

!Portfolio methodsFor: 'balance' stamp: 'VC 10/10/2023 11:07:50'!
associatePortfoliosBalance

	^ associatePortfolios sum: [:portfolio | portfolio balance ] ifEmpty: [0]! !

!Portfolio methodsFor: 'balance' stamp: 'VC 10/10/2023 11:07:50'!
balance
	^(self associateAccountsBalance) + (self associatePortfoliosBalance).! !


!Portfolio methodsFor: 'initialization' stamp: 'VC 10/10/2023 11:02:08'!
initialize
	associateAccounts := OrderedCollection new.
	associatePortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'associating' stamp: 'VC 10/10/2023 10:55:32'!
addAccount: anAccount 
	associateAccounts add: anAccount.! !

!Portfolio methodsFor: 'associating' stamp: 'VC 10/10/2023 11:01:08'!
addPortfolio: aPortfolio 
	associatePortfolios add: aPortfolio .! !


!Portfolio methodsFor: 'testing' stamp: 'VC 10/10/2023 13:49:59'!
associateAccountsHasRegistered: aTransaction

	^ associateAccounts anySatisfy: [:account | account hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'testing' stamp: 'VC 10/10/2023 13:49:43'!
associatePortfoliosHasRegistered: aTransaction

	^ associatePortfolios anySatisfy: [:portfolio | portfolio hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'testing' stamp: 'VC 10/10/2023 13:49:59'!
hasRegistered: aTransaction 
	^(self associateAccountsHasRegistered: aTransaction) or: [self associatePortfoliosHasRegistered: aTransaction ].! !


!Portfolio methodsFor: 'transactions' stamp: 'VC 10/10/2023 14:23:57'!
associateAccountsTransactions

	^ associateAccounts collect: [:account | account transactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'VC 10/10/2023 14:24:22'!
associatePortfoliosTransactions

	^ associatePortfolios collect: [:portfolio | portfolio transactions]! !

!Portfolio methodsFor: 'transactions' stamp: 'VC 10/10/2023 14:24:49'!
transactions
	^(self associateAccountsTransactions addAll: self associatePortfoliosTransactions ;yourself) flatten.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'VC 10/10/2023 10:42:41'!
balance

	^transactions inject: 0 into: [ :accumilateBalance :aTransaction | 
		aTransaction calculateBalance: accumilateBalance]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
