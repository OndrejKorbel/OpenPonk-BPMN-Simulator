Class {
	#name : 'OPBPMNMessageFlowSimulator',
	#superclass : 'OPBPMNFlowSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNMessageFlowSimulator >> fire [

	self unmovedTokens do: [ :token |
		self removeToken: token.
		self target handleToken: token from: self ]
]

{ #category : 'as yet unclassified' }
OPBPMNMessageFlowSimulator >> handleToken: aToken [

	self addToken: aToken 

	
]

{ #category : 'as yet unclassified' }
OPBPMNMessageFlowSimulator >> isSimulable [ 

	^ true
]

{ #category : 'as yet unclassified' }
OPBPMNMessageFlowSimulator >> isSteppable [

	^ tokens notEmpty 
]
