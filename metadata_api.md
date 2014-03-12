Implementor services will vary in their capabilities. For example,
some may only allow inputs of gene sets from a fixed number of
species. If the client application is informed of the capabilities of
the client, it can drive the client-side user interface appropriately.

## URLs

A call to a retrieve implementation metadata is made by suffixing
/metadata/ into the base.

E.g.

    http://mygroupswebsite.org/terp/enrichment

## Metadata JSON

### metadata object

This is the top level object

    {
        tool : TOOLINFO,
        ontologies : [ONT1, ONT2, ],
        association_sets : [ASSOCSET1, ASSOCSET2, ],
        parameters : [
            <P1>, <P2>, ...
        ]
    }

### parameter object

A parameter object describes the default and supported values of a
parameter. See enrichment_api.md for a list of parameters.

    {
        name : <NAME>,
        default : <VALUE>,
        supported : [ VALUE1, VALUE2, ...]
    }

Here the NAME is the name of the parameter from enrichment_api.md

The default key is optional.

The supported key is optional.

For example, a tool dedicated to GO may specify:

    {
        name : "ontology",
        default : "go",
        supported : [ "go" ]
    },
    {
        name : "aspect",
        default : "biological_process",
        supported : [ "biological_process", "cellular_component", "molecular_function" ]
    },

### toolinfo

This provides metadata about the tool

    {
         registry_id : <ID>,    ## id in the GO tools registry
         name : <NAME>,         ## MUST match name in registry
         version : <VERSION>    ## Should use semantic versioning
         build_date: <DATE>     ## MUST be ISO-8601 YYYY-MM-DD.
    }

### ontology

Provides metadata about loaded versions of ontologies

   {
         ontology_iri : <IRI>,    ## formal PURL IRI of ontology
         version_IRI : <IRI>,     ## ontology version IRI
         date_retrieved : <DATE>  ## MUST be ISO-8601 YYYY-MM-DD.
   }

For a GO tool typically only one value may be provided here.

In principle a tool may offer any number of versions of any number of
different ontologies.

### association_set

Provides metadata about the verson of association sets used by the tool

   {
         name : <NAME>,           ## e.g. gene_association.mgi
         taxon : <INTEGER>        ## e.g. 9606
         ontologies : [<IRI>, <IRI>, ..]    ## ontologies used in associations
         date_retrieved : <DATE>  ## MUST be ISO-8601 YYYY-MM-DD.
         source_url : <URL>       ## the source URL from which the associations were retrieved.
   }

