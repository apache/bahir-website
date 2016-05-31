---
layout: page
title: Contributing a new extension
description: Contributing a new extension page
group: nav-right
---
<!--
{% comment %}
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to you under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
{% endcomment %}
-->

Apache Bahir provides extensions to distributed analytic platforms such as Apache Spark.  In the context of Apache Spark, extensions can be Streaming connectors, SQL data sources, etc

This document explains the process for proposing a new extension to Apache Bahir, and how the extension lifecycle are handled in the project.

# Proposing a new extension

In Apache Bahir we believe that forming a community around these extensions will actually make it better, and extend its life cycle, thus we require that new extensions be discussed on the project mailing list and receive at least 3 +1 from other committers.

When set of committers provides a +1 vote to a new extension, they become the initial community around the extension, and will become responsible for helping on patch reviews, but especially, they will become the backup for maintaining the extension in case of build issues, reacting to api changes, or any other issues that might break the extension.

Once a proposed extension gets the necessary votes, the author should follow the regular contribution process, creating a jira if one is not available yet, and provide a pull request.

# What is expected of a new extension

Extensions must provide:

1. **The main extension code**: this is the actually the extension core code
1. **Extensible test coverage**: automated tests is a MUST to serve as examples on how to use the extension, but also to assert that it works and continue to works while it evolves
1. **Documentation**: extensions MUST provide details on how users would integrated the extension in their applications

Extensions might also provide:

1. **Example**: a simple application that can serve as a reference point on how to use the extension in an application. Users must be able to simply build and deploy the sample application into a cluster. 

# Extension life cycle

We understand that software, particularly open source one, evolves quite quickly, and thus we antecipate that some extensions might start to lag behind in its maintenance. 

The steps described below were crafted with the intention to alleviate the side-effects of one extension lagging behind and becoming broke for one reason or another.   

## Retiring extensions

When a particular extension breaks a build, it will be removed from the build (TBD the actual period here) to minimize the impact on the community. 

Extensions that stay out of the build for a period of time (TBD the actual period here) will be retired to an 'contrib' folder, and at that point will not be part of the official releases.

## Resurecting a retired extension

At any point, a community member can request to resurect a retired extension, and at this point, the process is the same as the initial extension proposal, where he would propose the extension to be brought to life again, and would need to receive at least 3 +1 from other committers. 
