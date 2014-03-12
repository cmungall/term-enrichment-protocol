
The documentation is split into 4 parts:

 * An analysis API, that documents the http parameters used in making requests
 * A fetch metadata API, that allows clients to determine the capabilities of an implemtor service
 * Documentation on the JSON payload
 * Additional documentation on the JSON-LD context that maps the JSON payload to RDF

## Analysis API

The client application communicates to the implementing service via a
standard REST interface.

See:

 * [enrichment_api.md](enrichment_api.md)

## Fetch Metadata API

Implementor services will vary in their capabilities. For example,
some may only allow inputs of gene sets from a fixed number of
species. If the client application is informed of the capabilities of
the client, it can drive the client-side user interface appropriately.

See:

 * [metadata_api.md](metadata_api.md)

## JSON payload

As is now common for web-based protocols, we use JSON as the syntax
for communicating results of analyses (including error messages) back
to the client.

See:

 * [results_in_json.md](results_in_json.md)

## JSON-LD context

See http://www.w3.org/TR/json-ld/ for documentation on JSON-LD

We use JSON-LD to provide a formal semantics for parameter values and
result objects. For example, the JSON-LD context contains the mapping:

    "Holm_Bonferroni": "OBI:0200066",
    "p_value": "OBI:0000175",

This means that when the string "Holm_Bonferroni" is used (for
example, as the value of the "correction" parameter) then the meaning
of this is the same as: http://purl.obolibrary.org/obo/OBI_0200066

Similarly, the key "p_value" when used in a JSON object is mapped to:
http://purl.obolibrary.org/obo/OBI_0000175

Note that the JSON payload specified in results_in_json.md can be
passed directly through a generic JSON-LD to RDF converter to produce
valid RDF.

See:

 * [context.json](context.json)
 
TODO: provide a stable URL for the context



