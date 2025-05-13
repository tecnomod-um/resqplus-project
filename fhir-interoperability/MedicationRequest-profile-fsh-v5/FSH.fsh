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

// URLs for Custom CodeSystems/ValueSets (If still needed for other things)
// Alias: DischargeMedCatCS_URL = http://example.org/CodeSystem/discharge-med-category-cs // REMOVED (or comment out if not used)
// Alias: DischargeMedicationCategoryVS_URL = http://example.org/ValueSet/discharge-medication-category-vs // REMOVED (or comment out if not used)

// URLs for Medication ValueSets
Alias: AnticoagulantMedicationVS_URL = http://example.org/ValueSet/anticoagulant-medication-vs
Alias: AntiplateletMedicationVS_URL = http://example.org/ValueSet/antiplatelet-medication-vs
Alias: AspirinMedicationVS_URL = http://example.org/ValueSet/aspirin-medication-vs
Alias: ClopidogrelMedicationVS_URL = http://example.org/ValueSet/clopidogrel-medication-vs
Alias: HeparinMedicationVS_URL = http://example.org/ValueSet/heparin-medication-vs
Alias: WarfarinMedicationVS_URL = http://example.org/ValueSet/warfarin-medication-vs

// ------------------ CodeSystem for Discharge Category ---------------
// REMOVED (or comment out if not used elsewhere)
// CodeSystem: DischargeMedicationCategoryCS
// Id: discharge-med-category-cs
// * ^url = DischargeMedCatCS_URL
// ... rest of definition ...

// ------------------ ValueSets ----------------------------------
// REMOVED (or comment out if not used elsewhere)
// ValueSet: DischargeMedicationCategoryVS
// Id: discharge-medication-category-vs
// * ^url = DischargeMedicationCategoryVS_URL
// ... rest of definition ...

// --- Medication ValueSets ---
// ...(Keep definitions for AnticoagulantMedicationVS, AntiplateletMedicationVS, etc. as before)...

ValueSet: AnticoagulantMedicationVS
Id: anticoagulant-medication-vs
* ^url = AnticoagulantMedicationVS_URL
* ^version = "1.0.0"
* ^name = "AnticoagulantMedicationVS"
* ^title = "Anticoagulant Medication ValueSet"
* ^description = "SNOMED CT codes for anticoagulant drug products or substances."
* ^status = #draft
* include SCT#372720008 "Product containing warfarin (medicinal product)"
* include SCT#108977009 "Heparin preparations (product)"
* include SCT#429421000 "Product containing dabigatran (medicinal product)"
* include SCT#429532005 "Product containing rivaroxaban (medicinal product)"
* include SCT#444216007 "Product containing apixaban (medicinal product)"
* include SCT#703873003 "Product containing edoxaban (medicinal product)"
* include SCT#767432000 "Anticoagulant drug (product)"

ValueSet: AntiplateletMedicationVS
Id: antiplatelet-medication-vs
* ^url = AntiplateletMedicationVS_URL
* ^version = "1.0.0"
* ^name = "AntiplateletMedicationVS"
* ^title = "Antiplatelet Medication ValueSet"
* ^description = "SNOMED CT codes for antiplatelet drug products or substances."
* ^status = #draft
* include SCT#387458008 "Product containing acetylsalicylic acid (medicinal product form)"
* include SCT#372748007 "Product containing clopidogrel (medicinal product)"
* include SCT#417859008 "Product containing ticagrelor (medicinal product)"
* include SCT#412198007 "Product containing prasugrel (medicinal product)"
* include SCT#372761000 "Product containing dipyridamole (medicinal product)"
* include SCT#373208002 "Platelet aggregation inhibitor (product)"

ValueSet: AspirinMedicationVS
Id: aspirin-medication-vs
* ^url = AspirinMedicationVS_URL
* ^version = "1.0.0"
* ^name = "AspirinMedicationVS"
* ^title = "Aspirin Medication ValueSet"
* ^description = "SNOMED CT codes for Aspirin products."
* ^status = #active
* include SCT#387458008 "Product containing acetylsalicylic acid (medicinal product form)"

ValueSet: ClopidogrelMedicationVS
Id: clopidogrel-medication-vs
* ^url = ClopidogrelMedicationVS_URL
* ^version = "1.0.0"
* ^name = "ClopidogrelMedicationVS"
* ^title = "Clopidogrel Medication ValueSet"
* ^description = "SNOMED CT codes for Clopidogrel products."
* ^status = #active
* include SCT#372748007 "Product containing clopidogrel (medicinal product)"

ValueSet: HeparinMedicationVS
Id: heparin-medication-vs
* ^url = HeparinMedicationVS_URL
* ^version = "1.0.0"
* ^name = "HeparinMedicationVS"
* ^title = "Heparin Medication ValueSet"
* ^description = "SNOMED CT codes for Heparin products (including LMWH)."
* ^status = #draft
* include SCT#108977009 "Heparin preparations (product)"
* include SCT#372749004 "Product containing enoxaparin (medicinal product)"

ValueSet: WarfarinMedicationVS
Id: warfarin-medication-vs
* ^url = WarfarinMedicationVS_URL
* ^version = "1.0.0"
* ^name = "WarfarinMedicationVS"
* ^title = "Warfarin Medication ValueSet"
* ^description = "SNOMED CT codes for Warfarin products."
* ^status = #active
* include SCT#372720008 "Product containing warfarin (medicinal product)"


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

* subject 1..1 MS
* subject only Reference(FHIR_Patient)

* encounter 1..1 MS
* encounter only Reference(FHIR_Encounter) // Refine to StrokeEncounterProfile if defined

* authoredOn 1..1 MS
