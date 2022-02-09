all: master

master:
	docker build . --build-arg TARGETARCH=`docker version -f "{{.Server.Arch}}"` -t juampe/pihole -f Dockerfile

nightly:
	docker build . --build-arg TARGETARCH=`docker version -f "{{.Server.Arch}}"` -t juampe/pihole:nightly -f Dockerfile.nightly

dev:
	docker build . --build-arg TARGETARCH=`docker version -f "{{.Server.Arch}}"` -t juampe/pihole:edge -f Dockerfile.dev
