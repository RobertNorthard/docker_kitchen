Docker container for running test-kitchen.

Idea behind is to mount the docker unix socket and use the kitchen-docker driver.

* Uses stevejmason/kitchen-docker for SSH hostname overriding.

```
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/kitchen stevejmason/docker pull stevejmason/kitchen-docker kitchen test
```
