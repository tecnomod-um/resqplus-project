// ------------------------- Aliases ----------------------------------
// FHIR R5 Resource Aliases
Alias: FHIR_Provenance = http://hl7.org/fhir/StructureDefinition/Provenance
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient // Needed for context if not directly targeted
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter // Target resource
Alias: FHIR_Organization = http://hl7.org/fhir/StructureDefinition/Organization // Likely agent.who target
Alias: FHIR_Practitioner = http://hl7.org/fhir/StructureDefinition/Practitioner // Possible agent.who target
Alias: FHIR_Device = http://hl7.org/fhir/StructureDefinition/Device // Possible agent.who target

// ------------------------- Provenance Profile (FHIR R5) ---------------

Profile: EncounterProviderProvenanceProfile
Id: encounter-provider-provenance // Example ID
Parent: FHIR_Provenance // R5 Provenance Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://example.org/StructureDefinition/encounter-provider-provenance" // Example URL
* ^version = "1.0.0"
* ^name = "EncounterProviderProvenanceProfile"
* ^title = "Encounter Provider Provenance Profile (R5)"
* ^description = "R5 Profile for Provenance resource linking the healthcare provider organization (agent) to the specific Encounter resource (target)."
* ^status = #active

// --- Core Provenance Elements ---
* target 1..* MS // Must target at least one resource, Must Support
* target only Reference(FHIR_Encounter) // **Constrain target to be the Encounter**

* agent 1..* MS // Must have at least one agent (the provider), Must Support
* agent ^slicing.discriminator.type = #profile
* agent ^slicing.discriminator.path = "type" // Example discriminator if multiple agent types needed
* agent ^slicing.discriminator.type = #pattern // Slice based on who.resolve().resourceType? Or type? Let's use type for now.
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open

// --- Agent Slice for the Healthcare Provider (Organization) ---
* agent contains ProviderOrg 1..1 MS // Ensure one agent represents the provider org

* agent[ProviderOrg].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author // Assuming the org is the author/recorder of the encounter data
* agent[ProviderOrg].who 1..1 MS // The reference to the provider Org MUST be present
* agent[ProviderOrg].who only Reference(FHIR_Organization) // **Constrain 'who' to Organization**
* agent[ProviderOrg].who.display 0..1 MS // **Map provider.name_english here**

// Note on provider.id:
// The identifier (provider.id) belongs to the referenced Organization resource.
// This profile ensures the reference *exists* and is *likely* an Organization.
// Enforcement that the referenced Organization *has* an identifier must be done
// on the Organization resource profile itself or via implementation guidance.
// We mark 'who' as MS, implying the implementer must handle the reference.