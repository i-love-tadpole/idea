# IDEA in docker

## usage:

```shell script
docker run --network some-network --ip some-ip -itd -e ID_PUB="$(cat ~/.ssh/id_rsa.pub)" hebo2019/idea
```

then:

```shell script
ssh -X root@some-ip idea
```
