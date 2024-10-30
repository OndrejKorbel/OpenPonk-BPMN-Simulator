Class {
	#name : 'OPBPMNSimulator',
	#superclass : 'OPDiagramSimulator',
	#category : 'OpenPonk-BPMN-Simulation-Simulation',
	#package : 'OpenPonk-BPMN-Simulation',
	#tag : 'Simulation'
}

{ #category : 'initialization' }
OPBPMNSimulator class >> initialClassMapping [

	^ super initialClassMapping
		  at: OPBPMNDataFlowModel put: OPBPMNDataFlowSimulator;
		  at: OPBPMNFlowModel put: OPBPMNSequenceFlowSimulator;
		  at: OPBPMNMessageFlowModel put: OPBPMNMessageFlowSimulator;
		  at: OPBPMNBoundaryEventModel put: OPBPMNBoundaryEventSimulator;
		  at: OPBPMNDataObjectModel put: OPBPMNDataObjectSimulator;
		  at: OPBPMNActivityModel put: OPBPMNActivitySimulator;
		  at: OPBPMNCollapsedSubProcessModel
		  put: OPBPMNCollapsedSubProcessSimulator;
		  at: OPBPMNEndEventModel put: OPBPMNEndEventSimulator;
		  at: OPBPMNIntermediateEventModel
		  put: OPBPMNIntermediateEventSimulator;
		  at: OPBPMNStartEventModel put: OPBPMNStartEventSimulator;
		  at: OPBPMNGatewayModel put: OPBPMNGatewaySimulator;
		  at: OPBPMNSubProcessModel put: OPBPMNSubProcessSimulator;
		  at: OPBPMNPoolModel put: OPBPMNPoolSimulator;
		  yourself
]

{ #category : 'stepping' }
OPBPMNSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		fromSteppableElements;
		orderByPriority;
		selectAll;
		resetActions;
		addAction: [ :item | item step ]
]

{ #category : 'actions' }
OPBPMNSimulator >> step [

	super step.
	self tokens do: [ :t | t moved: false ]
]
