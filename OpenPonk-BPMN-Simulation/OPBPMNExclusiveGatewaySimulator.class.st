Class {
	#name : 'OPBPMNExclusiveGatewaySimulator',
	#superclass : 'OPBPMNGatewaySimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNExclusiveGatewaySimulator >> fire [

	self canSendTokens ifFalse: [ ^ self ].
	self unmovedTokens do: [ :token |
		self removeToken: token.
		outgoingActive first handleToken: token ]
]
