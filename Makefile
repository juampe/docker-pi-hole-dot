all:
	docker buildx build . --build-arg TARGETARCH=`docker version -f "{{.Server.Arch}}"` -t juampe/pihole
