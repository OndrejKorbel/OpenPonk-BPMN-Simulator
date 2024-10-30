Class {
	#name : 'OPBPMNSequenceFlowSimulator',
	#superclass : 'OPBPMNFlowSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNSequenceFlowSimulator >> fire [
	"do nothing"

	
]

{ #category : 'as yet unclassified' }
OPBPMNSequenceFlowSimulator >> handleToken: aToken [

	aToken moved: true.
	self target handleToken: aToken from: self
]

{ #category : 'testing' }
OPBPMNSequenceFlowSimulator >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	^ false
]

{ #category : 'testing' }
OPBPMNSequenceFlowSimulator >> isSteppable [
	"can I step right now?"

	^ false
]
