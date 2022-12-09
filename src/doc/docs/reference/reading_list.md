---
tags:
- reference
---

# Reading list

This page includes some more resources for working with MPS. This article is a bit dated but maybe still useful.
It may be better to start to look for resources at [mps.rocks](https://mps.rocks/) first.

## Language engineering with MPS

If you want to become proficient with language engineering based on MPS, the best approach is to build stuff, work with people and ask questions. The MPS team at itemis is a good environment for doing this. However, we have written a lof of stuff over time. And to increase overall efficiency and to be respectful of the time of the team members, it is recommended to read a few things in advance/in parallel. In this document we describe a list of recommended readings.

I suggest you start with the book on DSL Engineering. It's available as a free PDF from [voelter.de/books](http://voelter.de/books/).

In the first part, it discusses some general characterizations of DSLs. Part two is on language design; you should become proficient in the design concerns discussed there. Part three is about language implementation with different tools; you can skip the non-MPS parts, if you want to. The MPS-specific explanations are not quite up to date, but the concepts and approaches explained there are still relevant.

One recent extension to MPS we use all the time now is grammar cells, a way to more easily build usable editors for textual notation. We strongly suggest reading this paper: [GrammarCells](http://voelter.de/data/pub/SLE2016-GrammarCells.pdf).

Next, you may want to take a look at the [MPS books by Fabien Campagne](http://campagnelab.org/publications/our-books/).
They are essentially a beginner's guide to language development with MPS. Whenever you want to do something specific, then looking at how to do it in those books is a good starting point for deeper discussions with the colleagues (note: the official documentation might be a better starting point because these book might be outdated in some aspects.)

The documentation page also contains videos and tutorials on a variety of specific MPS-related topics.

Over the years we have built a lot of useful extensions and utilities to MPS. They are described on the {{ mbeddr_platform() }} page. Most of those are not really documented, but you can find examples for all (relevant and stable) utilities in mbeddr itself.

Finally, to understand the experiences we have made with MPS over the years, you may want to read this draft paper: [Lessons Learned from Developing mbeddr](http://voelter.de/data/pub/BuildingMbeddr-Experiences.pdf).

## Working on (extending) mbeddr

If, in addition to working with MPS in general, you plan to work on the mbeddr languages, there is more reading we suggest. We suggest reading parts of Markus' thesis, because it is the most comprehensive and up-to-date description of mbeddr: [Generic Tools, Specific Languages](http://voelter.de/data/books/GenericToolsSpecificLanguages-1.0-web.pdf).

To get a general overview over mbeddr, please read chapter 3.

An overview, from a user's perspective, of the most important features, you can find in chapter 4.

Chapters 8 and 9 illustrate how we have implemented mbeddr in MPS. Implicitly, this also gives you a good starting point to understand the structure of mbeddr, as well as how and where to "hook in" for building extensions.

To learn about specific other topics of mbeddr, such as the integrated verifications, please check out the publications on the [mbeddr learn page](http://mbeddr.com/learn.html).