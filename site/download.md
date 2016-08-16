---
layout: page
title: Downloads
description: Project Downloads page
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

## {{ site.data.project.name }} Downloads

Please find below the latest releases of {{ site.data.project.name }}. Note that the binary artifacts are also published through Maven.

### Latest Release 

Our latest release is {{ site.data.project.name }} {{site.data.project.latest_release}}, released on ({{site.data.project.latest_release_date}}).

{% if site.data.project.latest_release %}
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
            <td>{{ site.data.project.name }} {{site.data.project.latest_release}} (tar.gz)</td>
            <td><a href="http://www.apache.org/dyn/closer.lua/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.tar.gz">tar.gz</a></td>
            <td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.tar.gz.md5">MD5</a></td>
            <!--td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.tar.gz.sha1">SHA-1</a></td-->
            <td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.tar.gz.asc">ASC</a></td>
        </tr>
        <tr>
            <td>{{ site.data.project.name }} {{site.data.project.latest_release}} (zip)</td>
            <td><a href="http://www.apache.org/dyn/closer.lua/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.zip">zip</a></td>
            <td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.zip.md5">MD5</a></td>
            <!--td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.zip.sha1">SHA-1</a></td-->
            <td><a href="http://www.apache.org/dist/{{site.data.project.unix_name}}/{{site.data.project.latest_release}}/apache-bahir-{{site.data.project.latest_release}}-src.zip.asc">ASC</a></td>
        </tr>
    </tbody>
</table>
{% endif %}


Instructions for checking hashes and signatures is indicated on the [Verifying Apache Software Foundation Releases](http://www.apache.org/info/verification.html) page.

You can also retrieve the source files from our svn repository by typing :

<pre>
git clone https://github.com/apache/bahir
cd bahir
git checkout -b tags/v{{site.data.project.latest_release}} v{{site.data.project.latest_release}}
</pre>



### Verifying a Release

Choose a source distribution in either *tar* or *zip* format,
and [verify](http://www.apache.org/dyn/closer.cgi#verify)
using the corresponding *pgp* signature (using the committer file in
[KEYS](http://www.apache.org/dist/{{ site.data.project.unix_name }}/KEYS)).
If you cannot do that, the *md5* hash file may be used to check that the
download has completed OK.

For fast downloads, current source distributions are hosted on mirror servers;
older source distributions are in the
[archive](http://archive.apache.org/dist/{{ site.data.project.unix_name }}/).
If a download from a mirror fails, retry, and the second download will likely
succeed.

For security, hash and signature files are always hosted at
[Apache](https://www.apache.org/dist).

### Previous Releases

All previous releases of Apache Bahir can be found in the [archives](http://archive.apache.org/dist/bahir/). 
