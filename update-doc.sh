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

##############################################################################
# This script generates the documentation for the individual Bahir modules   #
# from the README.md files found in the modules in the Bahir source repo     #
#                                                                            #
#    bahir (source repo)       bahir-website                                 #
#    .                         └─site                                        #
#    .                           └─docs                                      #
#    .                             └─spark                                   #
#    ├─sql-streaming-mqtt            └─current                               #
#    │ └─README.md          ─────>     ├─spark-sql-streaming-mqtt.md         #
#    ├─streaming-akka                  │                                     #
#    │ └─README.md          ─────>     ├─spark-streaming-akka.md             #
#    ├─streaming-mqtt                  │                                     #
#    │ └─README.md          ─────>     ├─spark-streaming-mqtt.md             #
#    ├─streaming-twitter               │                                     #
#    │ └─README.md          ─────>     ├─spark-streaming-twitter.md          #
#    └─streaming-zeromq                │                                     #
#      └─README.md          ─────>     └─spark-streaming-zeromq.md           #
#                                                                            #
# Page header with license text comes from the respective template files     #
# under site/docs/spark/templates                                            #
##############################################################################


set -e

BASE_DIR=$(pwd)

SPARK_WEBSITE_TEMPLATES_DIR=$BASE_DIR/site/docs/spark/templates
SPARK_WEBSITE_DOC_DIR=$BASE_DIR/site/docs/spark/current
SPARK_REPO_NAME=bahir
SPARK_BAHIR_SOURCE_DIR=$BASE_DIR/target/$SPARK_REPO_NAME

FLINK_WEBSITE_TEMPLATES_DIR=$BASE_DIR/site/docs/flink/templates
FLINK_WEBSITE_DOC_DIR=$BASE_DIR/site/docs/flink/current
FLINK_REPO_NAME=bahir-flink
FLINK_BAHIR_SOURCE_DIR=$BASE_DIR/target/$FLINK_REPO_NAME

function checkout_code {
    # Checkout code
    cd "$BASE_DIR" # make sure we're in the base dir

    rm -rf target
    mkdir target
    cd target
    git clone "https://git-wip-us.apache.org/repos/asf/$1.git" --quiet
    cd "$1"
    git checkout "$GIT_REF"
    git_hash=$(git rev-parse --short HEAD)
    echo "Checked out $1 git hash $git_hash"

    git clean -d -f -x

    cd "$BASE_DIR" # return to base dir
}

function update_docs {
    WEBSITE_TEMPLATES_DIR=$1
    WEBSITE_DOC_DIR=$2
    SOURCE_DIR=$3
    shift 3

    [ ! -d "$WEBSITE_DOC_DIR" ] && mkdir "$WEBSITE_DOC_DIR"

    while [ $# -ne 0 ]; do
        echo "Syncing document $WEBSITE_DOC_DIR/$1.md with source $SOURCE_DIR/$2/README.md"
        rm -f "$WEBSITE_DOC_DIR/$1.md"
        cp "$WEBSITE_TEMPLATES_DIR/$1.template" "$WEBSITE_DOC_DIR/$1.md"
        cat "$SOURCE_DIR/$2/README.md"       >> "$WEBSITE_DOC_DIR/$1.md"
        shift 2
    done
}

function check_version_strings {
    if grep -q -r "[0-9]-SNAPSHOT" "$1"/*.md ; then
        echo
        echo "TODO: Replace '...-SNAPSHOT' version strings:"
        echo
        grep -r -n "[0-9]-SNAPSHOT" "$1"/*.md | sed -e 's|'"$(pwd)"/'||g' | grep --color "[0-9.]*-SNAPSHOT"
        echo
        echo "i.e. to replace '2.1.0-SNAPSHOT' with '2.0.2' run the following command:"
        echo
        echo "  perl -i -pe 's/2.1.0-SNAPSHOT/2.0.2/g' $1/*.md"
        echo
    else
        echo
        echo "Generated files:"
        echo
        ls "$1"/*.md | xargs -n1 | sed -e 's|'"$(pwd -P)"/'||g'
    fi
}

echo
echo "================= Updating Apache Spark Extension documents ================="
echo

checkout_code $SPARK_REPO_NAME

update_docs "$SPARK_WEBSITE_TEMPLATES_DIR" "$SPARK_WEBSITE_DOC_DIR" "$SPARK_BAHIR_SOURCE_DIR" \
    spark-sql-streaming-mqtt sql-streaming-mqtt \
    spark-streaming-akka streaming-akka \
    spark-streaming-mqtt streaming-mqtt \
    spark-streaming-twitter streaming-twitter \
    spark-streaming-zeromq streaming-zeromq

check_version_strings "$SPARK_WEBSITE_DOC_DIR"

echo
echo "================= Updating Apache Flink Extension documents ================="
echo

checkout_code $FLINK_REPO_NAME

update_docs "$FLINK_WEBSITE_TEMPLATES_DIR" "$FLINK_WEBSITE_DOC_DIR" "$FLINK_BAHIR_SOURCE_DIR" \
    flink-streaming-activemq flink-connector-activemq \
    flink-streaming-akka flink-connector-akka \
    flink-streaming-flume flink-connector-flume \
    flink-streaming-netty flink-connector-netty \
    flink-streaming-redis flink-connector-redis

check_version_strings "$FLINK_WEBSITE_DOC_DIR"

set +e
