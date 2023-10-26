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


!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test12AccountSummaryHasBalanceZeroWhenPortfolioCreated

	| portfolio accountSummary |
	
	portfolio := Portfolio new.
	accountSummary := OrderedCollection with: 'Balance = 0'.
		
	self assert: accountSummary equals: ((AccountSummary for: portfolio) execute).
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test16AccountSummaryHasBalanceZeroWhenPortfolioCreated

	| portfolio accountSummary |
	
	portfolio := Portfolio new.
	accountSummary := OrderedCollection with: 'Balance = 0'.
		
	self assert: accountSummary equals: ((AccountSummary for: portfolio) execute).
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test17AccountSummaryPortfolioWithAccountsHasAllTransactionsAndOneBalance

	| portfolio account1 account2 accountSummary portfolioSummary |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	portfolio add: account1.
	portfolio add: account2.

	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20.
	Transfer from: account2 to: account1 amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Depósito por 100.'.
	accountSummary add: 'Extracción por 50.'.
	accountSummary add: 'Salida por transferencia de 20.'.
	accountSummary add: 'Entrada por transferencia de 30.'.
	accountSummary add: 'Entrada por transferencia de 20.'.
	accountSummary add: 'Salida por transferencia de 30.'.
	accountSummary add: 'Balance = 50'.
	
	portfolioSummary := (AccountSummary for: portfolio) execute.

	self assert: accountSummary equals: portfolioSummary.
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test18AccountSummaryPortfolioWithPortfoliosHasAllTransactionsAndOneBalance
	"Paso de una este test"

	| parentPortfolio portfolio1 portfolio2 account1 account2 accountSummary portfolioSummary |
	
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	portfolio1 add: account1.
	portfolio2 add: account2.
	parentPortfolio add: portfolio1.
	portfolio1 add: portfolio2.

	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20.
	Transfer from: account2 to: account1 amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Depósito por 100.'.
	accountSummary add: 'Extracción por 50.'.
	accountSummary add: 'Salida por transferencia de 20.'.
	accountSummary add: 'Entrada por transferencia de 30.'.
	accountSummary add: 'Entrada por transferencia de 20.'.
	accountSummary add: 'Salida por transferencia de 30.'.
	accountSummary add: 'Balance = 50'.
	
	portfolioSummary := (AccountSummary for: parentPortfolio) execute.

	self assert: accountSummary equals: portfolioSummary.
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test19TransferNetIsZeroWhenPortfolioCreated

	| portfolio |
	
	portfolio := Portfolio new.
		
	self assert: 0 equals: ((TransferNet for: portfolio) execute).
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test20TransferNetPortfolioWithAccountsHasSumOfAccountsTransferNet
	"Pasó de una el test"

	| portfolio account1 account2 account3 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.

	portfolio add: account1.
	portfolio add: account2.

	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 50. "account1 -50; account2 50"
	Transfer from: account2 to: account1 amount: 30. "account1 -20; account2 20"
	Transfer from: account3 to: account1 amount: 150. "account1 130; account2 20"

	self assert: 150 equals: ((TransferNet for: portfolio) execute).
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test21TransferNetPortfolioWithPortfoliosHasSumOfPortfoliosAndAccountsTransferNet
	"Pasó de una el test"

	| parentPortfolio portfolio1 portfolio2 account1 account2 account3 |
	
	parentPortfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio1 add: account1 .
	portfolio2 add: account2.
	parentPortfolio add: portfolio1.
	portfolio1 add: portfolio2.

	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 50. "account1 -50; account2 50"
	Transfer from: account2 to: account1 amount: 30. "account1 -20; account2 20"
	Transfer from: account3 to: account1 amount: 150. "account1 130; account2 20"

	self assert: 150 equals: ((TransferNet for: parentPortfolio) execute).
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'JAFET 10/25/2023 18:29:35'!
test22StructureReportWorksForEmptyPortfolio

	| portfolio |
	portfolio := Portfolio named: 'Portfolio unico'.
	
	self assert: (portfolio structure) equals: 'Portfolio unico'.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:41:34'!
