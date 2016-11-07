.PHONY: build push

IMAGE = bind
TAG = 9.10.4-P4

build:
	#docker build --no-cache -f dockerfile.1 --rm=false -t $(IMAGE):$(TAG) .
	#docker cp gigantic_noether:/usr/local/bind-9.10.4-P4/sbin/named .
	docker build --no-cache -f dockerfile.2 -t $(IMAGE):$(TAG)-final .

push:
	docker tag  $(IMAGE):$(TAG)-final  192.168.254.189:5000/bind:$(TAG)-final
	docker tag  $(IMAGE):$(TAG)-final  neotusca/bind-dev:$(TAG)-final
	docker push 192.168.254.189:5000/bind:$(TAG)-final
	docker push neotusca/bind-dev:$(TAG)-final
