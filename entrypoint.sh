#!/bin/sh

set -e

sh -c "vsce $* -p $PUBLISH_TOKEN"
