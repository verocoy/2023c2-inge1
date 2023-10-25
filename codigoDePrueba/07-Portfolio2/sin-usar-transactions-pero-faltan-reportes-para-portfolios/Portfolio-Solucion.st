!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JAFET 10/25/2023 04:13:31'!
test08TransferDecreasesBalanceOfSenderAccount

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	
	Transfer from: senderAccount to: receiverAccount amount: 100.
	
	self assert: -100 equals: senderAccount balance.
! !


!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 11:20:03'!
test12AccountSummaryHasBalanceZeroWhenAccountCreated

	| account accountSummary |
	
	account := ReceptiveAccount new.
	accountSummary := OrderedCollection with: 'Balance = 0'.
		
	self assert: accountSummary equals: account accountSummary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:15:55'!
test13AccountSummaryWithDepositHasDepositAndBalance

	| account accountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Depósito por 100.'.
	accountSummary add: 'Balance = 100'.
		
	self assert: accountSummary equals: account accountSummary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:16:01'!
test14AccountSummaryWithWithdrawHasWithdrawAndBalance

	| account accountSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 on: account.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Extracción por 100.'.
	accountSummary add: 'Balance = -100'.
		
	self assert: accountSummary equals: account accountSummary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:16:06'!
test15AccountSummaryTransferSenderHasExpenseAndBalance

	| senderAccount receiverAccount accountSummary |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Salida por transferencia de 30.'.
	accountSummary add: 'Balance = -30'.
		
	self assert: accountSummary equals: senderAccount accountSummary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:16:10'!
test16AccountSummaryReceiverHasIncomeAndBalance

	| senderAccount receiverAccount accountSummary |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Entrada por transferencia de 30.'.
	accountSummary add: 'Balance = 30'.
		
	self assert: accountSummary equals: receiverAccount accountSummary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:15:22'!
test17AccountSummaryWithManyTransactions

	| account1 account2 accountSummary account1Summary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20.
	Transfer from: account2 to: account1 amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Depósito por 100.'.
	accountSummary add: 'Extracción por 50.'.
	accountSummary add: 'Salida por transferencia de 20.'.
	accountSummary add: 'Entrada por transferencia de 30.'.
	accountSummary add: 'Balance = 60'.
	
	account1Summary := account1 accountSummary.

	self assert: accountSummary equals: account1Summary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:25:19'!
test18TransferNetIsZeroWhenAccountCreated

	| account |
	
	account := ReceptiveAccount new.
		
	self assert: 0 equals: account transferNet.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:29:48'!
test19SenderAccountTransferNetDecrease

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.
		
	self assert: -30 equals: senderAccount transferNet.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:43:26'!
test20ReceiverAccountTransferNetIncrese

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 50.
		
	self assert: 50 equals: receiverAccount transferNet.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:49:09'!
test21AccountWithoutTransfersHasZeroAsTransferNet

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 0 equals: account transferNet.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/24/2023 13:52:53'!
test22TransferNetWithManyTransactions


	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20.
	Transfer from: account2 to: account1 amount: 30.

		
	self assert: 10 equals: account1 transferNet.
! !


!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'VC 10/20/2023 11:16:34'!
test09TransferIncreceBalanceOfReceiverAccount

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	
	Transfer from: senderAccount to: receiverAccount amount: 100.
	
	self assert: 100 equals: receiverAccount balance.
! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JAFET 10/25/2023 04:26:01'!
test10TransferKnowsTheAssociatesTransactions

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	
	transfer := Transfer from: senderAccount to: receiverAccount amount: 100.
	
	self assert: (senderAccount lastTransactionEquals: transfer withdrawPata).
	self assert: (receiverAccount lastTransactionEquals: transfer depositPata).
! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JAFET 10/25/2023 04:27:47'!
test11AssociatesTransferTransactionsKnowTheTrasfer

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	
	transfer := Transfer from: senderAccount to: receiverAccount amount: 100.
	
	self assert: (senderAccount transferOfLastTransactionEquals: transfer).
	self assert: (receiverAccount transferOfLastTransactionEquals: transfer).
! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'JAFET 10/25/2023 04:25:09'!
lastTransactionEquals: aTransfer 
	^transactions last = aTransfer.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'JAFET 10/25/2023 09:50:15'!
transferOfLastTransactionEquals: aTransfer
	(transactions last isKindOf: TransferAccountTransaction) ifFalse: [^false].
	^transactions last transfer = aTransfer.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:44:40'!
accountSummary
	^(AccountSummary for: self) execute.! !

!ReceptiveAccount methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:31:22'!
report: aReport
	transactions do: [ :transaction | transaction report: aReport ].! !

!ReceptiveAccount methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:44:26'!
transferNet

	^(TransferNet for: self) execute.! !


!classDefinition: #AccountReport category: 'Portfolio-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!


!AccountReport methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:32'!
reportDeposit: aDeposit

	self subclassResponsibility! !

!AccountReport methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:36'!
reportDepositTransfer: aDepositTransfer

	self subclassResponsibility! !

!AccountReport methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:39'!
reportWithdraw: aWithdraw

	self subclassResponsibility! !

!AccountReport methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:43'!
reportWithdrawTransfer: aWithdrawTransfer

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'Portfolio-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'instance creation' stamp: 'JAFET 10/25/2023 09:42:19'!
for: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'evaluating' stamp: 'JAFET 10/25/2023 09:46:08'!
execute
	
	account report: self.
	summary add: 'Balance = ', account balance asString.
	
	^summary.! !


