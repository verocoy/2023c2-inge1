!classDefinition: #Bill category: 'Clase1 - Tercera Actividad'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase1 - Tercera Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: 'Clase1 - Tercera Actividad'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'salud' stamp: 'VLC 8/14/2023 21:47:08'!
caminar: unaCantidadDeKilometros
	energia := energia - (1 days * unaCantidadDeKilometros) - 3 days! !

!Bill class methodsFor: 'salud' stamp: 'VLC 8/14/2023 21:41:34'!
comer: unaCantidadDeKilosDeCerebro
	energia := energia + (4 days * unaCantidadDeKilosDeCerebro)! !

!Bill class methodsFor: 'salud' stamp: 'VLC 8/14/2023 21:07:31'!
energia
	^energia! !

!Bill class methodsFor: 'salud' stamp: 'VLC 8/14/2023 21:16:05'!
nace
	energia := 28 days! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'VLC 8/14/2023 22:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (Duration seconds: -1036800 nanoSeconds: 0).! !

Bill initializeAfterFileIn!