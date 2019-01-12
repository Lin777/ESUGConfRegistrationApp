Class {
	#name : #ERContainerBankTransferPayment,
	#superclass : #ERGeneralContainerView,
	#instVars : [
		'controller',
		'fee',
		'bankAccountInformation',
		'bankInformation',
		'dialog'
	],
	#category : #'ESUGApp-Components'
}

{ #category : #'as yet unclassified' }
ERContainerBankTransferPayment class >> on: anAttendee withContent: aContent [
	| form |
	form := self new.
	form attendee: anAttendee.
	form content: aContent.
	form initializeFee.
	^ form
]

{ #category : #rendering }
ERContainerBankTransferPayment >> content: anObject [
	content := anObject
]

{ #category : #rendering }
ERContainerBankTransferPayment >> headers [
	^ #('Bank Code' 'Counter Code' 'Account Number' 'RIB Key' 'Bank Address')
]

{ #category : #rendering }
ERContainerBankTransferPayment >> initializeDialog [
	dialog := ERDialog new
		title: 'Cancel Modify Affiliation';
		message: 'Are you sure you want to cancel?';
		idClose: 'buttonClose';
		idOpen: 'back-state';
		okCallback: [ self returnToThePreviousState ]
]

{ #category : #rendering }
ERContainerBankTransferPayment >> initializeFee [
	| pageController |
	pageController := ERController new.
	fee := pageController
		feePerTypeCurrencyOf: attendee.
	bankAccountInformation := fee bankAccountInformation.
	bankInformation := bankAccountInformation bankInformation
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderBody: html [
	html
		tableBody: [ html
				tableRow: [ html mdlTableCell: [ html text: bankInformation code ].
					html
						mdlTableCell: [ html text: bankInformation counterCode ].
					html
						mdlTableCell: [ html text: bankAccountInformation ribKey ].
					html
						mdlTableCell: [ html text: bankAccountInformation number ].
					html
						mdlTableCell: [ html text: bankInformation addressString ] ] ]
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderHeaders: html [
	html
		tableHead: [ html
				tableRow: [ self headers do: [ :each | html mdlTableHeading: each ] ] ]
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderInfoBank: html [
	html break.
	self
		createTextStrongWithoutParagraph: 'Bank name:  '
		withText: bankInformation name1
		on: html.
	self
		createTextStrongWithoutParagraph: 'International Bank Account Numer (IBAN):  '
		withText: bankAccountInformation iban
		on: html.
	self
		createTextStrongWithoutParagraph: 'BIC(Bank Identifier Code):  '
		withText: bankInformation bic
		on: html.
	self
		createTextStrongWithoutParagraph: 'Account owner:  '
		withText: bankAccountInformation owner
		on: html.
	html break
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderInfoBankTransfer: html [
	html break.
	html
		text:
			'BANK TRANSFER to "' , bankAccountInformation owner
				, '" (in ' , fee currency
				,
					'). the tranfer should be "whitout cost to the beneficiary" (i.e
        your organization shoul pay all bank transfer fees) Now make they bank transfer from your account, either right awaty or within the next few days.
        (In the text field transfer, please put your email. to speed payment reconcilliation.) To record this data, either save/print this page now or click "OK" the "My Registration" then "Generate Invoice",
        and save/print that. (you can login again and generate another copy of the invoice at any time.).'.
	html break.
	html break
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderPageOn: html [
	self renderInfoBankTransfer: html.
	self renderTableInfoBank: html.
	self renderInfoBank: html.
	html horizontalRule.
	self initializeDialog.
	self
		createColoredAnchorButton: 'Back'
		id: 'back-state'
		on: html
]

{ #category : #rendering }
ERContainerBankTransferPayment >> renderTableInfoBank: html [
	html mdlTable
		class: 'mdl-shadow--2dp';
		style: 'width:100%;';
		with: [ self renderHeaders: html.
			self renderBody: html ]
]

{ #category : #accessing }
ERContainerBankTransferPayment >> title [
	^ 'Bank Transfer'
]