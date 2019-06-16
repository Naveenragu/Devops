#!/bin/bash -e


#To create a 5 volumes in 5 container using the shell script
#Volume files must be in different location

for var in {1..5}
do
docker volume create Source$var
done
for var in {1..5}
do
docker run -v Source$var:/sourcecode$var --name sourcecontainer$var -itd naveenragu/docker:clamav
done
for var in {1..5}
do
docker exec -it sourcecontainer$var touch sourcecode$var/codes{1..5}
done

