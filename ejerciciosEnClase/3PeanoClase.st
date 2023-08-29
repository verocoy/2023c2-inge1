!classDefinition: #I category: 'Clase3-Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Clase3-Peano'!
I class
	instanceVariableNames: 'sucesor'!

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 09:41:17'!
* unNumeroNatural
	^unNumeroNatural! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:03:58'!
+ unNumeroNatural
	^unNumeroNatural next! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:35:04'!
- unNumeroNatural 
	^self! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 09:45:50'!
/ unNumeroNatural
	^self! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:02:02'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'].
	^sucesor! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := II.! !


!classDefinition: #II category: 'Clase3-Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Clase3-Peano'!
II class
	instanceVariableNames: 'sucesor anterior'!

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 09:40:27'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:41:25'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:54:31'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:51:43'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:36:37'!
anterior
	^anterior! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:26:47'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/24/2023 21:18:14'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := III.
	anterior := I.! !


!classDefinition: #III category: 'Clase3-Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Clase3-Peano'!
III class
	instanceVariableNames: 'sucesor anterior'!

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:53:49'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
anterior
	^anterior! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:19:21'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIII.
	anterior := II.! !


!classDefinition: #IIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Clase3-Peano'!
IIII class
	instanceVariableNames: 'sucesor anterior'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
anterior
	^anterior! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:55:48'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIIII.
	anterior := III.! !


!classDefinition: #IIIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Clase3-Peano'!
IIIII class
	instanceVariableNames: 'sucesor anterior'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior
	^anterior! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIIIII.
	anterior := IIII.! !


!classDefinition: #IIIIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Clase3-Peano'!
IIIIII class
	instanceVariableNames: 'sucesor anterior'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior
	^anterior! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIIIIII.
	anterior := IIIII.! !


!classDefinition: #IIIIIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Clase3-Peano'!
IIIIIII class
	instanceVariableNames: 'sucesor anterior'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior
	^anterior! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIIIIIII.
	anterior := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Clase3-Peano'!
IIIIIIII class
	instanceVariableNames: 'sucesor anterior'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior
	^anterior! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := IIIIIIIII.
	anterior := IIIIIII.! !


!classDefinition: #IIIIIIIII category: 'Clase3-Peano'!
DenotativeObject subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase3-Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: 'Clase3-Peano'!
IIIIIIIII class
	instanceVariableNames: 'sucesor anterior'!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self.].
	^self + (self * unNumeroNatural anterior).! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
+ unNumeroNatural
	^ self anterior + unNumeroNatural next! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
- unNumeroNatural
	unNumeroNatural = I ifTrue: [^self anterior.].
	^self anterior - unNumeroNatural anterior! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
/ unNumeroNatural
	unNumeroNatural = self ifTrue: [^I.].
	^(self - unNumeroNatural / unNumeroNatural) next.! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior
	^anterior! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
anterior: unNumeroNatural
	anterior := unNumeroNatural.! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/25/2023 14:56:33'!
next
	sucesor ifNil: [sucesor := self cloneNamed: self name,'I'.
		sucesor anterior: self].
	^sucesor! !


!IIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/25/2023 14:57:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	sucesor := nil.
	anterior := IIIIIIII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!