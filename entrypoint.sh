#!/bin/sh

set -e

sh -c "yarn && yes $PUBLISHER_TOKEN | vsce login $PUBLISHER && vsce publish -p $PUBLISHER_TOKEN"
