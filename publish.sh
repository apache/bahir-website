#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to you under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e
cd site
bundle exec jekyll clean
bundle exec jekyll build -d _site
COMMIT_HASH=`git rev-parse HEAD`
cd ..
git checkout asf-site
git branch --set-upstream-to=origin/asf-site asf-site
git pull --rebase
rm -rf content
mkdir content
mv site/_site/* content
git add content
echo "Publishing changes from master branch $COMMIT_HASH"
git commit -a -m "Publishing from $COMMIT_HASH"
echo "> > >"
echo " "
echo "You are now on the asf-site branch"
echo "Run git push origin asf-site to update the live site."
echo " "
echo " "
set +e
