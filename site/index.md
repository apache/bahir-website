---
layout: page
title: Home
tagline: Apache Project !
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

## What is {{ site.data.project.name }}

{{ site.data.project.name }} provides extensions to multiple distributed analytic platforms, extending their reach with a diversity of streaming connectors and SQL data sources.

Currently, {{ site.data.project.short_name }} provides extensions for [Apache Spark](http://spark.apache.org){:target="_blank"} and [Apache Flink](http://flink.apache.org){:target="_blank"}.

## Apache Spark extensions

{% if site.data.project.spark_latest_release %}
The latest release for Bahir Spark extensions is {{ site.data.project.spark_latest_release }}, currently providing:
{% else %}
Currently, there isn't a release available for Bahir Spark Extensions yet.
The following extensions are under development and will be supported in the upcoming release:
{% endif %}

 - Spark Structured Streaming data source for MQTT
 - Spark DStream connector for Akka
 - Spark DStream connector for MQTT
 - Spark DStream connector for Twitter
 - Spark DStream connector for ZeroMQ


## Apache Flink extensions

{% if site.data.project.flink_latest_release %}
The latest release for Bahir Flink extensions is {{ site.data.project.flink_latest_release }}, currently providing:
{% else %}
Currently, there isn't a release available for Bahir Flink Extensions yet.
The following extensions are under development and will be supported in the upcoming release:
{% endif %}

 - Flink streaming connector for ActiveMQ
 - Flink streaming connector for Flume
 - Flink streaming connector for Redis
 - Flink streaming connector for Akka
 - Flink streaming connector for Netty

 
The {{ site.data.project.name }} community welcomes the proposal of new extensions.

## Contact the {{ site.data.project.short_name }} community

For {{ site.data.project.short_name }} updates and news, subscribe to our development mailing list. Check out [All Mailing Lists](/community).

<div class="row">
  <div class="col-md-12">
      <a href="mailto:{{ site.data.project.dev_list }}?subject=Please update your subject" class="btn btn-primary btn-lg bigFingerButton" role="button">E-mail us</a>
      <a href="mailto:{{ site.data.project.dev_list_subscribe }}?subject=send this email to subscribe" class="btn btn-primary btn-lg bigFingerButton" role="button">Subscribe</a>
      <a href="{{ site.data.project.dev_list_archive_mailarchive }}" target="_blank" class="btn btn-primary btn-lg bigFingerButton" role="button">View Archive</a>
  </div>
</div>
