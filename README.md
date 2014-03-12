This repository provides documentation on the protocol proposed by the
Gene Ontology Consortium for gene set / term enrichment tools.

## Give us feedback!

At this stage nothing is set on stone, and we are looking for
feedback, particularly from tool providers. Get involved or provide
feedback by any of the following mechanisms:

 * Fork this project on github
 * Add issues or comments on the issue tracker
 * Email us gohelp AT geneontology DOT org

## Background

An ontology enrichment analysis takes as input a set of genes
(optionally associated with expression values) and returns a set of
ontology terms over-represented (or under-represented) for that set.

There are a number of different tools and services that allow for this
kind of analysis. The GO consortium aims to make it easier for users
to use a variety of different tools through a common interface on the
GO website, facilitated via a *standard protocol*.

Tool providers implementing this protocol will be hooked in to the GO
website after registering their tool. At this stage the protocol is
not finalized, we are soliciting comments. Currently pantherdb
implements an earlier version of this protocol, this is what is
currently driving the new GO website on http://beta.geneontology.org

The protocol is designed to be simple to implement for basic
implementations, yet more extensible for advanced uses.

## Documentation

See:

 * [terp_docs.md](https://github.com/cmungall/term-enrichment-protocol/blob/master/terp_docs.md)


## History

This project subsumes a previous project to define a term enrichment
format (TERF), intended for use as output of command line tools,
allowing hooks within Galaxy. After initial feedback from GO advisors
we decided to generalize this to a web-based protocol that could be
used independent of the Galaxy environment. Part of this standard
still includes a JSON exchange format.

 * http://biostar.stackexchange.com/questions/11269/is-there-a-standard-format-for-go-term-enrichment-results
 * GO Galaxy - http://wiki.geneontology.org/index.php/Galaxy