test23StructureReportWorksForPortfolioOfDepthOne

	| portfolio account1 account2 expectedReport |
	account1 := ReceptiveAccount named: 'Cuenta uno'.
	account2 := ReceptiveAccount named: 'Cuenta dos'.
	portfolio := Portfolio named: 'Portfolio unico' with: account1 with: account2.
	
	expectedReport := 'Portfolio unico', String newLineString, String tab, 'Cuenta uno', String newLineString, String tab, 'Cuenta dos'.
	
	self assert: (portfolio structure) equals: expectedReport.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:41:48'!
test24StructureReportWorksForPortfolioOfDepthGreaterThanOne

	| portfolio account1 account2 expectedReport portfolio2 portfolio3 account3 |
	account1 := ReceptiveAccount named: 'Cuenta uno'.
	account2 := ReceptiveAccount named: 'Cuenta dos'.
	account3 := ReceptiveAccount named: 'Cuenta tres'.
	portfolio3 := Portfolio named: 'Portfolio nieto' with: account3.
	portfolio2 := Portfolio named: 'Portfolio hijo' with: account2 with: portfolio3.
	portfolio := Portfolio named: 'Portfolio padre' with: account1 with: portfolio2.
	
	expectedReport := 'Portfolio padre', String newLineString, String tab, 'Cuenta uno', String newLineString, String tab, 'Portfolio hijo', String newLineString, String tab, String tab, 'Cuenta dos', String newLineString, String tab, String tab, 'Portfolio nieto', String newLineString, String tab, String tab, String tab, 'Cuenta tres'.

	self assert: (portfolio structure) equals: expectedReport.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:41:59'!
test25StructureReportWorksForAssignmentExample

	|  angiesAccount childrenPortfolio expectedReport familyPortfolio johnsAccount myAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	expectedReport := 'Portfolio de la familia', String newLineString, String tab, 'Cuenta mia', String newLineString, String tab, 'Portfolio de hijos', String newLineString, String tab, String tab, 'Cuenta de Juan', String newLineString, String tab, String tab, 'Cuenta de Angeles'.
	
	self assert: (familyPortfolio structure) equals: expectedReport.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:39:25'!
test26CompleteStructureReportWorksForEmptyPortfolio

	| portfolio expectedReport |
	portfolio := Portfolio named: 'Portfolio unico'.
	expectedReport := 'Portfolio unico', String newLineString, 'Balance = 0'.
	
	self assert: (portfolio completeStructure) equals: expectedReport.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:42:20'!
test27CompleteStructureReportWorksForPortfolioOfDepthOne

	| portfolio account1 account2 expectedReport |
	account1 := ReceptiveAccount named: 'Cuenta uno'.
	account2 := ReceptiveAccount named: 'Cuenta dos'.
	Deposit register: 100 on:  account1.
	Deposit register: 100 on:  account2.
	Withdraw register: 50 on: account2.
	portfolio := Portfolio named: 'Portfolio unico' with: account1 with: account2.
	
	expectedReport := 'Portfolio unico', String newLineString, String tab, 'Cuenta uno', String newLineString, String tab, String tab, 'Depósito por 100.', String newLineString, String tab, String tab, 'Balance = 100', String newLineString, String tab, 'Cuenta dos', String newLineString, String tab, String tab, 'Depósito por 100.', String newLineString, String tab, String tab, 'Extracción por 50.', String newLineString, String tab, String tab, 'Balance = 50', String newLineString, 'Balance = 150'.
	
	self assert: (portfolio completeStructure) equals: expectedReport.! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:43:04'!
