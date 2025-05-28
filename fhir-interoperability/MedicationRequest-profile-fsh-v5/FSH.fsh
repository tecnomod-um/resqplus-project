// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: FHIR_MedicationRequest = http://hl7.org/fhir/StructureDefinition/MedicationRequest
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_Practitioner = http://hl7.org/fhir/StructureDefinition/Practitioner
Alias: FHIR_PractitionerRole = http://hl7.org/fhir/StructureDefinition/PractitionerRole
Alias: FHIR_Organization = http://hl7.org/fhir/StructureDefinition/Organization
Alias: FHIR_Device = http://hl7.org/fhir/StructureDefinition/Device
Alias: FHIR_CodeableConcept = http://hl7.org/fhir/StructureDefinition/CodeableConcept
Alias: MedReqAdminLocCS = http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location // *** NEW ALIAS ***
// --- Primero, alias para el VS de 'absent or unknown' ---
Alias: AbsentOrUnknownVS = https://hl7.org/fhir/uv/ips/ValueSet-absent-or-unknown-medications-uv-ips.html

// URLs for Medication ValueSets
Alias: MedicationVS_URL = http://example.org/ValueSet/medication-vs

// --- Medication ValueSets ---
// ...(Keep definitions for AnticoagulantMedicationVS, AntiplateletMedicationVS, etc. as before)...

ValueSet: MedicationVS
Id: medication-vs
* ^url = MedicationVS_URL
* ^version = "1.0.0"
* ^name = "MedicationVS"
* ^title = "Medications ValueSet"
* ^description = "SNOMED CT codes for drug products or substances."
* ^status = #draft
* include SCT#372720008 "Product containing warfarin (medicinal product)"
* include SCT#108977009 "Heparin preparations (product)"
* include SCT#429421000 "Product containing dabigatran (medicinal product)"
* include SCT#429532005 "Product containing rivaroxaban (medicinal product)"
* include SCT#444216007 "Product containing apixaban (medicinal product)"
* include SCT#703873003 "Product containing edoxaban (medicinal product)"
* include SCT#767432000 "Anticoagulant drug (product)"
* include SCT#387458008 "Product containing acetylsalicylic acid (medicinal product form)"
* include SCT#372748007 "Product containing clopidogrel (medicinal product)"
* include SCT#417859008 "Product containing ticagrelor (medicinal product)"
* include SCT#412198007 "Product containing prasugrel (medicinal product)"
* include SCT#372761000 "Product containing dipyridamole (medicinal product)"
* include SCT#373208002 "Platelet aggregation inhibitor (product)"
* include SCT#372749004 "Product containing enoxaparin (medicinal product)"

// ------------------ ValueSet Combinado ------------------

// 2) Tu ValueSet combinado
ValueSet: DischargeMedicationVS
Id: discharge-medication-vs
* ^url = "http://example.org/ValueSet/discharge-medication-vs"
* ^version = "1.0.0"
* ^name = "DischargeMedicationVS"
* ^title = "Discharge Medications ValueSet"
* ^status = #draft
*   include codes from valueset MedicationVS
*   include codes from valueset AbsentOrUnknownVS
// ------------------ Profile: Discharge Medication Request (Updated) -----------------------

Profile: DischargeMedicationRequestProfile
Id: discharge-medication-request-profile
Parent: FHIR_MedicationRequest
* ^url = "http://example.org/StructureDefinition/discharge-medication-request-profile"
* ^version = "1.0.0"
* ^name = "DischargeMedicationRequestProfile"
* ^title = "Discharge Medication Request Profile"
* ^status = #active
* ^description = "Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration." // Updated description

// --- Fixed Values and Core Constraints ---
* status = #active
* status MS


* category = MedReqAdminLocCS#community "Community" // *** FIXED: Assign 'community' code ***
* category 1..1 MS // *** Ensure it's mandatory and MS ***

* medication 1..1 MS
* medication from DischargeMedicationVS (required)
* subject 1..1 MS
* subject only Reference(FHIR_Patient)

* encounter 1..1 MS
* encounter only Reference(FHIR_Encounter) // Refine to StrokeEncounterProfile if defined

* authoredOn 1..1 MS