!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'JAFET 9/10/2023 05:26:45'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:32:28'!
useAsAddendOfEntero: anEntero
	"Entero + Entero"
	^self class with: (anEntero value integerValue + value)! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:35:29'!
useAsAddendOfFraction: aFraccion
	"Fraccion + Entero"
	^self + aFraccion.! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:45:58'!
useAsDivisorOfEntero: anEnteroAsDividend
	"Entero / Entero"
	^Fraccion with: anEnteroAsDividend over: self.
! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:46:40'!
useAsDivisorOfFraccion: aFraccionAsDividend
	"Fraccion / Entero"
	^(aFraccionAsDividend numerator / (aFraccionAsDividend denominator * self))! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:40:54'!
useAsFactorOfEntero: anEntero
	"Entero * Entero"
	^self class with: value * anEntero integerValue! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:37:24'!
useAsFactorOfFraccion: aFraccion
	^aFraccion useAsFactorOfEntero: self.

"
(aMultiplier isKindOf: Fraccion)
		ifTrue: [ ^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator) ].
		
	(aMultiplier isKindOf: Entero)
		ifTrue: [ ^aMultiplier  * self ].
	^self error: 'Estas intentando sumar una Fraccion con algo que no es un Entero ni un Fraccion.'
"! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:47:10'!
useAsSubtrahendOfEntero: anEnteroAsMinuend
	"Entero - Entero"
	^self class with: ((anEnteroAsMinuend value integerValue) - value).! !

!Entero methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:48:07'!
useAsSubtrahendOfFraccion: aFraccionAsMinuend
	"Fraccion - Entero"
	^(aFraccionAsMinuend numerator -  (self * aFraccionAsMinuend denominator)) / aFraccionAsMinuend denominator.
	! !


!Entero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:36:31'!
* aMultiplier
	^aMultiplier useAsFactorOfEntero: self.
"
	(aMultiplier isKindOf: Fraccion) ifTrue:
		[ ^((self class with: value) * aMultiplier numerator) / (aMultiplier denominator) ].
	(aMultiplier isKindOf: Entero) ifTrue: 
		[ ^self class with: value * aMultiplier integerValue ].
	^self error: 'Estas intentando sumar un Entero con algo que no es un Entero ni un Fraccion.'
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:39:19'!
+ anAdder 
	^anAdder useAsAddendOfEntero: self.	
"
	(anAdder isKindOf: Fraccion) ifTrue: 
		[ ^(((self class with: value) * anAdder denominator) + anAdder numerator) / (anAdder denominator) ].
	(anAdder isKindOf: Entero) ifTrue: 
		[ ^self class with: value + anAdder integerValue ].
	^self error: 'Estas intentando sumar un Entero con algo que no es un Entero ni un Fraccion.'

"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:39:24'!
- aSubtrahend 
	^aSubtrahend useAsSubtrahendOfEntero: self.
"
entero - (numerator/denominator) = 
6 - (3/2) = (6*2 - 3*uno) / (uno * 2) = (12 - 3) / (2) = 9/2
entero - (numerator/denominator) = (entero*denominator - numerator) / (denominator)
	
	(aSubtrahend isKindOf: Fraccion) ifTrue: 
		[ ^((self * aSubtrahend denominator) - aSubtrahend numerator) / aSubtrahend denominator ].
	(aSubtrahend isKindOf: Entero) ifTrue: 
		[ ^self class with: value - aSubtrahend integerValue ].
	^self error: 'Estas intentando restar un Entero con algo que no es un Entero ni una Fraccion.'
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:39:33'!
/ aDivisor
	^aDivisor useAsDivisorOfEntero: self.
	
"Entero / something"
"something divideByEntero: self"
"
(aDivisor isKindOf: Fraccion) ifTrue: 
		[ ^(self * aDivisor denominator) / aDivisor numerator ].
	(aDivisor isKindOf: Entero) ifTrue: 
		[ ^Fraccion with: self over: aDivisor ].
	^self error: 'Estas intentando dividir un Entero con algo que no es un Entero ni una Fraccion.'
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 21:45:21'!
fibonacci

	self subclassResponsibility! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:55:50'!
checkDividendAndCreateFraccion: aDivisor
	
	| greatestCommonDivisor numerator denominator| 
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator createFraccion: numerator.! !

!Entero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:55:37'!
checkDivisorAndCreateFraccion: aDividend

	^aDividend checkDividendAndCreateFraccion: self.! !

!Entero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:55:50'!
createFraccion: aNumerator

	^Fraccion new initializeWith: aNumerator over: self
! !


!Entero methodsFor: 'initialization' stamp: 'JAFET 9/10/2023 22:03:00'!
initializeWith: aValue

	self subclassResponsibility! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'JAFET 9/10/2023 22:13:58'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'VC 9/11/2023 21:16:11'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 1 ifTrue: [ ^Uno new initializeOne ].
	aValue = 0 ifTrue: [ ^Cero new initializeZero ].
	aValue < 0 ifTrue: [ ^Negativo new initializeWith: aValue ].
	^Positivo new initializeWith: aValue! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 21:50:33'!
fibonacci

	^Entero with: 1.! !


!Cero methodsFor: 'initialization' stamp: 'JAFET 9/10/2023 22:02:43'!
initializeZero
	
	value := 0! !


!Cero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:55:13'!
checkDividendAndCreateFraccion: aDivisor
	
	^self! !

!Cero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:55:37'!
checkDivisorAndCreateFraccion: aDividend
	
	^self class error: self class canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 20:56:15'!
