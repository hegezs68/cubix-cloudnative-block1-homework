#!/bin/sh

sudo docker run -d --name test -p 8080:8080 ghcr.io/hegezs68/cubix/1/homework/app:springboot > /dev/null
sleep 10
curl --fail http://localhost:8080/cubix/test
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Verification failed, here are the logs"
  docker logs test
fi
sudo docker stop test > /dev/null
sudo docker rm test > /dev/null
exit $RESULT
