#!/bin/bash
# shellcheck disable=SC2086
#
# simple script to kill any running instance, build and run a new instance
#
echo "Stopping any instance of echo that are already running"
docker stop echo
docker rm echo

echo "Building the echo container"
docker build -t echo .


echo "Running the echo container"
docker run --name echo -d -p 80:80 -p 443:443 echo

echo "testing the echo container"
RESULT=$(curl -I http://localhost)
grep -q "200 OK" <<< $RESULT
if [ "$?" != "0" ]; then
  echo "Error testing http: $RESULT"
  exit 1;
fi


RESULT=$(curl -k -H "ssltest.tropo.com" -I http://127.0.0.1)
grep -q "200 OK" <<< $RESULT
if [ "$?" != "0" ]; then
  echo "Error testing HTTPS: $RESULT"
  exit 1;
fi

echo "Done testing the echo container"
