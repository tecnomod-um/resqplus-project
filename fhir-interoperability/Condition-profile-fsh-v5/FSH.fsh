// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: CondCat = http://terminology.hl7.org/CodeSystem/condition-category
Alias: CondVerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: BleedingReasonCS = https://example.org/fhir/CodeSystem/stroke-bleeding-reason
Alias: IschemicEtiologyCS = https://example.org/fhir/CodeSystem/stroke-ischemic-etiology

// ValueSet para Tipos/Diagnósticos de Ictus (con Displays)
ValueSet: StrokeDiagnosisVS
Id: stroke-diagnosis-vs
Title: "Stroke Diagnosis ValueSet"
Description: "Define los códigos SNOMED CT para los diagnósticos finales de ictus, incluyendo tipos y etiologías específicas cuando aplique."
* ^status = #active
* include SCT#422504002 "Ischemic stroke (disorder)"
* include SCT#274100004 "Cerebral hemorrhage (disorder)"
* include SCT#266257000 "Transient ischemic attack (disorder)"
* include SCT#21454007 "Subarachnoid intracranial hemorrhage (disorder)"
* include SCT#95455008 "Thrombosis of cerebral veins (disorder)"

// ValueSet para Factores de Riesgo de Ictus (con Displays)
ValueSet: StrokeRiskFactorVS
Id: stroke-risk-factor-vs
Title: "Stroke Risk Factor ValueSet"
Description: "Define los códigos SNOMED CT para condiciones o factores de riesgo relevantes para ictus."
* ^status = #active
* include SCT#49436004 "Atrial fibrillation (disorder)"
* include SCT#5370000 "Atrial flutter (disorder)"
* include SCT#22298006 "Myocardial infarction (disorder)"
* include SCT#53741008 "Coronary arteriosclerosis (disorder)"
* include SCT#73211009 "Diabetes mellitus (disorder)"
* include SCT#55822004 "Hyperlipidemia (disorder)"
* include SCT#38341003 "Hypertensive disorder, systemic arterial (disorder)"
* include SCT#230706003 "Hemorrhagic cerebral infarction (disorder)" // Hemorragia previa
* include SCT#266257000 "Transient ischemic attack (disorder)" // TIA previo
* include SCT#422504002 "Ischemic stroke (disorder)" // Ictus isquémico previo
* include SCT#230690007 "Cerebrovascular accident (disorder)" // Ictus general previo

// ValueSet para Destino del Alta (Nuevo)
ValueSet: DischargeDestinationVS // Nombre FSH descriptivo
Id: DischargeDestinationValueset // ID del JSON
Title: "Discharge Destination Valueset"
Description: "Define los posibles destinos del paciente al alta." // Descripción añadida
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

// ValueSet para Origen de la Admisión (Nuevo)
ValueSet: AdmissionSourceVS // Nombre FSH descriptivo
Id: admissionSourceValueset // ID del JSON
Title: "Admission Sources ValueSet"
Description: "Define los modos de transporte o vías por las que llegó el paciente." // Descripción añadida
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
* include SCT#715957006 "Transportation by own transport (procedure)" // Nota: El código 396205005 es CT cerebral en mis VS anteriores, ¿seguro que es este código para transporte propio? Usaré el que proporcionaste. ¡Verificar! - Corregido por Cati, estaba mal
* include SCT#384762007 "Transportation procedure (procedure)"

ValueSet: HemorrhagicStrokeBleedingReasonVS
Id: Hemorrhagic-stroke-bleeding-reason-vs
Title: "Hemorrhagic Stroke Bleeding Reason ValueSet"
* ^description = "Specifies the identified cause of a hemorrhagic stroke, typically used with an extension."
* ^url = "http://example.org/fhir/ValueSet/HemorrhagicStrokeBleedingReasonVS"
* ^version = "1.0.0"
* ^name = "Hemorrhagic-stroke-bleeding-reason-vs"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* ^status = #draft
* include SCT#128609009 "Intracranial aneurysm (disorder)"
* include SCT#703221003 "Congenital intracranial vascular malformation (disorder)"
* include SCT#64572001 "Disease (disorder)"
* include SCT#71388002 "Procedure (procedure)"

ValueSet: IschemicStrokeEtiologyVS
Id: Ischemic-stroke-etiology-vs
Title: "Ischemic Stroke Etiology ValueSet"
Description: "Specifies the determined etiology of an ischemic stroke" // Descripción añadida
* ^url = "http://example.org/fhir/ValueSet/IschemicStrokeEtiologyVS"
* ^version = "1.0.0"
* ^name = "Ischemic-stroke-etiology-vs"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* ^status = #draft
* include SCT#724425005 "Cerebral ischemic stroke due to intracranial large artery atherosclerosis (disorder)"
* include SCT#724426006 "Cerebral ischemic stroke due to extracranial large artery atherosclerosis (disorder)"
* include SCT#1251566005 "Embolism from heart (disorder)"
* include SCT#404684003 "Clinical finding (finding)"
* include SCT#16891111000119104 "Cryptogenic stroke (disorder)"
* include SCT#230698000 "Lacunar infarction (disorder)"
* include SCT#443929000 "Small vessel cerebrovascular disease (disorder)"


// ------------------ Extensions ---------------------------------
// (Sin cambios respecto a la versión anterior)
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

// ------------------ Perfiles de Condition -----------------------

// --- 1. Perfil para el Diagnóstico Principal del Ictus ---
Profile: StrokeDiagnosisConditionProfile
Id: stroke-diagnosis-condition-profile
Parent: Condition
Title: "Stroke Diagnosis Condition Profile"
Description: "Representa el diagnóstico final del evento de ictus actual..."
* ^status = #active

* clinicalStatus MS
* verificationStatus MS
* verificationStatus = CondVerStatus#confirmed

* category MS
* category = CondCat#encounter-diagnosis "Encounter Diagnosis"

* code 1..1 MS
* code from StrokeDiagnosisVS (required)

* subject 1..1 // Cardinalidad
* subject only Reference(Patient) // Tipo
* subject MS // Flag

* encounter 1..1 // Cardinalidad
* encounter only Reference(Encounter) // Tipo
* encounter MS // Flag

* onset[x] 1..1 // Cardinalidad
* onset[x] only dateTime // Tipo
* onset[x] MS // Flag

* extension contains HemorrhagicStrokeBleedingReasonExt named bleedingReason 0..1 MS
* extension contains IschemicStrokeEtiologyExt named ischemicEtiology 0..1 MS

// --- 2. Perfil para Factores de Riesgo de Ictus ---
Profile: StrokeRiskFactorConditionProfile
Id: stroke-risk-factor-condition-profile
Parent: Condition
Title: "Stroke Risk Factor Condition Profile"
Description: "Representa una condición o factor de riesgo conocido relevante para ictus."
* ^status = #active

* clinicalStatus MS
* verificationStatus MS
* verificationStatus = CondVerStatus#confirmed

* category MS
* category = CondCat#problem-list-item "Problem List Item"

* code 1..1 MS
* code from StrokeRiskFactorVS (required)

* subject 1..1 // Cardinalidad
* subject only Reference(Patient) // Tipo
* subject MS // Flag

* onset[x] MS
* recordedDate MS

* encounter only Reference(Encounter) // Tipo (Cardinalidad es 0..1 por defecto)
* encounter MS // Flag
