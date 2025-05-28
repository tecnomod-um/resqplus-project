// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: CondCat = http://terminology.hl7.org/CodeSystem/condition-category
Alias: CondVerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: BleedingReasonCS = https://example.org/fhir/CodeSystem/stroke-bleeding-reason
Alias: IschemicEtiologyCS = https://example.org/fhir/CodeSystem/stroke-ischemic-etiology
Alias: StrokeRiskUnknVS = http://hl7.org/fhir/uv/ips/ValueSet/absent-or-unknown-problems-uv-ips

// ValueSet for Stroke Diagnosis (with Displays)
ValueSet: StrokeDiagnosisVS
Id: stroke-diagnosis-vs
Title: "Stroke Diagnosis ValueSet"
Description: "Defines the SNOMED CT codes for final stroke diagnoses, including specific types and etiologies where applicable."
* ^status = #active
* include SCT#422504002 "Ischemic stroke (disorder)"
* include SCT#274100004 "Cerebral hemorrhage (disorder)"
* include SCT#266257000 "Transient ischemic attack (disorder)"
* include SCT#21454007 "Subarachnoid intracranial hemorrhage (disorder)"
* include SCT#95455008 "Thrombosis of cerebral veins (disorder)"

// ValueSet for Stroke Risk Factors (with Displays)
ValueSet: StrokeRiskFactorSNOMEDVS
Id: stroke-risk-factor-snomed-vs
Title: "Stroke Risk Factor ValueSet"
Description: "Defines the SNOMED CT codes for conditions or risk factors relevant to stroke."
* ^status = #active
* include SCT#49436004 "Atrial fibrillation (disorder)"
* include SCT#5370000 "Atrial flutter (disorder)"
* include SCT#22298006 "Myocardial infarction (disorder)"
* include SCT#53741008 "Coronary arteriosclerosis (disorder)"
* include SCT#73211009 "Diabetes mellitus (disorder)"
* include SCT#55822004 "Hyperlipidemia (disorder)"
* include SCT#38341003 "Hypertensive disorder, systemic arterial (disorder)"
* include SCT#230706003 "Hemorrhagic cerebral infarction (disorder)" // Prior hemorrhage
* include SCT#266257000 "Transient ischemic attack (disorder)" // Previous TIA
* include SCT#422504002 "Ischemic stroke (disorder)" // Previous ischemic stroke
* include SCT#230690007 "Cerebrovascular accident (disorder)" // General previous stroke

ValueSet: StrokeRiskFactorVS
Id: stroke-risk-factor-vs
Title: "Stroke Risk Factor ValueSet"
Description: "Defines the unknown or absent codes for conditions or risk factors relevant to stroke."
* include codes from valueset StrokeRiskFactorSNOMEDVS
* include codes from valueset StrokeRiskUnknVS

// ValueSet for Discharge Destination (New)
ValueSet: DischargeDestinationVS
Id: DischargeDestinationValueset
Title: "Discharge Destination ValueSet"
Description: "Defines possible patient discharge destinations."
* ^url = "http://example.org/fhir/ValueSet/DischargeDestinationValueset"
* ^version = "1.0.0"
* ^name = "DischargeDestinationValueset"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#1066351000000100 "Discharge to hospital at home service (procedure)"
* include SCT#306706006 "Discharge to ward (procedure)"
* include SCT#19712007 "Patient transfer, to another health care facility (procedure)"
* include SCT#306691003 "Discharge to residential home (procedure)"
* include SCT#305398007 "Admission to the mortuary (procedure)"

// ValueSet for Admission Source (New)
ValueSet: AdmissionSourceVS
Id: admissionSourceValueset
Title: "Admission Sources ValueSet"
Description: "Defines the modes of transport or pathways by which the patient arrived."
* ^url = "http://example.org/fhir/ValueSet/admissionSourceValueset"
* ^version = "1.0.0"
* ^name = "AdmissionSourceValueset"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#715537001 "Transportation by ambulance (procedure)"
* include SCT#715957006 "Transportation by own transport (procedure)" // Note: Verify this code, was corrected per input.
* include SCT#384762007 "Transportation procedure (procedure)"

