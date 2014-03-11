
The documentation is split into 4 parts:

 * An analysis API, that documents the http parameters used in making requests
 * A fetch metadata API, that allows clients to determine the capabilities of an implemtor service
 * Documentation on the JSON payload
 * Additional documentation on the JSON-LD context that maps the JSON payload to RDF

## Analysis API

The client application communicates to the implementing service via a
standard REST interface.

See:

 * enrichment_api.md

## Fetch Metadata API

Implementor services will vary in their capabilities. For example,
some may only allow inputs of gene sets from a fixed number of
species. If the client application is informed of the capabilities of
the client, it can drive the client-side user interface appropriately.

See:

 * metadata_api.md

## JSON payload

As is now common for web-based protocols, we use JSON as the syntax
for communicating results of analyses (including error messages) back
to the client.

See:

 * results_in_json.md

## JSON-LD context

See:

 * context.json




