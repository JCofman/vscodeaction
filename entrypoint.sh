#!/bin/sh

set -e

sh -c "yarn && yes $PUBLISHER_TOKEN | vsce login $PUBLISHER && vsce $* -p $PUBLISHER_TOKEN"
