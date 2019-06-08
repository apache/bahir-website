---
layout: page
title: Bahir Release 2.1.0
description: Release Notes for Apache Bahir 2.1.0
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


# Apache Bahir for Apache Spark 2.3.3

Below are all the enhancements and bug fixes for the 2.3.x releases.


Release Notes - Bahir - Version Spark-2.3.0

    * [BAHIR-46]  - Handle re-delivery of message in MQTT structured streaming source.
    * [BAHIR-104] - MQTT Dstream returned by the new multi topic support API is not a pairRDD
    * [BAHIR-128] - Test failing sporadically in sql-cloudant's CloudantChangesDFSuite
    * [BAHIR-139] - Scala-maven-plugin does not respect Java compile level
    * [BAHIR-152] - License header not enforced for Java sources
    * [BAHIR-159] - Our project needs to use org.apache.bahir:spark-sql-streaming-mqtt_2.11:2.2.0, which has dependency conflict problem.
    * [BAHIR-165] - The avro messages to streaming-mqtt gives negative value.
    * [BAHIR-66]  - Add test that ZeroMQ streaming connector can receive data
    * [BAHIR-164] - Spark Streaming with MQTT fails with Spark 2.3.0
    * [BAHIR-166] - Migrate akka sql streaming source to datasrouce v2 API
    * [BAHIR-49]  - Add MQTTSink to SQL Streaming MQTT.
    * [BAHIR-182] - Create PubNub extension for Apache Spark Streaming
    * [BAHIR-137] - Load performance improvements for _changes API in sql-cloudant
    * [BAHIR-154] - Refactor sql-cloudant to use Cloudant's java-cloudant features
    * [BAHIR-181] - username and password should be available for pyspark when using mqtt streaming
    * [BAHIR-123] - Fix errors to support the latest version of Play JSON library for sql-cloudant
    * [BAHIR-138] - Fix sql-cloudant deprecation messages
    * [BAHIR-150] - Jenkins PR builder should not abort build after first failed module



































