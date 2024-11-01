Class {
	#name : 'OPBPMNStartEventSimulator',
	#superclass : 'OPBPMNEventSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'initialization' }
OPBPMNStartEventSimulator >> initialize [

	super initialize.
	bpmnTokens := 1
]