createFraccion: aNumerator

	^aNumerator! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'VC 9/11/2023 20:55:37'!
checkDivisorAndCreateFraccion: aDividend

	^aDividend negated / self negated	! !

!Negativo methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 22:34:54'!
fibonacci

	^self error: Negativo negativeFibonacciErrorDescription.! !


!Negativo methodsFor: 'initialization' stamp: 'JAFET 9/10/2023 22:01:18'!
initializeWith: aValue 
	
	value := aValue! !


!classDefinition: #Positivo category: 'Numero-Exercise'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positivo methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 21:50:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !


!Positivo methodsFor: 'initialization' stamp: 'JAFET 9/10/2023 22:00:42'!
initializeWith: aValue 

	value := aValue.! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 21:50:13'!
fibonacci

	^Entero with: 1.! !


!Uno methodsFor: 'initialization' stamp: 'JAFET 9/10/2023 22:02:32'!
initializeOne
	
	value := 1! !


!Uno methodsFor: 'fraccion creation' stamp: 'VC 9/11/2023 21:03:30'!
createFraccion: aNumerator

	^aNumerator ! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:37:39'!
* aMultiplier 
	^aMultiplier useAsFactorOfFraccion: self.
"
(aMultiplier isKindOf: Fraccion)
		ifTrue: [ ^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator) ].
		
	(aMultiplier isKindOf: Entero)
		ifTrue: [ ^aMultiplier  * self ].
	^self error: 'Estas intentando sumar una Fraccion con algo que no es un Entero ni un Fraccion.'
"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:35:06'!
+ anAdder 
	^anAdder useAsAddendOfFraction: self.
"
	(anAdder isKindOf: Fraccion) ifTrue: 
		[ 
			| newNumerator newDenominator |
		
			newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
			newDenominator := denominator * anAdder denominator.
		
			^newNumerator / newDenominator.
		].
	
	(anAdder isKindOf: Entero) ifTrue: 
		[
			
			""Fraccion + Entero = Entero + Fraccion
			3/5 + 4 = 4 + 3/5"".
			^anAdder + self.
			
		].
	^self error: 'Estas intentando sumar una Fraccion con algo que no es un Entero ni un Fraccion.'
"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:39:49'!
- aSubtrahend 
	^aSubtrahend useAsSubtrahendOfFraccion: self.
"
(aSubtrahend isKindOf: Fraccion) ifTrue: 
		[
			| newNumerator newDenominator |
	
			newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
			newDenominator := denominator * aSubtrahend denominator.
			
			^newNumerator / newDenominator
		].
	""(numerator/denominator) - entero = ((numerator * UNO) - (denominator * entero)) / denominator * UNO""
	(aSubtrahend isKindOf: Entero) ifTrue:
		[ ^(numerator -  (aSubtrahend * denominator)) / denominator ].
	^self error: 'Estas intentando restar un Fraccion con algo que no es un Entero ni una Fraccion.'

"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JAFET 9/10/2023 05:39:53'!
/ aDivisor 
	^aDivisor useAsDivisorOfFraccion: self.
"
	(aDivisor isKindOf: Fraccion) ifTrue: 
		[ ^(numerator * aDivisor denominator) / (denominator * aDivisor numerator) ].
	(aDivisor isKindOf: Entero) ifTrue: 
		[ ^(numerator / (denominator * aDivisor)) ].
	^self error: 'Estas intentando dividir una Fraccion con algo que no es un Entero ni una Fraccion.'

"
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:33:48'!
useAsAddendOfEntero: anEntero
	"Entero + Fraccion"
	^((anEntero * denominator) + numerator) / (denominator)
! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:35:06'!
useAsAddendOfFraction: aFraccion
	"Fraccion + Fraccion"
	
	| newNumerator newDenominator |

	newNumerator := (aFraccion numerator * denominator) + (aFraccion denominator * numerator).
	newDenominator := aFraccion denominator * denominator.

	^newNumerator / newDenominator.! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:46:09'!
useAsDivisorOfEntero: anEnteroAsDividend
	"Entero / Fraccion"
	^(anEnteroAsDividend * denominator) / numerator! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:46:27'!
useAsDivisorOfFraccion: aFraccionAsDividend
	"Fraccion / Fraccion"
	^(aFraccionAsDividend numerator * denominator) / (aFraccionAsDividend denominator * numerator)! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:36:45'!
useAsFactorOfEntero: anEntero
	"Entero * Fraccion"
	^ (anEntero * numerator) / denominator! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'JAFET 9/10/2023 05:37:39'!
useAsFactorOfFraccion: aFraccion
	"Fraccion * Fraccion" 
	^(aFraccion numerator * numerator) / (aFraccion denominator * denominator)! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:47:21'!
useAsSubtrahendOfEntero: anEnteroAsMinuend
	"Entero - Fraccion"
	^((anEnteroAsMinuend * denominator) - numerator) / denominator.! !

!Fraccion methodsFor: 'aux to arithmetic ops' stamp: 'VC 9/11/2023 21:47:37'!
useAsSubtrahendOfFraccion: aFraccionAsMinuend
	"Fraccion - Fraccion"
	
	| newNumerator newDenominator |

	newNumerator := (aFraccionAsMinuend numerator * denominator) - (aFraccionAsMinuend denominator * numerator).
	newDenominator := aFraccionAsMinuend denominator * denominator.
	
	^newNumerator / newDenominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'VC 9/11/2023 20:55:37'!
with: aDividend over: aDivisor

	
	^aDivisor checkDivisorAndCreateFraccion: aDividend.

"		
	| greatestCommonDivisor numerator denominator |
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	"! !
