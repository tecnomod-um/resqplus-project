// ------------------------- Aliases ----------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir // Needed for R5 status code system? Check binding
Alias: UCUM = http://unitsofmeasure.org

// FHIR R5 Resource Aliases
Alias: FHIR_Procedure = http://hl7.org/fhir/StructureDefinition/Procedure
Alias: FHIR_Extension = http://hl7.org/fhir/StructureDefinition/Extension
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_CodeableConcept = http://hl7.org/fhir/StructureDefinition/CodeableConcept
Alias: FHIR_CodeableReference = http://hl7.org/fhir/StructureDefinition/CodeableReference // For R5 reason/used
Alias: FHIR_Location = http://hl7.org/fhir/StructureDefinition/Location
Alias: FHIR_Observation = http://hl7.org/fhir/StructureDefinition/Observation // For reason target
Alias: FHIR_DiagnosticReport = http://hl7.org/fhir/StructureDefinition/DiagnosticReport // For reason target
Alias: FHIR_Condition = http://hl7.org/fhir/StructureDefinition/Condition // For reason target

// URLs for Custom CodeSystems
Alias: StrokeProcNotDoneReasonCS_URL = http://example.org/fhir/CodeSystem/stroke-proc-not-done-reason-cs
Alias: SwallowScreenTimeCS_URL = http://example.org/fhir/CodeSystem/swallow-screen-time-cs
Alias: ProcedureTimingContextCS_URL = http://example.org/fhir/CodeSystem/procedure-timing-context-cs

// URLs for ValueSets (used in bindings)
Alias: CarotidImagingModalityVS_URL = http://example.org/ValueSet/carotid-imaging-modality-vs
Alias: BrainImagingModalityVS_URL = http://example.org/ValueSet/brain-imaging-modality-vs
Alias: ThrombectomyComplicationVS_URL = http://example.org/ValueSet/thrombectomy-complication-vs
Alias: StrokeProcNotDoneReasonVS_URL = http://example.org/fhir/ValueSet/stroke-proc-not-done-reason-vs
Alias: SwallowingScreeningTimingCategoryVS_URL = http://example.org/ValueSet/swallowing-screening-timing-category-vs
Alias: PerforationProceduresVS_URL = http://example.org/fhir/ValueSet/perforation-proceduresValueset
Alias: SwallowProceduresVS_URL = http://example.org/fhir/ValueSet/swallow-proceduresValueset
Alias: ProcedureTimingContextVS_URL = http://example.org/fhir/ValueSet/procedure-timing-context-vs

// URLs for Custom Extensions
Alias: ProcPerfElsewhereExt_URL = http://example.org/StructureDefinition/procedure-performed-elsewhere-indicator-ext
Alias: SwallowScreenTimeExt_URL = http://example.org/StructureDefinition/swallowing-screening-timing-category-ext
Alias: ProcTimingContextExt_URL = http://example.org/fhir/StructureDefinition/procedure-timing-context-ext

// ------------------- CodeSystems and ValueSets (R5 Compatible) -------------

// --- ValueSet: Carotid Imaging Modalities ---
ValueSet: CarotidImagingModalityVS
Id: carotid-imaging-modality-vs
* ^url = CarotidImagingModalityVS_URL
* ^version = "1.0.0"
* ^title = "Carotid Arteries Imaging Modality ValueSet"
* ^description = "Defines codes for different types of carotid artery imaging."
* ^status = #active
* include SCT#58920005 "Angiography of carotid artery (procedure)"
* include SCT#416940007 "Doppler ultrasonography of carotid arteries (procedure)"
* include SCT#419949007 "Computed tomography angiography of intracranial artery with contrast (procedure)"
* include SCT#418994000 "Magnetic resonance angiography of intracranial structure (procedure)"

// --- ValueSet: Brain Imaging Modalities ---
ValueSet: BrainImagingModalityVS
Id: brain-imaging-modality-vs
* ^url = BrainImagingModalityVS_URL
* ^version = "1.0.0"
* ^title = "Brain Imaging Modality ValueSet"
* ^description = "Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures."
* ^status = #active
* include SCT#396205005 "Computed tomography of brain without radiopaque contrast (procedure)"
* include SCT#419949007 "Computed tomography angiography of intracranial artery with contrast (procedure)"
* include SCT#433111008 "Computed tomography of brain perfusion (procedure)"
* include SCT#429807000 "Magnetic resonance imaging of brain with fluid attenuated inversion recovery sequence (procedure)"
* include SCT#440408002 "Diffusion weighted magnetic resonance imaging (procedure)"
* include SCT#419059006 "Magnetic resonance imaging cerebral perfusion study (procedure)"
* include SCT#418994000 "Magnetic resonance angiography of intracranial structure (procedure)"

// --- ValueSet: Thrombectomy Complications ---
ValueSet: ThrombectomyComplicationVS
Id: thrombectomy-complication-vs
* ^url = ThrombectomyComplicationVS_URL
* ^version = "1.0.0"
* ^title = "Thrombectomy Complication ValueSet"
* ^description = "Defines the specific complications of thrombectomy to record."
* ^status = #active
* include SCT#307312008 "Perforation of artery (disorder)"

