Class {
	#name : 'OPBPMNDataFlowSimulator',
	#superclass : 'OPBPMNFlowSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNDataFlowSimulator >> fire [

	| aToken |
	self unmovedTokens do: [ :token | self removeToken: token ].
	self source tokens ifEmpty: [ ^ self ].
	aToken := OPBPMNToken new moved: true.
	self addToken: aToken.
	self target handleToken: aToken copy from: self
]

{ #category : 'as yet unclassified' }
OPBPMNDataFlowSimulator >> handleToken: aToken [
	"do nothing"

]

{ #category : 'initialization' }
OPBPMNDataFlowSimulator >> initialize [

	super initialize.
	priority := -1
]

{ #category : 'testing' }
OPBPMNDataFlowSimulator >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	^ true
]

{ #category : 'testing' }
OPBPMNDataFlowSimulator >> isSteppable [
	"can I step right now?"

	^ true
]
