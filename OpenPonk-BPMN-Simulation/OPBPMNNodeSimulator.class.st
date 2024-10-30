Class {
	#name : 'OPBPMNNodeSimulator',
	#superclass : 'OPElementSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPBPMNNodeSimulator >> canSendTokens [

	^ outgoing notEmpty
]

{ #category : 'actions' }
OPBPMNNodeSimulator >> fire [

	self canSendTokens ifFalse: [ ^ self ].
	self unmovedTokens do: [ :token |
		self removeToken: token.
		self outgoingDo: [ :flow | flow handleToken: token copy ] ]
]

{ #category : 'as yet unclassified' }
OPBPMNNodeSimulator >> handleToken: aToken [

	self handleToken: aToken from: nil
]

{ #category : 'as yet unclassified' }
OPBPMNNodeSimulator >> handleToken: aToken from: aFlow [

	self addToken: aToken
]

{ #category : 'testing' }
OPBPMNNodeSimulator >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	"^ self subclassResponsibility"

	^ true
]

{ #category : 'testing' }
OPBPMNNodeSimulator >> isSteppable [
	"can I step right now?"

	^ tokens notEmpty
]

{ #category : 'initialization' }
OPBPMNNodeSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		resetActions;
		addAction: [ :item | item fire ]
]

{ #category : 'as yet unclassified' }
OPBPMNNodeSimulator >> unmovedTokens [

	^ self tokens reject: [ :t | t moved ]
]
