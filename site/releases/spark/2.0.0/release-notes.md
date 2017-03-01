---
layout: page
title: Bahir Release 2.0.0
description: Release Notes for Apache Bahir 2.0.0
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

{% include JB/setup %}


# Apache Bahir 2.0 for Apache Spark 2.0
    
## Bug

    [BAHIR-13] - Update spark tags dependency
    [BAHIR-14] - Cleanup maven pom from Spark dependencies
    [BAHIR-15] - Enable RAT on Bahir builds
    [BAHIR-16] - Build issues due to log4j properties not found
    [BAHIR-18] - Include examples in Maven test build
    [BAHIR-23] - Build should fail on Checkstyle violation
    [BAHIR-24] - Fix MQTT Python code
    [BAHIR-38] - Spark-submit does not use latest locally installed Bahir packages
    [BAHIR-42] - Refactor sql-streaming-mqtt examples to follow other projects pattern
    [BAHIR-43] - Add missing apache license header to sql-mqtt file
    [BAHIR-44] - Add new sql-streaming-mqtt to distribution

## Improvement

    [BAHIR-36] - Update readme.md with build instructions

## New Feature

    [BAHIR-2]  - Create initial build for Bahir components
    [BAHIR-39] - MQTT as a streaming source for SQL Streaming

## Task

    [BAHIR-17] - Prepare release based on Apache Spark 2.0.0-preview
    [BAHIR-22] - Add script to run examples
    [BAHIR-35] - Include Python code in the binary jars for use with "--packages ..."
    [BAHIR-37] - Prepare release based on Apache Spark 2.0.0

## Sub-task

    [BAHIR-19] - Create Bahir source distribution
    [BAHIR-20] - Create release script
    [BAHIR-21] - Create script to change build between scala 2.10 and 2.11
    [BAHIR-28] - Add documentation for streaming-akka connector
    [BAHIR-29] - Add documentation for streaming-mqtt connector
    [BAHIR-30] - Add documentation for streaming-twitter connector
    [BAHIR-31] - Add documentation for streaming-zeromq connector
