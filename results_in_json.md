
## Output Object

This is the top-level object returned

    output : {
        "@" : <CONTEXT>,
        input : <INPUT OBJECT>,
        implementation : <IMPL>,
        results : [
            <RESULT_1>,
            <RESULT_2>,
            ...
            <RESULT_n>
        ]
    }

The implementor MAY decide to order the results via some criterion

## Input Object

The input object provides metadata about the original and inferred
input, such as what gene IDs were used, and what gene IDs could not be
resolved, what the background set was.

The ontologies used and annotations used are also considered input

TODO : document this

## Implementation Object

The implementation object provides details of how the enrichment was
performed - which algorithm was used.

TODO : document this

## Result Object

Each result object represents an over (or under) represented gene

    {
        term : {                  ## REQUIRED
            id: <CLASSID>
            label: <LABEL>
        },              
        population_size : <INT>,  
        enriched_class_population_size : <INT>, 
        sample_size : <INT>,      
        enriched_class_sample_size : <INT> ,
        expected : NUMBER, 
        direction : ( "under" OR "over"),
        p_value : NUMBER,
        fold_change : NUMBER,
        <KEY_1> : <VALUE(S)_1>,
        <KEY_2> : <VALUE(S)_2>,
        ...
    }

The semantics of each field are provided in the json LD context, which
maps each key to an ontology class. See the file
[context.json](context.json), in this directory.

The implementor may choose to provide their own keys, but they should
all be described in a local context.json file.

For most implementations, a p_value is required. However, for some
implementations, e.g. the ontologizer MSA method, a score is provided
instead.