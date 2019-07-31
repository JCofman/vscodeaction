#!/bin/sh

set -e

sh -c "message=`yes $PUBLISH_TOKEN vsce login $PUBLISHER` && message=`vsce $* -p $PUBLISH_TOKEN` &&  echo $message`

