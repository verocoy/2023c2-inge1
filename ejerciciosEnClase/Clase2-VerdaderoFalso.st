!classDefinition: #Falso category: 'Clase2-VerdaderoFalso'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase2-VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'Clase2-VerdaderoFalso'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 20:51:17'!
no
	^Verdadero! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:05:57'!
o: unBooleano 
	^unBooleano! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:22:32'!
siEsFalso: aClosure 
	^aClosure value! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:19:24'!
siEsVerdadero: aClosure 
	^nil! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:03:34'!
y: unBooleano 
	^Falso! !


!classDefinition: #Verdadero category: 'Clase2-VerdaderoFalso'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase2-VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'Clase2-VerdaderoFalso'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 20:47:26'!
no
	^Falso! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:07:32'!
o: unBooleano 
	^Verdadero! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:21:57'!
siEsFalso: aClosure 
	^nil! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:17:32'!
siEsVerdadero: aClosure 
	^aClosure value! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:00:38'!
y: unBooleano 
	^unBooleano! !


!classDefinition: #VerdaderoFalsoTest category: 'Clase2-VerdaderoFalso'!
DenotativeObject subclass: #VerdaderoFalsoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase2-VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerdaderoFalsoTest class' category: 'Clase2-VerdaderoFalso'!
VerdaderoFalsoTest class
	instanceVariableNames: ''!

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 20:55:53'!
test01NoVerdaderoEsFalso
	Assert that: Verdadero no isEqualTo:  Falso! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 20:56:05'!
test02NoFalsoEsVerdadero
	Assert that: Falso no isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 20:58:18'!
test03VerdaderoYFalsoEsFalso
	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:01:12'!
test04VerdaderoYVerdaderoEsVerdadero
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:27:37'!
test05FalsoYFalsoEsFalso
	Assert that: (Falso y: Falso) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:26:40'!
test05FalsoYVerdaderoEsFalso
	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:28:20'!
test06FalsoOFalsoEsFalso
	Assert that: (Falso o: Falso) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:28:00'!
test06FalsoOVerdaderoEsVerdadero
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:29:06'!
test07VerdaderoOFalsoEsVerdadero
	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:28:52'!
test07VerdaderoOVerdaderoEsVerdadero
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:30:07'!
test08FalsoSiEsVerdaderoNoEjecuta
	Assert that: (Falso siEsVerdadero: ['Ejecuta']) isEqualTo: nil! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:30:42'!
test08VerdaderoSiEsVerdaderoEjecuta
	Assert that: (Verdadero siEsVerdadero: ['Ejecuta']) isEqualTo: 'Ejecuta'! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:31:02'!
test09FalsoSiEsFalsoEjecuta
	Assert that: (Falso siEsFalso: ['Ejecuta']) isEqualTo: 'Ejecuta'! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'VC 8/17/2023 21:30:37'!
test09VerdaderoSiEsFalsoNoEjecuta
	Assert that: (Verdadero siEsFalso: ['Ejecuta']) isEqualTo: nil! !