ValueSet: HemorrhagicStrokeBleedingReasonVS
Id: hemorrhagic-stroke-bleeding-reason-vs
Title: "Hemorrhagic Stroke Bleeding Reason ValueSet"
* ^description = "Specifies the identified cause of a hemorrhagic stroke, typically used with an extension."
* ^url = "http://example.org/fhir/ValueSet/HemorrhagicStrokeBleedingReasonVS"
* ^version = "1.0.0"
* ^name = "hemorrhagic-stroke-bleeding-reason-vs"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#128609009 "Intracranial aneurysm (disorder)"
* include SCT#703221003 "Congenital intracranial vascular malformation (disorder)"
* include SCT#64572001 "Disease (disorder)"
* include SCT#71388002 "Procedure (procedure)"

ValueSet: IschemicStrokeEtiologyVS
Id: ischemic-stroke-etiology-vs
Title: "Ischemic Stroke Etiology ValueSet"
Description: "Specifies the determined etiology of an ischemic stroke."
* ^url = "http://example.org/fhir/ValueSet/IschemicStrokeEtiologyVS"
* ^version = "1.0.0"
* ^name = "ischemic-stroke-etiology-vs"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#724425005 "Cerebral ischemic stroke due to intracranial large artery atherosclerosis (disorder)"
* include SCT#724426006 "Cerebral ischemic stroke due to extracranial large artery atherosclerosis (disorder)"
* include SCT#1251566005 "Embolism from heart (disorder)"
* include SCT#404684003 "Clinical finding (finding)"
* include SCT#16891111000119104 "Cryptogenic stroke (disorder)"
* include SCT#230698000 "Lacunar infarction (disorder)"
* include SCT#443929000 "Small vessel cerebrovascular disease (disorder)"

// ------------------ Extensions ---------------------------------
// (No changes from previous version)
Extension: HemorrhagicStrokeBleedingReasonExt
Id: hemorrhagic-stroke-bleeding-reason-ext
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from HemorrhagicStrokeBleedingReasonVS (required)

Extension: IschemicStrokeEtiologyExt
Id: ischemic-stroke-etiology-ext
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from IschemicStrokeEtiologyVS (required)

// ------------------ Condition Profiles -------------------------

// --- 1. Profile for Primary Stroke Diagnosis ---
Profile: StrokeDiagnosisConditionProfile
Id: stroke-diagnosis-condition-profile
Parent: Condition
Title: "Stroke Diagnosis Condition Profile"
Description: "Represents the final diagnosis of the current stroke event."
* ^status = #active

* clinicalStatus MS
* verificationStatus MS
* verificationStatus = CondVerStatus#confirmed

* category MS
* category = CondCat#encounter-diagnosis "Encounter Diagnosis"

* code 1..1 MS
* code from StrokeDiagnosisVS (required)

* subject 1..1
* subject only Reference(Patient)
* subject MS

* encounter 1..1
* encounter only Reference(Encounter)
* encounter MS

* onset[x] 1..1
* onset[x] only dateTime
* onset[x] MS

* extension contains HemorrhagicStrokeBleedingReasonExt named bleedingReason 0..1 MS
* extension contains IschemicStrokeEtiologyExt named ischemicEtiology 0..1 MS

// --- 2. Profile for Stroke Risk Factor Conditions ---
Profile: StrokeRiskFactorConditionProfile
Id: stroke-risk-factor-condition-profile
Parent: Condition
Title: "Stroke Risk Factor Condition Profile"
Description: "Represents a known condition or risk factor relevant to stroke."
* ^status = #active

* clinicalStatus MS
* verificationStatus MS
* verificationStatus = CondVerStatus#confirmed

* category MS
* category = CondCat#problem-list-item "Problem List Item"

* code 1..1 MS
* code from StrokeRiskFactorVS (required)

* subject 1..1
* subject only Reference(Patient)
* subject MS

* onset[x] MS
* recordedDate MS

* encounter only Reference(Encounter)
* encounter MS