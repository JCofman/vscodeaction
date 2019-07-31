#!/bin/sh

set -e

sh -c "yes $PUBLISH_TOKEN | vsce login $PUBLISHER && vsce publish -p $PUBLISH_TOKEN"
