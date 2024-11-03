Class {
	#name : 'OPBPMNNodeSimulator',
	#superclass : 'OPElementSimulator',
	#instVars : [
		'bpmnTokens'
	],
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'adding' }
OPBPMNNodeSimulator >> addBpmnTokens: anInteger from: aFlow [

	self bpmnTokens: self bpmnTokens + anInteger
]

{ #category : 'accessing' }
OPBPMNNodeSimulator >> bpmnTokens [

	^ bpmnTokens
]

{ #category : 'accessing' }
OPBPMNNodeSimulator >> bpmnTokens: anInteger [

	bpmnTokens := anInteger 
]

{ #category : 'testing' }
OPBPMNNodeSimulator >> canSendBpmnTokens [

	^ outgoing notEmpty
]

{ #category : 'actions' }
OPBPMNNodeSimulator >> fire [

	self canSendBpmnTokens ifFalse: [ ^ self ].
	self outgoingDo: [ :flow | flow addBpmnTokens: self bpmnTokens ].
	self bpmnTokens: 0
]

{ #category : 'initialization' }
OPBPMNNodeSimulator >> initialize [

	super initialize.
	bpmnTokens := 0
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

	^ self bpmnTokens > 0
]

{ #category : 'initialization' }
OPBPMNNodeSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		resetActions;
		addAction: [ :item | item fire ]
]
