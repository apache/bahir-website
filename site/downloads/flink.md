---
layout: page
title: Bahir Flink Extensions Downloads
description: Bahir Flink Extensions Downloads page
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

# {{ site.data.project.name }} Extensions for Apache Flink Downloads

Please find below the latest releases of {{ site.data.project.name }} for Apache Flink Extensions. Note that the binary artifacts for each platform are also published independently through Maven and each [extension documentation page](/docs/flink/overview) describes how to add these artifacts to your application.

## Bahir Extensions for Apache Flink Latest Release

{% if site.data.project.flink_latest_release %}

Our latest {{ site.data.project.name }} release for Apache Flink extensions is {{site.data.project.flink_latest_release}}, released on {{site.data.project.flink_latest_release_date}}.

<table class="table table-hover sortable">
    <thead>
        <tr>
            <th><b>Name</b></th>
            <th><b>Archive</b></th>
            <th><b>MD5</b></th>
            <!--th><b>SHA-1</b></th-->
            <th><b>signature</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>{{ site.data.project.name }} Flink Extensions {{site.data.project.flink_latest_release}} (tar.gz)</td>
            <td><a href="{{site.data.project.flink_latest_release_location_mirror}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.tgz">tar.gz</a></td>
            <td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.tgz.md5">MD5</a></td>
            <!--td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.tgz.sha1">SHA-1</a></td-->
            <td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.tgz.asc">ASC</a></td>
        </tr>
        <tr>
            <td>{{ site.data.project.name }} Flink Extensions {{site.data.project.flink_latest_release}} (zip)</td>
            <td><a href="{{site.data.project.flink_latest_release_location_mirror}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.zip">zip</a></td>
            <td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.zip.md5">MD5</a></td>
            <!--td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.zip.sha1">SHA-1</a></td-->
            <td><a href="{{site.data.project.flink_latest_release_location}}/{{site.data.project.flink_latest_release}}/apache-bahir-flink-{{site.data.project.flink_latest_release}}-src.zip.asc">ASC</a></td>
        </tr>
        <tr>
            <td>Release Notes</td>
            <td><a href="/releases/flink/{{ site.data.project.flink_latest_release }}/release-notes">{{ site.data.project.flink_latest_release }}</a></td>
            <td></td>
            <!--td></td-->
            <td></td>
        </tr>
    </tbody>
</table>

### Previous Releases

All previous releases of {{ site.data.project.name }} Flink Extensions can be found in the [archives](http://archive.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.flink_unix_name}}).

## Verifying a Release

Instructions for checking hashes and signatures is indicated on the [Verifying Apache Software Foundation Releases](http://www.apache.org/info/verification.html) page.

Choose a source distribution in either *tar* or *zip* format,
and [verify](http://www.apache.org/dyn/closer.cgi#verify)
using the corresponding *pgp* signature (using the committer file in
[KEYS](http://www.apache.org/dist/{{ site.data.project.flink_unix_name }}/KEYS)).
If you cannot do that, the *md5* hash file may be used to check that the
download has completed OK.

For fast downloads, current source distributions are hosted on mirror servers;
older source distributions are in the
[archive](http://archive.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.flink_unix_name}}).
If a download from a mirror fails, retry, and the second download will likely
succeed.

For security, hash and signature files are always hosted at
[Apache](https://www.apache.org/dist).

{% else %}

Currently, there isn't a release available for Bahir Flink Extensions yet.

You can still retrieve the source files from our git repository by typing:

<pre>
git clone {{site.data.project.flink_source_repository_mirror}}
cd {{site.data.project.flink_github_project_name}}
</pre>

{% endif %}
