Class {
	#name : 'OPBPMNSequenceFlowSimulator',
	#superclass : 'OPBPMNFlowSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPBPMNSequenceFlowSimulator >> isSteppable [
	"can I step right now?"

	^ self source bpmnTokens > 0 or: self bpmnTokens > 0
]
