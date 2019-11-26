# idea
idea in docker

usage:

docker run --network some-network --ip some-ip --name  -itd -e ID_PUB="$(cat ~/.ssh/id_rsa.pub)" hebo2019/idea

then:

ssh -X root@some-ip idea
