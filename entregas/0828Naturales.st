!classDefinition: #I category: 'Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Naturales'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 19:26:30'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!I class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:42:53'!
+aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:27:57'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!I class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:05:21'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

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


!I class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: 'Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:17:54'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:50'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:49:39'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!II class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:05:29'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:00:34'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:24'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:24'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'BJGA 8/24/2023 21:43:24'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Naturales'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Naturales'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:18:05'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:39'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:39'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!III class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:05:35'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:40'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:40'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:40'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'JA 8/25/2023 21:09:40'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Naturales'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Naturales'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:18:15'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Naturales'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Naturales'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:18:23'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Naturales'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Naturales'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:18:31'!
* aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self].
	^self + (self * aNaturalNumber previous)! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
+aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
- aNaturalNumber
	aNaturalNumber  = I ifTrue: [^self previous].
	^self previous - aNaturalNumber previous.

	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
	self - aNaturalNumber < aNaturalNumber ifTrue: [^I].
	^(self - aNaturalNumber / aNaturalNumber) next.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^self previous < aNaturalNumber previous
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous
	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'VC 8/28/2023 17:06:06'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'VC 8/28/2023 17:29:26'!
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