Class {
	#name : 'OPBPMNInclusiveGatewaySimulator',
	#superclass : 'OPBPMNGatewaySimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNInclusiveGatewaySimulator >> fire [

	self canSendTokens ifFalse: [ ^ self ].
	self unmovedTokens do: [ :token |
		self removeToken: token.
		outgoingActive do: [ :flow | flow handleToken: token ] ]
]
