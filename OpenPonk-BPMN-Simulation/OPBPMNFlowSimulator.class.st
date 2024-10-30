Class {
	#name : 'OPBPMNFlowSimulator',
	#superclass : 'OPEdgeSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNFlowSimulator >> fire [

	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
OPBPMNFlowSimulator >> handleToken: aToken [

	^ self subclassResponsibility
]

{ #category : 'testing' }
OPBPMNFlowSimulator >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	^ self subclassResponsibility 
]

{ #category : 'testing' }
OPBPMNFlowSimulator >> isSteppable [
	"can I step right now?"

	^ self subclassResponsibility 
]

{ #category : 'initialization' }
OPBPMNFlowSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		resetActions;
		addAction: [ :item | item fire ]
]

{ #category : 'as yet unclassified' }
OPBPMNFlowSimulator >> unmovedTokens [

	^ self tokens reject: [ :t | t moved ]
]
