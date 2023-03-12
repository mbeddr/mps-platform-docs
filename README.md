# MPS Platform Docs

This website collects practical knowledge about MPS and popular MPS platforms such as MPS-extensions and mbeddr. It is written mainly in the form of a Q&A. If you have any feedback, please write a comment at the bottom of a page or
open an issue in this repository.

![build status](https://img.shields.io/github/actions/workflow/status/mbeddr/mps-platform-docs/publish_doc.yml?branch=main)
![license](https://img.shields.io/github/license/mbeddr/mps-platform-docs)
![last commit](https://img.shields.io/github/last-commit/mbeddr/mps-platform-docs)

<img width="1068" alt="mps-platform-docs homepage" src="https://user-images.githubusercontent.com/88385944/180607116-2c61d660-7893-4ebb-a383-97b56ff94abb.png">

## Local execution
Run: `./gradlew mkdocsServe` (rebuilds everything on change --> slow)
Better: `./gradlew serveFast`(rebuilds only current page --> fast, only first build is slow)

Build: `./gradlew mkdocsBuild`

## Publishing

`./gradlew mkdocsPublish` is automatically run on push (GitHub Actions). The secret key is just an SSH key from someone who has push permissions for this repository.
