---
layout: page
title: Contributing
description: Contributing to the project page
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

This guide documents the best way to make various types of contribution to Apache Bahir, including what is required before submitting a code change and how to properly merge them.

Contributing to Bahir doesn't just mean writing code. Helping testing and reviewing pull requests and improving documentation are also welcome. In fact, proposing significant code changes usually requires first gaining experience and credibility within the community by helping in other ways. This is also a guide to becoming an effective contributor.


#Contributing by Helping Other Users

A great way to contribute to Bahir is to help answer user questions on the [user@bahir.apache.org]({{ site.data.project.user_list_archive_mailarchive }}) mailing list. There are always many new users; taking a few minutes to help answer a question is a very valuable community service.

Contributors should subscribe to this list and follow it in order to keep up to date on what's happening in Bahir. Answering questions is an excellent and visible way to help the community, which also demonstrates your expertise.


#Contributing by Testing Releases

Bahir's release process is community-oriented, and members of the community can vote on new releases on the [dev@bahir.apache.org]({{ site.data.project.dev_list_archive_mailarchive }}) mailing list. Bahir users are invited to subscribe to this list to receive announcements of release vote, and test Bahir extensions on newer release and provide feedback on any performance or correctness issues found in the newer release.

<!--
{% comment %}
# Contributing Documentation Changes

To create or modify the project documentation, edit the Markdown source files which is usually located at $project/docs directory, whose README file shows how to build the documentation locally to test your changes.

The process to propose a doc change is otherwise the same as the process for proposing code changes below.
{% endcomment %}
-->

# Contributing code changes

Please review the preceding section before proposing a code change. This section documents how to do so:


<img src='https://developer.atlassian.com/s/en_GB/5989/aaad9997c145089d7f38b9dea0ac5b91728ef55a.56/_/images/icons/emoticons/check.png'> **When you contribute code, you affirm that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.**



