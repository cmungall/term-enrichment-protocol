
## Output Object

This is the top-level object returned

    output : {
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
        term : {
            id: <CLASSID>
            label: <LABEL>
        },
        number_in_population : <INT>,
        number_in_sample : <INT>,
        expected : NUMBER
        direction : ( "+" OR "-"),
        p_value : NUMBER
    }

The semantics of each field are provided in the json LD context, which
maps each key to an ontology class.

TOOD complete this mapping.