test28CompleteStructureReportWorksForAssignmentExample

	|  angiesAccount childrenPortfolio expectedReport familyPortfolio johnsAccount myAccount ghostAccount |
	"Esta cuenta fantasma no pertenece al portfolio, por enunciado."
	ghostAccount := ReceptiveAccount named: 'Cuenta fantasma que no aparece en el enunciado'.
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	Deposit register: 100 on: johnsAccount.
	Withdraw register: 50 on: johnsAccount.
	Transfer from: angiesAccount to: ghostAccount amount: 30.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: 60 on: myAccount.
	Withdraw register: 20 on: myAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	"Debi usar eso que inicializaba valores en tests, no recuerdo como se llama. Por usar Extract Method ahora tengo self, self, self..."
	expectedReport := 'Portfolio de la familia', String newLineString, String tab, 'Cuenta mia', String newLineString, String tab, String tab, 'Depósito por 60.', String newLineString, String tab, String tab, 'Extracción por 20.', String newLineString, String tab, String tab, 'Balance = 40',String newLineString, String tab, 'Portfolio de hijos', String newLineString, String tab, String tab, 'Cuenta de Juan', String newLineString, String tab, String tab, String tab, 'Depósito por 100.', String newLineString, String tab, String tab, String tab, 'Extracción por 50.', String newLineString, String tab, String tab, String tab, 'Balance = 50', String newLineString, String tab, String tab, 'Cuenta de Angeles', String newLineString, String tab, String tab, String tab, 'Salida por transferencia de 30.', String newLineString, String tab, String tab, String tab, 'Balance = -30', String newLineString, String tab, 'Balance = 20', String newLineString, 'Balance = 60'.
	self assert: (familyPortfolio completeStructure) equals: expectedReport.
! !

!PortfolioTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 10:46:51'!
test29PortfolioReportShouldUseOnPortfolio

	| account  |
	
	account := ReceptiveAccount new.
	
	
	self
		should: [CompleteStructure for: account]
		raise: Error 
		withMessageText: CompleteStructure reportExecuteOnlyForPortfolioErrorDescription.! !


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


