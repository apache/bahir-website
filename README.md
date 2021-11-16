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

Apache Bahir Website
====================

The Apache Bahir website was forked from the [Apache Website Template](https://github.com/apache/apache-website-template).

The website gets generated using [Jekyll](https://jekyllrb.com/) 2.4.0.

How to deploy your project's web site
=====================================

Installing Jekyll and website dependencies
------------------------------------------

The steps below will install the latest [Jekyll](https://jekyllrb.com/) version and any dependencies required to get this website built.

```
1. sudo gem install jekyll bundler
2. cd site
3. bundle install
```

For more information, see [Installing Jekyll](https://jekyllrb.com/docs/installation/).

Running locally
---------------

Before opening a pull request, you can preview your contributions by running from within the directory:

```
1. cd site
2. bundle exec jekyll serve --watch
3. Open http://localhost:4000
```

Update extensions documentation
-------------------------------

To update the current documentation contents, use the update-doc script. This script will update the documentation contents based on the README.md files from the source of each extension.

```
1. update-doc.sh
2. git commit -a -m "My updates"
3. git push
4. ./publish.sh
5. git push origin asf-site
```

Publishing to live site
-----------------------

Bahir is using [gitpubsub](http://www.apache.org/dev/gitpubsub.html) for publishing the website, and the live website content is stored in the asf-site git branch.

To publish new contents to the website, commit your changes to master, and use the 'publish.sh' shell script.

```
1. Make your changes
2. git commit -a -m "My updates"
3. git push
4. ./publish.sh
5. git push origin asf-site
```

Within a few minutes, gitpubsub should kick in and you'll be able to see the results at [bahir.apache.org](https://bahir.apache.org/).

Adding contributors
-------------------

To add a contributor to the project, or to modify existing contributors, edit `site/_data/contributors.yml`. The [project members](http://localhost:4000/community-members) list will be re-generated.