// --- CodeSystem: Stroke Procedure Not Done Reasons --- *** FIXED DEFINITION ***
CodeSystem: StrokeProcNotDoneReasonCS
Id: stroke-proc-not-done-reason-cs
* ^url = StrokeProcNotDoneReasonCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Procedure Not Done Reason Code System"
* ^description = "Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy)."
* ^status = #active
* #time-window "Outside Therapeutic Window" "Patient presented or evaluated outside the established time limit for the procedure."
* #no-lvo "No Large Vessel Occlusion (LVO)" "An eligible large vessel occlusion for thrombectomy was not identified."
* #contraindication "Contraindication Present" "A medical contraindication to the procedure existed (e.g., bleeding risk)."
* #patient-refusal "Patient/Family Refusal" "The patient or their legal representative refused the procedure."
* #transfer "Transferred to Another Facility" "The patient was transferred to another hospital for the procedure."
* #unavailable "Procedure Unavailable" "The procedure was not available at the facility (e.g., lack of equipment, staff)."
* #disability "Severe Preexisting Disability" "Patient's baseline disability made benefit from the procedure unlikely."
* #mild-stroke "Mild Stroke / Rapid Improvement" "Stroke symptoms were too mild or improved rapidly, not justifying the procedure risk."
* #done-elsewhere "Performed Elsewhere" "The procedure had already been performed at another facility prior to arrival/transfer."
* #cost "Cost / No Insurance" "Financial or coverage reasons prevented the procedure."
* #unknown "Reason Unknown" "The reason was not documented or is unknown."

// --- ValueSet: Stroke Procedure Not Done Reasons ---
ValueSet: StrokeProcNotDoneReasonVS
Id: stroke-proc-not-done-reason-vs
* ^url = StrokeProcNotDoneReasonVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Procedure Not Done Reason ValueSet"
* ^description = "ValueSet containing specific codes to indicate why thrombolysis or thrombectomy was not performed."
* ^status = #active
* include codes from system StrokeProcNotDoneReasonCS_URL // Includes codes from the specific CS


// --- CodeSystem: Swallowing Screening Timing Category ---
CodeSystem: SwallowScreenTimeCS
Id: swallow-screen-time-cs
* ^url = SwallowScreenTimeCS_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category Code System"
* ^description = "Temporal categories relative to stroke onset for swallowing screening."
* ^status = #active
* #T4H "Within 4 hours" "Screening performed within 4 hours of symptom onset."
* #T24H "Within 24 hours" "Screening performed within 24 hours of symptom onset (but after 4h)."
* #A24H "After 24 hours" "Screening performed after 24 hours of symptom onset."
* #UNK "Unknown time" "Screening performed but timing relative to symptom onset unknown."

// --- ValueSet: Swallowing Screening Timing Category ---
ValueSet: SwallowingScreeningTimingCategoryVS
Id: swallowing-screening-timing-category-vs
* ^url = SwallowingScreeningTimingCategoryVS_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category ValueSet"
* ^description = "Temporal categories relative to stroke onset for swallowing screening."
* ^status = #active
* include codes from system SwallowScreenTimeCS_URL

// --- CodeSystem: Procedure Timing Context ---
CodeSystem: ProcedureTimingContextCS
Id: procedure-timing-context-cs
* ^url = ProcedureTimingContextCS_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context Code System"
* ^description = "Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute)."
* ^status = #active
* #acute "Acute Phase (<24h)" "Procedure performed within 24 hours of encounter start time."
* #post-acute "Post-Acute Phase (>=24h)" "Procedure performed 24 hours or more after encounter start time."
* #unknown "Unknown/Not Applicable" "Timing relative to encounter start is unknown or not applicable."

// --- ValueSet: Procedure Timing Context ---
ValueSet: ProcedureTimingContextVS
Id: procedure-timing-context-vs
* ^url = ProcedureTimingContextVS_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context ValueSet"
* ^description = "ValueSet for codes defining the timing phase of a procedure relative to the encounter start."
* ^status = #active
* include codes from system ProcedureTimingContextCS_URL

// --- ValueSet: Procedures (General) ---
ValueSet: SwallowProceduresVS
Id: swallowProceduresValueset
* ^url = SwallowProceduresVS_URL
* ^name = "SwallowProceduresValueset"
* ^version = "1.0.0"
* ^title = "Swallow Procedures ValueSet"
* ^description = "ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients."
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#1290000005 "Assessment using Gugging Swallowing Screen (procedure)"
* include SCT#304909008 "Swallowing function test (procedure)"

// ------------------------- Extensions (R5 Compatible) ---------------------------
Extension: SwallowingScreeningTimingCategoryExt
Id: swallowing-screening-timing-category-ext
* ^url = SwallowScreenTimeExt_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category"
* ^description = "Temporal category relative to stroke onset in which the swallowing screening was performed."
* ^context[0].type = #element
* ^context[0].expression = "Procedure"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from SwallowingScreeningTimingCategoryVS_URL (required) // Use Alias

