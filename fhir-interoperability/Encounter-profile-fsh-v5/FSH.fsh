// ------------------------- Aliases ----------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_Extension = http://hl7.org/fhir/StructureDefinition/Extension
Alias: FHIR_Location = http://hl7.org/fhir/StructureDefinition/Location

// URLs for Custom CodeSystems (Defined Below)
Alias: StrokeArrivalModeCS_URL = http://example.org/fhir/CodeSystem/stroke-arrival-mode-cs
Alias: DischargeDeptCS_URL = http://example.org/fhir/CodeSystem/discharge-dept-cs
Alias: InitialCareIntensityCS_URL = http://example.org/fhir/CodeSystem/initial-care-intensity-cs

// URLs for Custom ValueSets (Defined Below - used in bindings)
Alias: StrokeArrivalModeVS_URL = http://example.org/fhir/ValueSet/stroke-arrival-mode-vs
Alias: DischargeDestinationVS_URL = http://example.org/fhir/ValueSet/discharge-destination-vs
Alias: DischargeDeptVS_URL = http://example.org/fhir/ValueSet/discharge-dept-vs
Alias: InitialCareIntensityVS_URL = http://example.org/fhir/ValueSet/initial-care-intensity-vs

// URLs for Custom Extensions (Defined Below)
Alias: FirstHospitalExt_URL = http://example.org/fhir/StructureDefinition/first-hospital-ext
Alias: InitialCareIntensityExt_URL = http://example.org/fhir/StructureDefinition/initial-care-intensity-ext
Alias: RequiredPostAcuteCareExt_URL = http://example.org/fhir/StructureDefinition/required-post-acute-care-ext
Alias: DischargeDepartmentServiceExt_URL = http://example.org/fhir/StructureDefinition/discharge-department-service-ext

// ------------------------- Custom CodeSystems & ValueSets -------------

// --- Arrival Mode ---
ValueSet: StrokeArrivalModeVS
Id: stroke-arrival-mode-vs
* ^url = StrokeArrivalModeVS_URL
* ^title = "Stroke Arrival Mode ValueSet"
* ^description = "ValueSet specifying the mode and origin of the patient's arrival."
* ^status = #active
* include SCT#715537001 "Transportation by ambulance (procedure)"
* include SCT#715957006 "Transportation by own transport (procedure)"
* include SCT#384762007 "Transportation procedure (procedure)"

// --- Discharge Destination ---
ValueSet: DischargeDestinationVS
Id: discharge-destination-vs
* ^url = DischargeDestinationVS_URL
* ^title = "Stroke Discharge Destination ValueSet"
* ^description = "Defines the possible destinations of the patient upon discharge from the encounter."
* ^status = #active
* include SCT#306689006 "Discharge to home (procedure)"
* include SCT#1066351000000100 "Discharge to hospital at home service (procedure)"
* include SCT#306706006 "Discharge to ward (procedure)"
* include SCT#19712007 "Patient transfer, to another health care facility (procedure)"
* include SCT#306691003 "Discharge to residential home (procedure)"
* include SCT#305398007 "Admission to the mortuary (procedure)"

// --- Discharge Department/Service ---
ValueSet: DischargeDeptVS
Id: discharge-dept-vs
* ^url = DischargeDeptVS_URL
* ^title = "Discharge Department/Service ValueSet"
* ^description = "ValueSet specifying the type of department or service the patient was discharged or transferred to."
* ^status = #active
* include SCT#309940004 "Rehabilitation department (environment)"
* include SCT#309937004 "Neurology department (environment)"
* include SCT#441480003 "Primary care department (environment)"
* include SCT#309912009 "Medical department (environment)"

// --- Initial Care Intensity ---
CodeSystem: InitialCareIntensityCS
Id: initial-care-intensity-cs
* ^url = InitialCareIntensityCS_URL
* ^title = "Initial Care Intensity Code System"
* ^description = "Codes indicating the level of care provided during the patient's initial day(s) in the hospital."
* ^status = #active
* #standard "Standard Bed" "Patient placed in a standard hospital bed without continuous monitoring."
* #monitored "Monitored Bed" "Patient placed in a bed with continuous telemetry or other monitoring (outside ICU)."
* #icu-stroke "ICU / Stroke Unit" "Patient placed in an Intensive Care Unit or specialized Stroke Unit."

ValueSet: InitialCareIntensityVS
Id: initial-care-intensity-vs
* ^url = InitialCareIntensityVS_URL
* ^title = "Initial Care Intensity ValueSet"
* ^description = "ValueSet indicating the level of care provided initially."
* ^status = #active
* include codes from system InitialCareIntensityCS_URL

// ------------------------- Extensions -------------------------------

Extension: FirstHospitalExtension
Id: first-hospital-ext
* ^url = FirstHospitalExt_URL
* ^title = "First Hospital Extension"
* ^description = "Indicates if the reporting hospital was the first medical facility to admit the patient for this stroke episode."
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only boolean
* value[x] 1..1

Extension: InitialCareIntensityExtension
Id: initial-care-intensity-ext
* ^url = InitialCareIntensityExt_URL
* ^title = "Initial Care Intensity Extension"
* ^description = "Specifies the level of care provided during the patient's initial day(s) in the hospital (e.g., standard bed, monitored, ICU/Stroke Unit)."
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from InitialCareIntensityVS_URL (required)

Extension: RequiredPostAcuteCareExtension
Id: required-post-acute-care-ext
* ^url = RequiredPostAcuteCareExt_URL
* ^title = "Required Post-Acute Care Extension"
* ^description = "Indicates whether the patient required hospitalization beyond 24 hours after the designated acute phase of stroke care for this encounter."
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only boolean
* value[x] 1..1

Extension: DischargeDepartmentServiceExtension
Id: discharge-department-service-ext
* ^url = DischargeDepartmentServiceExt_URL
* ^title = "Discharge Department/Service Extension"
* ^description = "Specifies the type of department or service the patient was discharged or transferred to."
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from DischargeDeptVS_URL (required)

// ------------------------- Encounter Profile -------------------------

Profile: StrokeEncounterProfile
Id: stroke-encounter-profile
Parent: Encounter
* ^title = "Stroke Encounter Profile"
* ^description = "Profile for an Encounter resource representing a patient's hospital admission and stay for a stroke event, including key administrative and workflow details."
* ^status = #active

// Extensions
* extension contains FirstHospitalExtension named isFirstHospital 1..1 MS and
    InitialCareIntensityExtension named initialCareIntensity 1..1 MS and
    RequiredPostAcuteCareExtension named requiredPostAcuteCare 1..1 MS and
    DischargeDepartmentServiceExtension named dischargeDepartmentService 1..1 MS

// Standard Encounter Elements
* status 1..1 MS
* class = #IMP "inpatient encounter"
* class MS
* type MS // Consider defining a ValueSet for specific encounter types e.g., 'Stroke Admission'

// Period (Start/End Dates)
* actualPeriod 1..1 MS
* actualPeriod.start 1..1 MS // hospital timestamp
* actualPeriod.end 0..1 MS // discharge date

// Length of Stay
* length MS

// Hospitalization Details
* admission 1..1 MS
* admission.admitSource 0..1 MS // arrival mode
* admission.admitSource from StrokeArrivalModeVS_URL (required)
* admission.dischargeDisposition 0..1 MS // discharge destination
* admission.dischargeDisposition from DischargeDestinationVS_URL (required)
