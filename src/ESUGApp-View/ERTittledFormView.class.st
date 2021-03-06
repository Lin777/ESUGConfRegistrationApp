"
Description
--------------------

I render a form with an specific title
"
Class {
	#name : #ERTittledFormView,
	#superclass : #ERTittledView,
	#instVars : [
		'form',
		'callback',
		'messageComponent',
		'dialog'
	],
	#category : #'ESUGApp-View-View'
}

{ #category : #'as yet unclassified' }
ERTittledFormView class >> on: anAttendee withContent: aContent [
	| form |
	form := self new.
	form attendee: anAttendee.
	form content: aContent.
	form initializeForm.
	^ form
]

{ #category : #accessing }
ERTittledFormView >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
ERTittledFormView >> cancelForm [
	form cancel.
	cancelCallback value
]

{ #category : #accessing }
ERTittledFormView >> content: anObject [
	content := anObject
]

{ #category : #initialization }
ERTittledFormView >> initialize [
	super initialize.
	messageComponent := ERAlert warningAlert id: 'formAlert'.
]

{ #category : #initialization }
ERTittledFormView >> initializeDialog [ 
	dialog := ERDialog cancelDialog 
		idOpen: 'cancel';
		okCallback: [self cancelForm] 
]

{ #category : #initialization }
ERTittledFormView >> initializeForm [
	form := attendee asComponent 
	addDecoration: MAValidationDecoration new;
	 yourself
]

{ #category : #rendering }
ERTittledFormView >> renderAcceptButtonOn: html [
	html mdlButton
		colored;
		id: 'accept-change-affiliation' ;
		callback: [ self saveForm ];
		with: 'Accept'
]

{ #category : #rendering }
ERTittledFormView >> renderCancelButtonOn: html [
	self initializeDialog .
	html mdlAnchorButton 
		id: 'cancelButton';
		openDialogWithId: 'cancel'; 
		colored;
		with: 'Cancel'.
]

{ #category : #rendering }
ERTittledFormView >> renderPageOn: html [
	html form: [ 
	html render: messageComponent .
	html render: form.
	self renderCancelButtonOn: html.
	self renderAcceptButtonOn: html.
	html render: dialog]
]

{ #category : #saving }
ERTittledFormView >> saveForm [
	[|object|
	object := form save.
	callback cull: object model]
	on: ERException 
	do:  [ :exception | 
			messageComponent errorMessage: exception messageText ]
]

{ #category : #accessing }
ERTittledFormView >> title [
	^ title
]
