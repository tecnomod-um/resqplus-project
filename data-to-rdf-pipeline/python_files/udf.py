import morph_kgc
from rdflib import URIRef


@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_procedure_dateTime",
    procedure = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    temporal_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1"
)

def add_procedure_dateTime(procedure,temporal_context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    procedure = str(procedure).strip()
    temporal_context = str(temporal_context).strip()
    if procedure != 'dateTime' or temporal_context.lower() == 'nan' or temporal_context == '':
        return
    uri = temporal_context.split('#')[-1] if '#' in temporal_context else temporal_context.split('/')[-1]
    return f"{base}{uri}"

@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generate_procedure_dateTime",
    procedure = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    temporal_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1"
)

def generate_procedure_dateTime(procedure,temporal_context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    procedure = str(procedure).strip()
    temporal_context = str(temporal_context).strip()
    if procedure != 'dateTime' or temporal_context.lower() == 'nan' or temporal_context == '':
        return
    uri = temporal_context.split('#')[-1] if '#' in temporal_context else temporal_context.split('/')[-1]
    return f"{base}{uri}"

@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_temporal_context",
    temporal_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")

def add_temporal_context(temporal_context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    temporal_context = str(temporal_context).strip()
    if temporal_context.lower() == 'nan' or temporal_context == '':
        return
    uri = temporal_context.split('#')[-1] if '#' in temporal_context else temporal_context.split('/')[-1]
    return f"{base}{uri}"

@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generate_temporal_context",
    temporal_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")

def generate_temporal_context(temporal_context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    temporal_context = str(temporal_context).strip()
    if temporal_context.lower() == 'nan' or temporal_context == '':
        return
    uri = temporal_context.split('#')[-1] if '#' in temporal_context else temporal_context.split('/')[-1]
    return f"{base}{uri}"

@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generate_procedure_location",
    location = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")

def generate_procedure_location(location):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    location = str(location).strip()
    if location.lower() == 'nan' or location == '':
        return
    uri =location.split('#')[-1] if '#' in location else location.split('/')[-1]
    return f"{base}ProcedureLocation_{uri}"

@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generate_procedure_reason",
    reason = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")

def generate_procedure_reason(reason):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    reason = str(reason).strip()

    if reason.lower() == 'nan' or reason == '':
        return
    uri = reason.split('#')[-1] if '#' in reason else reason.split('/')[-1]
    return f"{base}ProcedureReason_{uri}"


@udf( # type: ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generate_statement_context",
    statement_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")

def generate_statement_context(statement_context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    if statement_context.strip() == 'nan':
        return 
    uri = statement_context.split('#')[-1] if '#' in statement_context else statement_context.split('/')[-1]
    return f"{base}{uri}"
# case ObservationResultStatement and boolean datatype (onset_time_known)
# if field_value is true then known present
# if field_value is false then unknown

@udf(# type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_observable_statement_context",
    value = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
    datatype = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam")



#case ClinicalSituationStatement datatype Boolean 
#field_value true return
#field_value false known absent

@udf(# type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_situation_context",
    field_value = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
    datatype = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam2"
)

def add_situation_context(datatype,field_value,context):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    
    if datatype.strip() == 'Boolean':
        if field_value.strip().upper() in ['FALSE','FALSO']:
            return "http://snomed.info/id/410516002" #known absent
    elif datatype.strip() == 'Categorical' and context != 'nan':
        uri = context.split('#')[-1] if '#' in context else context.split('/')[-1]
        return f"{base}{uri}"
    elif context.strip() == 'nan':
        return #None
    return

@udf(#type:ignore
     fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_procedure_statement_context",
     datatype = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
     field_value = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam2",
     categorical_mapping = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam3",
     statement_context = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam4")

def add_procedure_statement_context(datatype,field_value,categorical_mapping, statement_context):
    if datatype == 'Boolean':
        if field_value.strip().upper() in ('FALSE', 'FALSO'):
                return "http://snomed.info/id/385660001"  # not done
        return "http://snomed.info/id/385658003"  # done
    elif datatype == 'Categorical' and statement_context != 'nan':
        return statement_context.strip()
    elif datatype == 'Categorical':
        context_map = {
            'not required': f"{categorical_mapping}",
            'recommended only': f"{categorical_mapping}",
            'yes': "http://snomed.info/id/385658003",  # done
            'no': "http://snomed.info/id/385660001",  # not done
            'not applicable': "http://snomed.info/id/385432009",  # not applicable
            'not done': "http://snomed.info/id/385660001~iri",  # not done
        }
        return context_map.get(field_value.strip())    
    return

@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_procedure_reason",
    type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    reason = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1"
)
def add_procedure_reason(type,reason):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    if str(type).strip() == 'procedureReason':
        reason = str(reason).strip()
        if reason.lower() == 'nan' or reason == '':
            return
        reason = reason.split('#')[-1] if '#' in reason else reason.split('/')[-1]
        return f"{base}ProcedureReason_{reason}"
    return

@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_procedure_location",
    type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    location = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
)
def add_procedure_location(type,location):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    if str(type).strip() == 'procedureLocation':
        location = str(location).strip()
        if location.lower() == 'nan' or location == '':
            return
        location = location.split('#')[-1] if '#' in location else location.split('/')[-1]
        return f"{base}ProcedureLocation_{location}"
    return

@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/add_procedure_performer",
    type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    performer = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1"
)
def add_procedure_performer(type, performer):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    if type == 'performer':
        performer = performer.split('#')[-1] if '#' in performer else performer.split('/')[-1]
        return f"{base}Performer_{performer}"
    return



@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generateDynamicSubject",
    type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    procedure = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
    field_value = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam2",
    categorical_ontology_mapping = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam3",
    case_id = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam4",
    reason = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam5",
    location = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam6"
)
def generateDynamicSubject(type,procedure,field_value,categorical_ontology_mapping,case_id,reason, location):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    type = str(type).strip()
    procedure = str(procedure).strip()
    field_value = str(field_value).strip()
    categorical_ontology_mapping = str(categorical_ontology_mapping).strip()
    case_id = str(case_id).strip()
    reason = str(reason).strip()
    location = str(location).strip()

    if type == 'Boolean':
        uri = procedure.split('#')[-1] if '#' in procedure else procedure.split('/')[-1]
        return f"{base}{uri}_{case_id}"
    #Categorical
    else:
        if field_value.upper() in ['YES','NO']:
            uri = procedure.split('#')[-1] if '#' in procedure else procedure.split('/')[-1]
            return f"{base}{uri}_{case_id}"
        elif categorical_ontology_mapping.strip() != 'nan':
            uri = categorical_ontology_mapping.split('#')[-1] if '#' in categorical_ontology_mapping else categorical_ontology_mapping.split('/')[-1]
            return f"{base}{uri}_{case_id}"
        else:
            if procedure == 'procedureReason' and reason.strip() != 'nan':
                uri = reason.split('#')[-1] if '#' in reason else reason.split('/')[-1]
                return f"{base}{uri}_{case_id}"
            elif procedure == 'procedurePerformer' and categorical_ontology_mapping.strip() != 'nan':
                uri = categorical_ontology_mapping.split('#')[-1] if '#' in categorical_ontology_mapping else categorical_ontology_mapping.split('/')[-1]
                return f"{base}{uri}_{case_id}"
            elif procedure == 'procedureLocation' and location.strip() != 'nan':
                uri = location.split('#')[-1] if '#' in location else location.split('/')[-1]
                return f"{base}{uri}_{case_id}"
            else:
                return
    return


@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generateDynamicObject",
    type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    procedure = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
    field_value = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam2",
    categorical_ontology_mapping = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam3",
    reason = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam4"
)
def generateDynamicObject(type,procedure,field_value,categorical_ontology_mapping, reason):
    type = str(type).strip()
    procedure = str(procedure).strip()
    field_value = str(field_value).strip()
    categorical_ontology_mapping = str(categorical_ontology_mapping).strip()
    reason = str(reason).strip()

    if type == 'Boolean':
        return f"{procedure}"
    #Categorical
    else:
        if field_value.upper() in ['YES','NO']:
            return f"{procedure}"
        elif categorical_ontology_mapping.strip() != 'nan':
            return f"{categorical_ontology_mapping}"
        
        else:
           if procedure == 'procedureReason':
                uri = reason.split('#')[-1] if '#' in reason else reason.split('/')[-1]
                return f"{reason}"
           
    return



@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/extract_last_part",
    uri = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    case_id = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1"
)
def extract_last_part(uri,case_id):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    uri = str(uri).strip()
    case_id = str(case_id).strip()

    if uri.lower() == 'nan' or uri == '' or case_id.lower() == 'nan' or case_id == '':
        return

    uri = uri.split('#')[-1] if '#' in uri else uri.split('/')[-1]
    return f"{base}{uri}_{case_id}"
 

@udf(#type:ignore
    fun_id = "http://ontology.resq.um.es/RES-Q_Functions/generatePart",
    pattern_type = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam",
    field_id = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam1",
    ontology_mapping = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam2",
    case_id = "http://users.ugent.be/bjdmeest/function/grel.ttl#valueParam3"
)
def generatePart(pattern_type,field_id,ontology_mapping,case_id):
    base = "http://resqplus-resources/ontologies/resqplus-data#"
    if pattern_type == 'ObservationResultStatement':
        return f"{base}ObservationResultSt_{ontology_mapping}_{field_id}_{case_id}"
    elif pattern_type == 'ClinicalProcedureStatement':
        return f"{base}ClinicalProcedureSt_{ontology_mapping}_{field_id}_{case_id}"
    elif pattern_type == 'ClinicalSituationStatement':
        return f"{base}ClinicalSituationSt_{ontology_mapping}_{field_id}_{case_id}"
    else:
        return ''
    

    