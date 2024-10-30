Class {
	#name : 'OPBPMNDataObjectSimulator',
	#superclass : 'OPBPMNNodeSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNDataObjectSimulator >> fire [

	self unmovedTokens do: [ :token | self removeToken: token ]
]
