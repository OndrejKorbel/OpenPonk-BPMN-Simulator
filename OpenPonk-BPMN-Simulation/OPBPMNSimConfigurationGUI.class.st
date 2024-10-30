Class {
	#name : 'OPBPMNSimConfigurationGUI',
	#superclass : 'SpPresenter',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'initialization' }
OPBPMNSimConfigurationGUI >> initialize [

super initialize
]

{ #category : 'initialization' }
OPBPMNSimConfigurationGUI >> initializeLayout [

	self layout: SpGridLayout new
]

{ #category : 'initialization' }
OPBPMNSimConfigurationGUI >> initializePresenters [

	super initializePresenters.
	self initializeLayout
]

{ #category : 'initialization' }
OPBPMNSimConfigurationGUI >> initializeWindow: aWindow [

aWindow title: 'Simulator Configuration'
]
