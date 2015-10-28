---
title: CouchDB 
layout: basic
is_index: true
---

Docker for CouchDB servers in the nEDM experiment.

## Information

This docker is based off of
[klaemo/couchdb:1.6.1](https://hub.docker.com/r/klaemo/couchdb/) and includes a
number of scripts (os daemons and update notifiers) that need to be run in
parallel.

The couchdb server which is run allows proxy authentication though with a
randomly defined private key (automatically generated for each container),
which means this is only used for the local scripts (os daemons/update
notifiers) that run in the container.
