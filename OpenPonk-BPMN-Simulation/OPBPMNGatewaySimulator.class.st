Class {
	#name : 'OPBPMNGatewaySimulator',
	#superclass : 'OPBPMNFlowNodeSimulator',
	#instVars : [
		'outgoingActive'
	],
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPBPMNGatewaySimulator >> fire [

	| type |
	self canSendTokens ifFalse: [ ^ self ].
	type := self model type.
	type = OPBPMNNodeType Parallel ifTrue: [ self fireExclusive ].
	type = OPBPMNNodeType Inclusive ifTrue: [ self fireExclusive ].
	type = OPBPMNNodeType Exclusive ifTrue: [ self fireExclusive ].
	type = OPBPMNNodeType Complex ifTrue: [ self fireExclusive ].
	type = OPBPMNNodeType Eventbased ifTrue: [ self fireExclusive ].
	type = OPBPMNNodeType None ifTrue: [ self fireExclusive ]
]

{ #category : 'as yet unclassified' }
OPBPMNGatewaySimulator >> fireExclusive [

	self unmovedTokens do: [ :token |
		self removeToken: token.
		outgoingActive do: [ :flow | flow handleToken: token ] ]
]

{ #category : 'as yet unclassified' }
OPBPMNGatewaySimulator >> handleToken: aToken from: aFlow [

	| type |
	type := self model type.
	type = OPBPMNNodeType Parallel ifTrue: [ self addToken: aToken ].
	type = OPBPMNNodeType Inclusive ifTrue: [ self addToken: aToken ].
	type = OPBPMNNodeType Exclusive ifTrue: [ self addToken: aToken ].
	type = OPBPMNNodeType Complex ifTrue: [ self addToken: aToken ].
	type = OPBPMNNodeType Eventbased ifTrue: [ self addToken: aToken ].
	type = OPBPMNNodeType None ifTrue: [ self addToken: aToken ]
]

{ #category : 'as yet unclassified' }
OPBPMNGatewaySimulator >> handleTokenParallel: aToken from: aFlow [

	
]

{ #category : 'actions' }
OPBPMNGatewaySimulator >> initialize [

	super initialize.
	outgoingActive := OrderedCollection new
]

{ #category : 'creation' }
OPBPMNGatewaySimulator >> loadConnectedItems [
	"loads and/or connects appropriate tokens and elements"

	super loadConnectedItems.
	model outgoing ifEmpty: [ ^ self ].
	outgoingActive := model outgoing
		                  select: [ :flow | flow type = #Default ]
		                  thenCollect: [ :flow |
		                  diagramSimulator simulatorOf: flow ].
	outgoingActive ifEmpty: [
		outgoingActive add:
			(diagramSimulator simulatorOf: model outgoing first) ]
]

{ #category : 'accessing' }
OPBPMNGatewaySimulator >> outgoingActive [

	^ outgoingActive
]

{ #category : 'accessing' }
OPBPMNGatewaySimulator >> outgoingActive: anOrderedCollection [

	outgoingActive := anOrderedCollection
]
