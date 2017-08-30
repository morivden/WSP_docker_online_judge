#! /bin/bash
docker run \
  -v $HOME/document/WSP_docker_online_judge:$HOME/document/WSP_docker_online_judge \
  -v /usr/local/bin/docker:/usr/local/bin/docker \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w $HOME/document/WSP_docker_online_judge \
  -p 4567:4567 \
  --rm -i -t online_judge /bin/bash

