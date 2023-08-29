!classDefinition: #I category: '4Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: '4Naturales'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:40:37'!
* aNaturalNumber
	^aNaturalNumber! !

!I class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:42:53'!
+aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 20:58:39'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^true.! !

!I class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:18:31'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:37:24'!
restarseA: aNaturalNumber
	^ aNaturalNumber previous.
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:53:27'!
timesToDivide: aNaturalNumber
	^ aNaturalNumber.
	! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: '4Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: '4Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:44:09'!
* aNaturalNumber
	^aNaturalNumber + (self previous * aNaturalNumber)! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:50'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:35:17'!
- aNaturalNumber
	^aNaturalNumber restarseA: self.

	! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:52:46'!
/ aNaturalNumber
	^aNaturalNumber timesToDivide: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:00:34'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 21:12:31'!
next
	next ifNotNil: [^next].
	next := II createChildNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:24'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:24'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:39:08'!
restarseA: aNaturalNumber
	^aNaturalNumber previous - self previous.
! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 20:58:22'!
timesToDivide: aNaturalNumber
	aNaturalNumber = self ifTrue: [^I].
	^self timesToDivide: aNaturalNumber  - self.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: '4Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: '4Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: '4Naturales'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: '4Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: '4Naturales'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: '4Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: '4Naturales'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: '4Naturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 21:15:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!