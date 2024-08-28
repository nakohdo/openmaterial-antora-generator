#!/bin/bash
# Template: https://code.asam.net/common/templates/antora-base-repo-example/-/blob/standard_generator/run-build.sh
# Modified based on OSI version: https://github.com/OpenSimulationInterface/osi-antora-generator/blob/main/run-build.sh
# This script is used tackle a some specifics of the GitHub action used with a docker container. 
# It copies the cached node-modules from the container to the runner workspace and then triggers the build using npm

cp -r /usr/src/repo/. /github/workspace/.
cd repo
export NODE_OPTIONS="--max-old-space-size=8192"
exec antora --stacktrace --fetch --clean site.yml
