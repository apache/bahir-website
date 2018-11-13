---
layout: page
title: Spark Streaming ZeroMQ
description: Spark Streaming ZeroMQ
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

A library for reading data from [ZeroMQ](http://zeromq.org/) using Spark Streaming.

## Linking

Using SBT:

    libraryDependencies += "org.apache.bahir" %% "spark-streaming-zeromq" % "2.2.2"

Using Maven:

    <dependency>
        <groupId>org.apache.bahir</groupId>
        <artifactId>spark-streaming-zeromq_2.11</artifactId>
        <version>2.2.2</version>
    </dependency>

This library can also be added to Spark jobs launched through `spark-shell` or `spark-submit` by using the `--packages` command line option.
For example, to include it when starting the spark shell:

    $ bin/spark-shell --packages org.apache.bahir:spark-streaming-zeromq_2.11:2.2.2

Unlike using `--jars`, using `--packages` ensures that this library and its dependencies will be added to the classpath.
The `--packages` argument can also be used with `bin/spark-submit`.

This library is cross-published for Scala 2.10 and Scala 2.11, so users should replace the proper Scala version (2.10 or 2.11) in the commands listed above.

## Examples


### Scala API

    val lines = ZeroMQUtils.createStream(ssc, ...)

### Java API

    JavaDStream<String> lines = ZeroMQUtils.createStream(jssc, ...);

See end-to-end examples at [ZeroMQ Examples](https://github.com/apache/bahir/tree/master/streaming-zeromq/examples)