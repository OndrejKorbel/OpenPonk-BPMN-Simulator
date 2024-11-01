Class {
	#name : 'OPBPMNInclusiveGatewaySimulator',
	#superclass : 'OPBPMNGatewaySimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNInclusiveGatewaySimulator >> fire [

	self canSendBpmnTokens ifFalse: [ ^ self ].
	self outgoingActive do: [ :flow |
		flow addBpmnTokens: self bpmnTokens ].
	self bpmnTokens: 0
]