Extension: ProcedureTimingContextExtension
Id: procedure-timing-context-ext
* ^url = ProcTimingContextExt_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context Extension"
* ^description = "Specifies the timing phase (e.g., acute, post-acute) in which the procedure was performed relative to the start of the encounter."
* ^context[0].type = #element
* ^context[0].expression = "Procedure"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from ProcedureTimingContextVS_URL (required) // Use Alias

// ------------------ Profile: StrokeProcedureProfile (FHIR R5) ----------------

Profile: StrokeBrainImagingProcedureProfile
Id: stroke-brain-imaging-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://example.org/StructureDefinition/stroke-brain-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeBrainImagingProcedureProfile"
* ^title = "Stroke Brain Imaging Procedure Profile (R5)" // Indicate R5
* ^description = "Enhanced FHIR R5 Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
* ^status = #active
* code from BrainImagingModalityVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* occurrence[x] 0..1 MS
* occurrence[x] only Period
* occurrence[x].start 0..1 MS
* occurrence[x].end 0..1 MS
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS

Profile: StrokeCarotidImagingProcedureProfile
Id: stroke-carotid-imaging-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://example.org/StructureDefinition/stroke-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeCarotidImagingProcedureProfile"
* ^title = "Stroke Carotid Imaging Procedure Profile (R5)" // Indicate R5
* ^description = "Enhanced FHIR R5 Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
* ^status = #active
* code from CarotidImagingModalityVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS


Profile: StrokePerforationProcedureProfile
Id: stroke-perforation-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://example.org/StructureDefinition/stroke-perforation-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokePerforationProcedureProfile"
* ^title = "Stroke Perforation Procedure Profile (R5)" // Indicate R5
* ^description = "Enhanced FHIR R5 Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
* ^status = #active
* code from PerforationProceduresVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* occurrence[x] 1..1 MS
* occurrence[x] only Period
* complication 0..* MS
* complication only CodeableReference(FHIR_Condition)
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS

Profile: StrokeSwallowProcedureProfile
Id: stroke-swallow-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://example.org/StructureDefinition/stroke-swallow-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeSwallowProcedureProfile"
* ^title = "Stroke Swallow Procedure Profile (R5)" // Indicate R5
* ^description = "Enhanced FHIR R5 Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
* ^status = #active
* code from SwallowProceduresVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
// --- Applicable Extensions ---
* extension contains SwallowingScreeningTimingCategoryExt named screeningTimingCategory 0..1 MS and
    ProcedureTimingContextExtension named timingContext 0..1 MS

// --- Invariants (R5 Paths Updated) ---
Invariant: reason-required-if-not-done
Description: "A reason (statusReason) must be provided if the procedure status is 'not-done'."
Severity: #error
Expression: "status = 'not-done' implies statusReason.exists()"

Invariant: brain-imaging-timestamp-required
Description: "A timestamp (performed[x]) must be recorded if a brain imaging procedure was performed in this facility."
Severity: #error
Expression: "code.memberOf(%BrainImagingModalityVS_URL%) and status = 'completed' and (extension(%ProcPerfElsewhereExt_URL%).exists().not() or extension(%ProcPerfElsewhereExt_URL%).value = false) implies performed.exists()" // Alias syntax updated

Invariant: mt-not-done-reason-binding
Description: "If a thrombectomy was not performed (status='not-done'), statusReason must use codes from the StrokeProcNotDoneReasonVS ValueSet."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'not-done' implies statusReason.memberOf(%StrokeProcNotDoneReasonVS_URL%)" // Alias syntax updated

Invariant: ivt-not-done-reason-binding
Description: "If an IV thrombolysis was not performed (status='not-done'), statusReason must use codes from the StrokeProcNotDoneReasonVS ValueSet."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '472191000119101').exists() and status = 'not-done' implies statusReason.memberOf(%StrokeProcNotDoneReasonVS_URL%)" // Alias syntax updated

Invariant: mt-complication-only-if-completed
Description: "Complications (the 'complication' field) only apply to completed thrombectomies."
Severity: #error
// R5 path check: complication is the backbone, complication.code is the CC
Expression: "complication.exists() implies (code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'completed')" // Check complication backbone existence

Invariant: screening-tool-required // *** UPDATED for R5 path used.concept ***
Description: "The tool used (used.concept) must be specified if swallowing screening was completed."
Severity: #warning
Expression: "(code.memberOf(%SwallowingScreeningToolVS_URL%)) and status = 'completed' implies used.concept.exists() and used.concept.memberOf(%SwallowingScreeningToolVS_URL%)" // Use used.concept path and Alias

Invariant: screening-timing-required
Description: "The timing category (extension) must be specified if swallowing screening was completed."
Severity: #error
Expression: "(code.memberOf(%SwallowingScreeningToolVS_URL%)) and status = 'completed' implies extension(%SwallowScreenTimeExt_URL%).exists()" // Alias syntax updated