1. [Identifiyng JIRAS](#JIRA)
1. [Before creating a Pull Request](#Before+creating+a+Pull+Request)
1. [Creating a Pull Request](#Creating+a+Pull+Request)
1. [The Review Process](#The+Review+Process)
4. [Merging Pull Requests](#Merging+Pull+Requests)

## JIRA

Bahir uses JIRA to track issues, including bugs and improvements, and uses Github pull requests to manage the review and merge of specific code changes. That is, JIRAs are used to describe what should be fixed or changed, and high-level approaches, and pull requests describe how to implement that change in the project's source code. For example, major design decisions are discussed in JIRA.

1. Find the existing [Bahir JIRA](https://issues.apache.org/jira/browse/BAHIR) that the change pertains to.
  * Do not create a new JIRA if creating a change to address an existing issue in JIRA; add to the existing discussion and work instead
  * Look for existing pull requests that are linked from the JIRA, to understand if someone is already working on the JIRA
1. If the change is new, then it usually needs a new JIRA. However, trivial changes, where the what should change is virtually the same as the how it should change do not require a JIRA. Example: "Fix typos in Foo scaladoc"
1. If required, create a new JIRA:
  * Provide a descriptive Title. "Update web UI" or "Problem in scheduler" is not sufficient. "Kafka Streaming support fails to handle empty queue in YARN cluster mode" is good.
  * Write a detailed Description. For bug reports, this should ideally include a short reproduction of the problem. For new features, it may include a design document.
  * Set required fields:
    * **Issue Type**. Generally, Bug, Improvement and New Feature are the only types used in Bahir.
    * **Priority**. Set to Major or below; higher priorities are generally reserved for committers to set. JIRA tends to unfortunately conflate "size" and "importance" in its Priority field values. Their meaning is roughly:
      * Blocker: pointless to release without this change as the release would be unusable to a large minority of users
      * Critical: a large minority of users are missing important functionality without this, and/or a workaround is difficult
      * Major: a small minority of users are missing important functionality without this, and there is a workaround
      * Minor: a niche use case is missing some support, but it does not affect usage or is easily worked around
      * Trivial: a nice-to-have change but unlikely to be any problem in practice otherwise 
    * **Component**
    * **Affects Version**. For Bugs, assign at least one version that is known to exhibit the problem or need the change
  * Do not set the following fields:
    * **Fix Version**. This is assigned by committers only when resolved.
    * **Target Version**. This is assigned by committers to indicate a PR has been accepted for possible fix by the target version.
  * Do not include a patch file; pull requests are used to propose the actual change.
1. If the change is a large change, consider inviting discussion on the issue at dev@bahir.apache.org first before proceeding to implement the change.


## Before creating a Pull Request

Fork the Github repository at https://github.com/apache/bahir and clone your fork if you haven't already

* If you haven't done so, please set upstream as described in [GitHub Documentation](https://help.github.com/articles/configuring-a-remote-for-a-fork/)

Make sure you have the most up to date code

Make sure you do not have any uncommitted changes and rebase master with latest changes from upstream:

    git fetch upstream
    git checkout master
    git rebase upstream/master

Now you should rebase your branch with master, to receive the upstream changes

    git checkout branch
    git rebase master


In both cases, you can have conflicts:

    
    error: could not apply fa39187... something to add to patch A
    
    When you have resolved this problem, run "git rebase --continue".
    If you prefer to skip this patch, run "git rebase --skip" instead.
    To check out the original branch and stop rebasing, run "git rebase --abort".
    Could not apply fa39187f3c3dfd2ab5faa38ac01cf3de7ce2e841... Change fake file


Here, Git is telling you which commit is causing the conflict (fa39187). You're given three choices:

* You can run **git rebase --abort** to completely undo the rebase. Git will return you to your branch's state as it was before git rebase was called.
* You can run **git rebase --skip** to completely skip the commit. That means that none of the changes introduced by the problematic commit will be included. It is very rare that you would choose this option.
* You can fix the conflict.

To fix the conflict, you can follow [the standard procedures for resolving merge conflicts from the command line](https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line). When you're finished, you'll need to call **git rebase --continue** in order for Git to continue processing the rest of the rebase.

##Creating a Pull Request

1. Create a new branch, push commits to the branch.
1. Consider whether documentation or tests need to be added or updated as part of the change, and add them as needed.
1. Open a pull request against the master branch of apache/bahir. (Only in special cases would the PR be opened against other branches.)
  * The PR title should be of the form [BAHIR-xxxx] Title, where BAHIR-xxxx is the relevant JIRA number and Title may be the JIRA's title or a more specific title describing the PR itself.
  * If the pull request is still a work in progress, and so is not ready to be merged, but needs to be pushed to Github to facilitate review, then add [WIP] after the component.
1. Follow [The 7 rules for a great commit message](http://chris.beams.io/posts/git-commit/)
  * Separate subject from body with a blank line
  * Limit the subject line to 50 characters
  * Capitalize the subject line
  * Do not end the subject line with a period
  * Use the imperative mood in the subject line
  * Wrap the body at 72 characters
  * Use the body to explain what and why vs. how

Below is an example of a good commit message

    [BAHIR-130] Performance enhancements for decision tree
    
    Generate Matrix with random values through local memory
    if there is sufficient memory.


##Code Review Criteria
Before considering how to contribute code, it's useful to understand how code is reviewed, and why changes may be rejected. Simply put, changes that have many or large positives, and few negative effects or risks, are much more likely to be merged, and merged quickly. Risky and less valuable changes are very unlikely to be merged, and may be rejected outright rather than receive iterations of review.

**Positives**

* Fixes the root cause of a bug in existing functionality
* Adds functionality or fixes a problem needed by a large number of users
* Simple, targeted
* Easily tested; has tests
* Reduces complexity and lines of code
* Change has already been discussed and is known to committers

**Negatives, Risks**

* Band-aids a symptom of a bug only
* Introduces complex new functionality, especially an API that needs to be supported
* Adds complexity that only helps a niche use case 
* Changes a public API or semantics (rarely allowed)
* Adds large dependencies
* Changes versions of existing dependencies
* Adds a large amount of code
* Makes lots of modifications in one "big bang" change

##The Review Process

* Other reviewers, including committers, may comment on the changes and suggest modifications. Changes can be added by simply pushing more commits to the same branch.
* Lively, polite, rapid technical debate is encouraged from everyone in the community. The outcome may be a rejection of the entire change.
* Reviewers can indicate that a change looks suitable for merging with a comment such as: "I think this patch looks good". Bahir uses the LGTM convention for indicating the strongest level of technical sign-off on a patch: simply comment with the word "LGTM". It specifically means: "I've looked at this thoroughly and take as much ownership as if I wrote the patch myself". If you comment LGTM you will be expected to help with bugs or follow-up issues on the patch. Consistent, judicious use of LGTMs is a great way to gain credibility as a reviewer with the broader community.
* Sometimes, other changes will be merged which conflict with your pull request's changes. The PR can't be merged until the conflict is resolved. This can be resolved with "git fetch origin" followed by "git merge origin/master" and resolving the conflicts by hand, then pushing the result to your branch.
* Try to be responsive to the discussion rather than let days pass between replies

