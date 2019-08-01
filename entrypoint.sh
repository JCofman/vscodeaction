#!/bin/sh

set -e

sh -c "yarn && yes $PUBLISH_TOKEN | vsce login $PUBLISHER && vsce $* -p $PUBLISH_TOKEN"
