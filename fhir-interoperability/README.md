# HL7 FHIR interoperability

### Encounter

| **RES-Q**                     | **HL7 FHIR**                             |
|-------------------------------|------------------------------------------|
| case_id                       | Encounter.identifier                     |
| arrival_mode                  | Encounter.admission.admitSource          |
| discharge_date                | Encounter.period.end                     |
| discharge_destination         | Encounter.admission.dischargeDisposition |
| discharge_facility_department | Encounter.admission.destination          |
| first_hospital                | Encounter.extension                      |
| hospital_timestamp            | Encounter.period.start                   |
| hospitalized_in               | Encounter.location.form                  |

### Risk factors

| **RES-Q**                                  | **HL7 FHIR**                            |
|--------------------------------------------|-----------------------------------------|
| risk_atrial_fibrillation                   | Condition.code, Condition.clinicalStatus|
| risk_coronary_artery_disease_or_myocardial_infarction | *(idem)*        |
| risk_diabetes                              | *(idem)*                      |
| risk_hyperlipidemia                        |*(idem)*                    |
| risk_hypertension                          | *(idem)*                     |
| risk_previous_hemorrhagic_stroke           | *(idem)*                      |
| risk_previous_ischemic_stroke              | *(idem)*                     |
| risk_previous_stroke                       | *(idem)*                     |

### History Medication

| **RES-Q**                        | **HL7 FHIR**                                                  |
|----------------------------------|---------------------------------------------------------------|
| before_onset_antidiabetics       | MedicationStatement.status, MedicationStatement.medication, MedicationStatement.effective.timing |
| before_onset_antihypertensives   | *(idem)*                                  |
| before_onset_any_anticoagulant   | *(idem)*                                                      |
| before_onset_any_antiplatelet    | *(idem)*                                                      |
| before_onset_asa                 | *(idem)*                                                      |
| before_onset_clopidogrel         | *(idem)*                                                      |
| before_onset_other_anticoagulant | *(idem)*                                                      |
| before_onset_statin              | *(idem)*                                                      |
| before_onset_warfarin            | *(idem)*                                                      |

### Stroke type and etiology

| **RES-Q**                           | **HL7 FHIR**                            |
|-------------------------------------|-----------------------------------------|
| stroke_type                         | Condition.code, Condition.clinicalStatus|
| stroke_etiology_cardioembolism      | Condition.extension                     |
| stroke_etiology_cryptogenic_stroke  | Condition.code, Condition.clinicalStatus|
| stroke_etiology_la_atherosclerosis  | Condition.extension                     |
| stroke_etiology_lacunar             | Condition.extension                     |
| stroke_etiology_other               | Condition.extension                     |
| bleeding_reason_aneurysm            | Condition.extension                     |
| bleeding_reason_malformation        | Condition.extension                     |
| bleeding_reason_other               | Condition.extension                     |
| onset_date                          | Condition.onsetDateTime                 |
| onset_time                          | Condition.onsetDateTime                    |

### Imaging procedure

| **RES-Q**         | **HL7 FHIR**                                                 |
|-------------------|--------------------------------------------------------------|
| imaging_done      | Procedure.location (elsewhere), Procedure.status (done, not done) |
| imaging_timestamp | Procedure.occurrence                                         |
| imaging_type      | Procedure.code                                               |

### Thrombectomy

| **RES-Q**                  | **HL7 FHIR**                                           |
|----------------------------|--------------------------------------------------------|
| thrombectomy               | Procedure.code, Procedure.status (done, not done), Procedure.reason (stroke type) |
| puncture_timestamp         | Procedure.occurrence.startTime                         |
| reperfusion_timestamp      | Procedure.occurrence.endTime                           |
| no_thrombectomy_reason     | Procedure.statusReason                                 |
| mt_complications_perforation | Procedure.complication                               |

### Thrombolysis

| **RES-Q**              | **HL7 FHIR**                                           |
|------------------------|--------------------------------------------------------|
| thrombolysis           | Procedure.code, Procedure.status (done, not done), Procedure.reason (stroke type) |
| bolus_timestamp        | Procedure.occurrence.startTime                         |
| no_thrombolysis_reason | Procedure.statusReason                                 |

### Discharge medication

| **RES-Q**                  | **HL7 FHIR**                                                        |
|----------------------------|---------------------------------------------------------------------|
| discharge_any_anticoagulant| MedicationRequest.medication, MedicationRequest.category (discharge), MedicationRequest.authoredOn (discharge date) |
| discharge_any_antiplatelet | *(idem)*                                       |
| discharge_asa              | *(idem)*                                                           |
| discharge_clopidogrel      | *(idem)*                                                           |
| discharge_heparin          | *(idem)*                                                           |
| discharge_other            | *(idem)*                                                           |
| discharge_warfarin         | *(idem)*                                                           |

### Calculated values as Observations

| **RES-Q**         | **HL7 FHIR**                                                        |
|-------------------|---------------------------------------------------------------------|
| wakeup_stroke     | Observation.code, Observation.value                                |
| inhospital_stroke | *(idem)*                                                           |
| door_to_needle    | Observation.code, Observation.value, Observation.partOf (ThrombolysisProcedure) |
| door_to_groin     | Observation.code, Observation.value, Observation.partOf (ThrombectomyProcedure) |

### Observations at discharge and later

| **RES-Q**            | **HL7 FHIR**                              |
|----------------------|-------------------------------------------|
| discharge_mrs        | Observation.code, Observation.value, Observation.effectiveDateTime |
| discharge_nihss_score| *(idem)*              |
| three_m_mrs          | *(idem)*                       |

### Post acute care procedure

| **RES-Q**                   | **HL7 FHIR**                          |
|-----------------------------|---------------------------------------|
| swallowing_screening_done   | Procedure.status (done, not done)     |
| swallowing_screening_timing | Procedure.occurrence                  |
| swallowing_screening_type   | Procedure.code                        |

### Other Observations at the Encounter

| **RES-Q**                      | **HL7 FHIR**                                                          |
|--------------------------------|-----------------------------------------------------------------------|
| prestroke_mrs                  | Observation.code, Observation.value, Observation.effectivePeriod      |
| systolic_pressure              | Observation.code, Observation.value, Observation.category (exam, lab result), Observation.effectivePeriod |
| mtici_score                    | *(no especificado)*                                                   |
| nihss_score                    | Observation.code, Observation.value, Observation.effectivePeriod      |
| diastolic_pressure             | Observation.code, Observation.value, Observation.category (exam, lab result) |
| age                            | Observation.code, Observation.value                                   |
| atrial_fibrillation_or_flutter| Observation.code, Observation.value, Observation.category (exam, lab result) |