!AccountSummary methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:42:57'!
reportDeposit: aDeposit
	summary add: ('Depósito por ', aDeposit value asString,'.').! !

!AccountSummary methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:43:26'!
reportDepositTransfer: aDepositTransfer 
	summary add: 	'Entrada por transferencia de ', aDepositTransfer value asString,'.'! !

!AccountSummary methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:43:39'!
reportWithdraw: aWithdraw
	summary add: ('Extracción por ', aWithdraw value asString,'.').! !

!AccountSummary methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:43:53'!
reportWithdrawTransfer: aWithdrawTransfer
	summary add: ('Salida por transferencia de ', aWithdrawTransfer value asString,'.').! !


!AccountSummary methodsFor: 'initialization' stamp: 'JAFET 10/25/2023 09:45:26'!
initializeFor: aReceptiveAccount
 
	account := aReceptiveAccount.
	summary := OrderedCollection new.! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'transferNetValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'evaluating' stamp: 'JAFET 10/25/2023 09:36:17'!
execute
	account report: self.
	
	^transferNetValue.! !


!TransferNet methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:36:31'!
reportDeposit: aDeposit ! !

!TransferNet methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:36:49'!
reportDepositTransfer: aDepositTransfer 
	transferNetValue := transferNetValue + aDepositTransfer value! !

!TransferNet methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:36:35'!
reportWithdraw: aWithdraw ! !

!TransferNet methodsFor: 'report' stamp: 'JAFET 10/25/2023 09:36:58'!
reportWithdrawTransfer: aWithdrawTransfer 
	transferNetValue := transferNetValue + aWithdrawTransfer value negated! !


!TransferNet methodsFor: 'initialization' stamp: 'JAFET 10/25/2023 09:39:15'!
initializeFor: aReceptiveAccount
 
	account := aReceptiveAccount.
	transferNetValue := 0.! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'VC 10/23/2023 19:31:14'!
initializeFor: aTransactionDetail

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'value' stamp: 'VC 10/24/2023 12:58:21'!
value

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'report' stamp: 'VC 10/24/2023 15:07:59'!
report: anAccountReport

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'VC 10/23/2023 19:14:42'!
for: aTransactionDetail

	^ self new initializeFor: aTransactionDetail ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'VC 10/23/2023 19:12:20'!
register: aTransactionDetail on: account

	| transaction |
	
	transaction := self for: aTransactionDetail.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #DirectAccountTransaction category: 'Portfolio-Solucion'!
AccountTransaction subclass: #DirectAccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DirectAccountTransaction methodsFor: 'value' stamp: 'VC 10/23/2023 18:41:03'!
value

	^ value! !


!DirectAccountTransaction methodsFor: 'initialization' stamp: 'VC 10/23/2023 18:40:52'!
initializeFor: aValue

	value := aValue ! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
DirectAccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'VC 10/24/2023 15:03:12'!
report: anAccountReport 
	^anAccountReport reportDeposit: self. ! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
DirectAccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'VC 10/24/2023 15:03:29'!
report: anAccountReport 
	^anAccountReport reportWithdraw: self.! !


!classDefinition: #TransferAccountTransaction category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferAccountTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferAccountTransaction methodsFor: 'initialization' stamp: 'VC 10/23/2023 19:15:11'!
initializeFor: aTransfer

	transfer := aTransfer .
! !


!TransferAccountTransaction methodsFor: 'transfer' stamp: 'VC 10/23/2023 19:57:45'!
transfer
	^transfer! !


!TransferAccountTransaction methodsFor: 'value' stamp: 'VC 10/24/2023 12:59:02'!
value
	
	^transfer amount! !


!classDefinition: #DepositTransfer category: 'Portfolio-Solucion'!
TransferAccountTransaction subclass: #DepositTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositTransfer methodsFor: 'balance' stamp: 'VC 10/23/2023 18:35:23'!
affectBalance: aBalance

	^aBalance + transfer amount.! !


!DepositTransfer methodsFor: 'report' stamp: 'VC 10/24/2023 15:03:41'!
report: anAccountReport 
	^anAccountReport reportDepositTransfer: self.! !


!classDefinition: #WithdrawTransfer category: 'Portfolio-Solucion'!
TransferAccountTransaction subclass: #WithdrawTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!WithdrawTransfer methodsFor: 'balance' stamp: 'VC 10/23/2023 18:35:14'!
affectBalance: aBalance

	^aBalance - transfer amount.! !


!WithdrawTransfer methodsFor: 'report' stamp: 'VC 10/24/2023 15:03:51'!
report: anAccountReport 
	^anAccountReport reportWithdrawTransfer: self.! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'withdraw deposit amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'amount' stamp: 'VC 10/23/2023 18:35:06'!
amount
	^amount.! !


!Transfer methodsFor: 'initialization' stamp: 'VC 10/23/2023 18:51:22'!
initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmount 
	withdraw := WithdrawTransfer register: self on: aSenderAccount.
	deposit := DepositTransfer register: self on: aReceiverAccount.
	amount := anAmount.
	
	
! !


!Transfer methodsFor: 'patas' stamp: 'VC 10/23/2023 19:41:11'!
depositPata
	^deposit ! !

!Transfer methodsFor: 'patas' stamp: 'VC 10/23/2023 19:40:59'!
withdrawPata
	^withdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'VC 10/20/2023 11:08:41'!
from: aSenderAccount to: aReceiverAccount amount: anAmount
	^self new initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmount ! !