!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test12AccountSummaryHasBalanceZeroWhenAccountCreated

	| account accountSummary |
	
	account := ReceptiveAccount new.
	accountSummary := OrderedCollection with: 'Balance = 0'.
		
	self assert: accountSummary equals: ((AccountSummary for: account) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test13AccountSummaryWithDepositHasDepositAndBalance

	| account accountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Depósito por 100.'.
	accountSummary add: 'Balance = 100'.
		
	self assert: accountSummary equals: ((AccountSummary for: account) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test14AccountSummaryWithWithdrawHasWithdrawAndBalance

	| account accountSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 on: account.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Extracción por 100.'.
	accountSummary add: 'Balance = -100'.
		
	self assert: accountSummary equals: ((AccountSummary for: account) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test15AccountSummaryTransferSenderHasExpenseAndBalance

	| senderAccount receiverAccount accountSummary |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Salida por transferencia de 30.'.
	accountSummary add: 'Balance = -30'.
		
	self assert: accountSummary equals: ((AccountSummary for: senderAccount) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
test16AccountSummaryReceiverHasIncomeAndBalance

	| senderAccount receiverAccount accountSummary |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.

	accountSummary := OrderedCollection new.
	accountSummary add: 'Entrada por transferencia de 30.'.
	accountSummary add: 'Balance = 30'.
		
	self assert: accountSummary equals: ((AccountSummary for: receiverAccount) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:36:34'!
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
	
	account1Summary := (AccountSummary for: account1) execute.

	self assert: accountSummary equals: account1Summary.
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test18TransferNetIsZeroWhenAccountCreated

	| account |
	
	account := ReceptiveAccount new.
		
	self assert: 0 equals: ((TransferNet for: account) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test19SenderAccountTransferNetDecrease

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 30.
		
	self assert: -30 equals: ((TransferNet for: senderAccount) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test20ReceiverAccountTransferNetIncrese

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Transfer from: senderAccount to: receiverAccount amount: 50.
		
	self assert: 50 equals: ((TransferNet for: receiverAccount) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test21AccountWithoutTransfersHasZeroAsTransferNet

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 0 equals: ((TransferNet for: account) execute).
! !

!ReceptiveAccountTest methodsFor: 'tests - reports' stamp: 'VC 10/26/2023 09:40:33'!
test22TransferNetWithManyTransactions


	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on:  account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20.
	Transfer from: account2 to: account1 amount: 30.

		
	self assert: 10 equals: ((TransferNet for: account1) execute).
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

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'VC 10/26/2023 10:34:51'!
test23TransferAccountsShouldBeReceptiveAccount


	| account1 account2 |
	
	account1 := Portfolio new.
	account2 := Portfolio new.
	

		
	self 
		should: [Transfer from: account2 to: account1 amount: 30.]
		raise: Error 
		withMessageText: Transfer senderAndReceiverShouldBeReceptiveAccountsDescriptionError.
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
	instanceVariableNames: 'accounts parents name'
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


!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:52:52'!
initialize

	super initialize.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := self class defaultName.! !

!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:48:23'!
initializeWith: anAccount
	
	self initialize.
	self add: anAccount.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:48:13'!
initializeWith: anAccount with: anotherAccount
	
	self initialize.
	self add: anAccount.
	self add: anotherAccount.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:45:47'!
initializeWithName: aName 

	self initialize.
	name := aName.! !

!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:49:24'!
initializeWithName: aName with: anAccount 
	
	self initializeWith: anAccount.
	name := aName.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:49:41'!
initializeWithName: aName with: anAccount with: anotherAccount
	
	self initializeWith: anAccount with: anotherAccount.
	name := aName.
	! !


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


!Portfolio methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 21:17:30'!
completeStructure

	^(CompleteStructure for: self) execute.! !

!Portfolio methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 21:02:59'!
structure

	^(Structure for: self) execute.! !

!Portfolio methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 20:01:53'!
useAsPortfolioForPortfolioReport: aReport
	
	accounts do: [ :account | aReport useForPortfolioReport: account ].! !

!Portfolio methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 20:52:19'!
useForPortfolioReport: aReport

	^aReport doPortfolioReportWithPortfolio: self.! !


!Portfolio methodsFor: 'account reports' stamp: 'JAFET 10/25/2023 18:54:03'!
name
	^name.! !

!Portfolio methodsFor: 'account reports' stamp: 'JAFET 10/25/2023 19:39:47'!
report: aReport 
	accounts do: [:account | account report: aReport]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'class initialization' stamp: 'JAFET 10/25/2023 10:14:02'!
defaultName 
	^'Un portfolio cualquiera'.! !

!Portfolio class methodsFor: 'class initialization' stamp: 'JAFET 10/25/2023 10:12:07'!
named: aName 
	^self new initializeWithName: aName.! !

!Portfolio class methodsFor: 'class initialization' stamp: 'VC 10/26/2023 09:49:24'!
named: aName with: anAccount 
	^self new initializeWithName: aName with: anAccount.! !

!Portfolio class methodsFor: 'class initialization' stamp: 'VC 10/26/2023 09:49:41'!
named: aName with: anAccount with: anotherAccount

	^self new initializeWithName: aName with: anAccount with: anotherAccount.! !

!Portfolio class methodsFor: 'class initialization' stamp: 'VC 10/26/2023 09:50:04'!
with: anAccount

	^self new initializeWith: anAccount.! !

!Portfolio class methodsFor: 'class initialization' stamp: 'VC 10/26/2023 09:50:25'!
with: anAccount with: anotherAccount

	^self new initializeWith: anAccount with: anotherAccount.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:53:05'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	name := self class defaultName.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:52:21'!
initializeWithName: aName

	self initialize.
	name := aName.! !


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


!ReceptiveAccount methodsFor: 'account reports' stamp: 'JAFET 10/25/2023 09:44:40'!
accountSummary
	^(AccountSummary for: self) execute.! !

!ReceptiveAccount methodsFor: 'account reports' stamp: 'JAFET 10/25/2023 09:31:22'!
report: aReport
	transactions do: [ :transaction | transaction report: aReport ].! !

!ReceptiveAccount methodsFor: 'account reports' stamp: 'JAFET 10/25/2023 09:44:26'!
transferNet

	^(TransferNet for: self) execute.! !


!ReceptiveAccount methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 10:44:13'!
name
	^name.! !

!ReceptiveAccount methodsFor: 'portfolio reports' stamp: 'JAFET 10/25/2023 21:03:46'!
useForPortfolioReport: aReport

	^aReport doPortfolioReportWithAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'class initialization' stamp: 'JAFET 10/25/2023 10:31:09'!
named: aName
	^self new initializeWithName: aName.! !


!ReceptiveAccount class methodsFor: 'instance defaults' stamp: 'JAFET 10/25/2023 10:33:56'!
defaultName 
	^'Una cuenta cualquiera'.! !


!classDefinition: #AccountReportManager category: 'Portfolio-Solucion'!
Object subclass: #AccountReportManager
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReportManager methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:32'!
reportDeposit: aDeposit

	self subclassResponsibility! !

!AccountReportManager methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:36'!
reportDepositTransfer: aDepositTransfer

	self subclassResponsibility! !

!AccountReportManager methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:39'!
reportWithdraw: aWithdraw

	self subclassResponsibility! !

!AccountReportManager methodsFor: 'report' stamp: 'VC 10/24/2023 15:06:43'!
reportWithdrawTransfer: aWithdrawTransfer

	self subclassResponsibility! !


!AccountReportManager methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:55:33'!
initializeFor: anAccount

	account := anAccount.! !


!AccountReportManager methodsFor: 'evaluating' stamp: 'JAFET 10/25/2023 22:09:48'!
execute

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReportManager class' category: 'Portfolio-Solucion'!
AccountReportManager class
	instanceVariableNames: ''!

!AccountReportManager class methodsFor: 'instance creation' stamp: 'JAFET 10/25/2023 09:42:19'!
for: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
AccountReportManager subclass: #AccountSummary
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


!AccountSummary methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:55:24'!
initializeFor: anAccount
 
	super initializeFor: anAccount.
	summary := OrderedCollection new.! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
AccountReportManager subclass: #TransferNet
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


!TransferNet methodsFor: 'initialization' stamp: 'VC 10/26/2023 09:55:52'!
initializeFor: anAccount
 
	super initializeFor: anAccount.
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


!DirectAccountTransaction methodsFor: 'initialization' stamp: 'VC 10/26/2023 10:52:40'!
initializeFor: aValue

	super initialize.
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

!TransferAccountTransaction methodsFor: 'initialization' stamp: 'VC 10/26/2023 10:52:46'!
initializeFor: aTransfer

	super initialize.
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


!classDefinition: #PortfolioReportManager category: 'Portfolio-Solucion'!
Object subclass: #PortfolioReportManager
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioReportManager methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:09:18'!
doPortfolioReportWithAccount: anAccount

	self subclassResponsibility! !

!PortfolioReportManager methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:09:22'!
doPortfolioReportWithPortfolio: aPortfolio

	self subclassResponsibility! !

!PortfolioReportManager methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:09:26'!
execute

	self subclassResponsibility! !

!PortfolioReportManager methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:09:34'!
useForPortfolioReport: anAccountOrPortfolio

	self subclassResponsibility! !


!PortfolioReportManager methodsFor: 'initialization' stamp: 'VC 10/26/2023 10:01:45'!
initializeFor: aPortfolio

	portfolio := aPortfolio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioReportManager class' category: 'Portfolio-Solucion'!
PortfolioReportManager class
	instanceVariableNames: ''!

!PortfolioReportManager class methodsFor: 'error description' stamp: 'VC 10/26/2023 10:32:35'!
reportExecuteOnlyForPortfolioErrorDescription
	^'This report is only for Portfolios'! !


!PortfolioReportManager class methodsFor: 'class initialization' stamp: 'VC 10/26/2023 10:36:56'!
for: aPortfolio
	
	(aPortfolio isKindOf: Portfolio) ifFalse: [self error: self reportExecuteOnlyForPortfolioErrorDescription].
	
	^self new initializeFor: aPortfolio.! !


!classDefinition: #CompleteStructure category: 'Portfolio-Solucion'!
PortfolioReportManager subclass: #CompleteStructure
	instanceVariableNames: 'indentation newLine structure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!CompleteStructure methodsFor: 'initialization' stamp: 'VC 10/26/2023 10:02:02'!
initializeFor: aPortfolio

	super initializeFor: aPortfolio.
	indentation := String tab.
	newLine := String newLineString.
	structure := ''.! !


!CompleteStructure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:17:11'!
decreaseIndentation

	indentation := indentation allButLast.! !

!CompleteStructure methodsFor: 'execution' stamp: 'VC 10/26/2023 09:36:34'!
doPortfolioReportWithAccount: anAccount
	| oldIndentation |
	structure := structure, newLine, indentation, anAccount name.
	oldIndentation := indentation.
	self increaseIndentation.
	((AccountSummary for: anAccount) execute) do: [ :transactionString | structure := structure, newLine, indentation, transactionString ].
	indentation := oldIndentation.! !

!CompleteStructure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:17:11'!
doPortfolioReportWithPortfolio: aPortfolio

	structure := structure, newLine, indentation, aPortfolio name.
	self increaseIndentation.
	aPortfolio useAsPortfolioForPortfolioReport: self.
	self decreaseIndentation.
	structure := structure, newLine, indentation, 'Balance = ', aPortfolio balance asString.
! !

!CompleteStructure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 21:42:48'!
execute
	structure := structure, portfolio name.
	portfolio useAsPortfolioForPortfolioReport: self.
	structure := structure, newLine, 'Balance = ', portfolio balance asString.
	^structure.! !

!CompleteStructure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:16:59'!
increaseIndentation

	indentation := indentation, String tab! !

!CompleteStructure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 21:36:00'!
useForPortfolioReport: anAccountOrPortfolio

	anAccountOrPortfolio useForPortfolioReport: self.! !


!classDefinition: #Structure category: 'Portfolio-Solucion'!
PortfolioReportManager subclass: #Structure
	instanceVariableNames: 'indentation newLine structure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Structure methodsFor: 'initialization' stamp: 'VC 10/26/2023 10:02:12'!
initializeFor: aPortfolio

	super initializeFor: aPortfolio.
	indentation := String tab.
	newLine := String newLineString.
	structure := ''.! !


!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:18:06'!
decreaseIndentation

	indentation := indentation allButLast.! !

!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 21:00:17'!
doPortfolioReportWithAccount: anAccount

	structure := structure, String newLineString, indentation, anAccount name.! !

!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:16:23'!
doPortfolioReportWithPortfolio: aPortfolio

	structure := structure, newLine, indentation, aPortfolio name.
	self increaseIndentation.
	aPortfolio useAsPortfolioForPortfolioReport: self.
	self decreaseIndentation.! !

!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 21:02:42'!
execute
	structure := structure, portfolio name.
	portfolio useAsPortfolioForPortfolioReport: self.
	^structure.! !

!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 22:18:00'!
increaseIndentation

	indentation := indentation, String tab.! !

!Structure methodsFor: 'execution' stamp: 'JAFET 10/25/2023 20:53:15'!
useForPortfolioReport: anAccountOrPortfolio

	^anAccountOrPortfolio useForPortfolioReport: self.! !


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

!Transfer class methodsFor: 'instance creation' stamp: 'VC 10/26/2023 10:35:50'!
from: aSenderAccount to: aReceiverAccount amount: anAmount
	
	(aSenderAccount isKindOf: ReceptiveAccount) ifFalse: [self error: self senderAndReceiverShouldBeReceptiveAccountsDescriptionError].
	(aReceiverAccount isKindOf: ReceptiveAccount) ifFalse: [self error: self senderAndReceiverShouldBeReceptiveAccountsDescriptionError].

	^self new initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmount ! !


!Transfer class methodsFor: 'error description' stamp: 'VC 10/26/2023 10:24:36'!
senderAndReceiverShouldBeReceptiveAccountsDescriptionError
	^'Sender and receiver should be Receptive Account'! !
