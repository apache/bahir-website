---
layout: page
title: Apache Flink Streaming Connector for Apache Kudu
description: Apache Flink Streaming Connector for Apache Kudu
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

# Flink Kudu Connector

This connector provides a source (```KuduInputFormat```) and a sink/output (```KuduSink``` and ```KuduOutputFormat```, respectively) that can read and write to [Kudu](https://kudu.apache.org/). To use this connector, add the
following dependency to your project:

    <dependency>
      <groupId>org.apache.bahir</groupId>
      <artifactId>flink-connector-kudu_2.11</artifactId>
      <version>1.1-SNAPSHOT</version>
    </dependency>

*Version Compatibility*: This module is compatible with Apache Kudu *1.7.1* (last stable version).

Note that the streaming connectors are not part of the binary distribution of Flink. You need to link them into your job jar for cluster execution.
See how to link with them for cluster execution [here](https://ci.apache.org/projects/flink/flink-docs-stable/start/dependencies.html).

## Installing Kudu

Follow the instructions from the [Kudu Installation Guide](https://kudu.apache.org/docs/installation.html).
Optionally, you can use the docker images provided in dockers folder. 

## KuduInputFormat

```
ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

env.setParallelism(PARALLELISM);

// create a table info object
KuduTableInfo tableInfo = KuduTableInfo.Builder
        .create("books")
        .addColumn(KuduColumnInfo.Builder.create("id", Type.INT32).key(true).hashKey(true).build())
        .addColumn(KuduColumnInfo.Builder.create("title", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("author", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("price", Type.DOUBLE).build())
        .addColumn(KuduColumnInfo.Builder.create("quantity", Type.INT32).build())
        .build();
    
// Pass the tableInfo to the KuduInputFormat and provide kuduMaster ips
env.createInput(new KuduInputFormat<>("172.25.0.6", tableInfo))
        .count();
        
env.execute();
```

## KuduOutputFormat

```
ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

env.setParallelism(PARALLELISM);

// create a table info object
KuduTableInfo tableInfo = KuduTableInfo.Builder
        .create("books")
        .createIfNotExist(true)
        .replicas(1)
        .addColumn(KuduColumnInfo.Builder.create("id", Type.INT32).key(true).hashKey(true).build())
        .addColumn(KuduColumnInfo.Builder.create("title", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("author", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("price", Type.DOUBLE).build())
        .addColumn(KuduColumnInfo.Builder.create("quantity", Type.INT32).build())
        .build();

...

env.fromCollection(books)
        .output(new KuduOutputFormat<>("172.25.0.6", tableInfo));

env.execute();
```

## KuduSink

```
StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

env.setParallelism(PARALLELISM);

// create a table info object
KuduTableInfo tableInfo = KuduTableInfo.Builder
        .create("books")
        .createIfNotExist(true)
        .replicas(1)
        .addColumn(KuduColumnInfo.Builder.create("id", Type.INT32).key(true).hashKey(true).build())
        .addColumn(KuduColumnInfo.Builder.create("title", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("author", Type.STRING).build())
        .addColumn(KuduColumnInfo.Builder.create("price", Type.DOUBLE).build())
        .addColumn(KuduColumnInfo.Builder.create("quantity", Type.INT32).build())
        .build();

...

env.fromCollection(books)
    .addSink(new KuduSink<>("172.25.0.6", tableInfo));

env.execute();
```
