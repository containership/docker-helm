# docker-helm
Alpine docker image containing helm and tiller binaries

## usage

To run helm:

`docker run -it containership/docker-helm version`

To run tiller locally:

`docker run --entrypoint=tiller -p 44134:44134 -v $HOME/.kube/config:/root/.kube/config -dt containership/docker-helm`

To run helm and point at local tiller:

`docker run --env=HELM_HOST=host.docker.internal:44134 -it containership/docker-helm version`
