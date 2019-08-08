#!/bin/sh

set -e

sh -c "yarn && yes $PUBLISHER_TOKEN | vsce login $PUBLISHER && exit 0"
