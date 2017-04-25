Gem Dependencies
================

# Note to humans

This project is intended to aggregate build-dependencies
for CI-builds of [Gem](https://github.com/umlaeute/Gem)
on the OSX-platform.

It is supposed to be automatically executed on
[Travis-CI](https://travis-ci.org/umlaeute/Gem-dependencies).
The output is supposed to be used on
[Travis-CI](https://travis-ci.org/umlaeute/Gem) as well.

It is probably of little use to you.

# What's this about?

[Gem](https://github.com/umlaeute/Gem) has a number of non-standard build dependencies.
On most linux systems, package managers will allow you to promptly install
pre-built versions of these dependencies.

On OSX however, the (currently) best package manager is [brew](https://brew.sh),
which will most of the time download the sources and then *compile* the dependencies.
This can take a considerable amount of time, eventually leading to build timeouts on the CI-infrastructure.

Basically, Gem will fail to build, because it spent too much time building its dependencies.
Since CI-building of Gem is not an exercise in building its dependencies,
this project aims at factoring out the dependency-building stage into a separate task.

# Workflow
- Gem's dependencies are maintained in this project's `.travis.yml`
- tag a `Gem-dependencies` release and push to github
- Travis-CI will start a new build of `Gem-dependencies`
  - the new build will create a tarball with all the dependencies (pre-built)
  - the tarball will also contain an extraction-helper script
- for (tagged) releases, the tarballs are uploaded as github release-artifacts
