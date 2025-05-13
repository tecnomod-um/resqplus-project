// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: UCUM = http://unitsofmeasure.org
// Alias R5 Adherence CodeSystem/ValueSet
Alias: MedStatementAdherenceVS_R5 = http://hl7.org/fhir/ValueSet/medication-statement-adherence|5.0.0
Alias: MedStatementMedsVS_R5 = http://example.org/fhir/ValueSet/medicationStatement-meds-code|5.0.0
// FHIR R5 Resource Aliases
Alias: MedicationStatement = http://hl7.org/fhir/StructureDefinition/MedicationStatement
Alias: Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: Practitioner = http://hl7.org/fhir/StructureDefinition/Practitioner
Alias: PractitionerRole = http://hl7.org/fhir/StructureDefinition/PractitionerRole
Alias: RelatedPerson = http://hl7.org/fhir/StructureDefinition/RelatedPerson
Alias: Organization = http://hl7.org/fhir/StructureDefinition/Organization
Alias: Condition = http://hl7.org/fhir/StructureDefinition/Condition

ValueSet: MedicationStatementMedsCodesVS
Id: medicationStatement-meds-codes
* ^url = "http://example.org/fhir/ValueSet/medicationStatement-meds-codes"
* ^name = "MedicationStatementMedsCodes" // FIXED: Use CamelCase Name
* ^title = "MedicationStatement Therapy/Finding Codes"
* ^description = "ValueSet containing SNOMED CT codes representing various medication-related procedures and findings (e.g., therapies, administration procedures, findings about use). **NOTE: These codes are generally NOT suitable for MedicationStatement.medication[x] which expects product/substance codes.**"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#413081008 "Administration of prophylactic clopidogrel (procedure)"
* include SCT#308116003 "Antihypertensive therapy (procedure)"
* include SCT#722045009 "Warfarin therapy (procedure)"
* include SCT#1335906002 "Rivaroxaban therapy (procedure)"
* include SCT#1335908001 "Apixaban therapy (procedure)"
* include SCT#1338036007 "Edoxaban therapy (procedure)"
* include SCT#182764009 "Anticoagulant therapy (procedure)"
* include SCT#315053001 "Administration of prophylactic statin (procedure)"
* include SCT#443464003 "Low molecular weight heparin therapy (procedure)"
* include SCT#735127005 "Dipyridamole therapy (procedure)"
* include SCT#1237404009 "Uses hormone method of contraception (finding)"
* include SCT#416608005 "Drug therapy (procedure)"

// ------------------ Perfil Unificado: Declaración de Medicación Previa (FHIR R5) ---
Profile: PriorMedicationStatementProfile
Id: prior-medication-statement-profile
Parent: MedicationStatement // Base R5 MedicationStatement
* ^fhirVersion = #5.0.0 // Explicitly state R5 base
* ^url = "http://example.org/StructureDefinition/prior-medication-statement-profile"
* ^version = "1.0.0"
* ^name = "PriorMedicationStatementProfile"
* ^title = "Prior Medication Statement Profile (R5)" // Indicate R5
* ^status = #active
* ^description = "R5 Profile: Represents a statement about the patient's medication use *before* the index event. Uses adherence.code (#taking/#not-taking) to indicate usage status." // Updated Desc for R5

// Key fields for prior medication reporting
* medication 1..1 MS
* medication from MedStatementMedsVS_R5 (required)
* subject 1..1 MS
* subject only Reference(Patient)
* reason 0..* MS 
* reason only CodeableReference(Condition or Observation or DiagnosticReport) // Allowed targets for reason in R5

// Adherence field to represent Taking / Not Taking in R5
* adherence 0..1 MS // Make the adherence block optional but supported
* adherence.code 1..1 MS // If adherence block is present, code is mandatory
* adherence.code from MedStatementAdherenceVS_R5 (required) // Bind to the R5 standard VS