!classDefinition: #LuzAmarilla category: '4SemaforoTeorica'!
DenotativeObject subclass: #LuzAmarilla
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4SemaforoTeorica'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzAmarilla class' category: '4SemaforoTeorica'!
LuzAmarilla class
	instanceVariableNames: ''!

!LuzAmarilla class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:12:37'!
apagar
	self shouldBeImplemented.! !

!LuzAmarilla class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:05:28'!
prender
	self shouldBeImplemented.! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: '4SemaforoTeorica'!
DenotativeObject subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4SemaforoTeorica'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: '4SemaforoTeorica'!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: ''!

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:29:00'!
avisarPrecaucionPorEncendido
	5 timesRepeat: [self titilarLuzAmarilla]! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:39:02'!
esperarTiempo: unTiempo

	^ (Delay for: unTiempo) wait! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:31:44'!
prender
	self avisarPrecaucionPorEncendido ! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 19:39:21'!
titilarLuzAmarilla
	LuzAmarilla prender.
	self esperarTiempo: 0.5*second.
	LuzAmarilla apagar.
	self esperarTiempo: 0.5*second.! !
