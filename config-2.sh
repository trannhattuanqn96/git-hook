#!/bin/bash
# Bare repository directory.
GIT_DIR="/git-hook"

while read oldrev newrev ref; do
       BRANCH=$(git rev-parse --symbolic --abbrev-ref $ref)
       if [ $BRANCH == "master" ]; then
               TARGET="/git-hook"
       elif [ $BRANCH == "staging" ]; then
               TARGET="/git-hook"
       else
               echo "Branch not found. Skipping Deployment."
       fi
       # deploy only if var TARGET is set
       if [ -z ${TARGET} ]; then
               echo "no target set"
       else
               echo "STARTING DEPLOYMENT..."
               echo "Push to ${BRANCH} received! Deploying branch: ${BRANCH} to: ${TARGET}"
               # deploy to our target directory.
               git --work-tree=$TARGET --git-dir=$GIT_DIR checkout -f $BRANCH
       fi
done