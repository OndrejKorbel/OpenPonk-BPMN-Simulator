Class {
	#name : 'OPBPMNToken',
	#superclass : 'OPToken',
	#instVars : [
		'moved'
	],
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'initialization' }
OPBPMNToken >> initialize [

	super initialize.
	moved := false
]

{ #category : 'testing' }
OPBPMNToken >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	^ false
]

{ #category : 'testing' }
OPBPMNToken >> isSteppable [
	"can I step right now?"

	^ false
]

{ #category : 'accessing' }
OPBPMNToken >> moved [

	^ moved
]

{ #category : 'accessing' }
OPBPMNToken >> moved: aBoolean [

	moved := aBoolean
]
