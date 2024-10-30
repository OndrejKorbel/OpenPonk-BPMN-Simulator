Class {
	#name : 'OPBPMNEndEventSimulator',
	#superclass : 'OPBPMNEventSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNEndEventSimulator >> fire [

	self model type = OPBPMNNodeType Terminate
		ifFalse: [ self unmovedTokens do: [ :t | self removeToken: t ] ]
		ifTrue: [ diagramSimulator elementsDo: [ :el | el removeAllTokens ] ]
]
