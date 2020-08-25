all:
        docker buildx create --use --name build --node build --driver-opt network=host
        docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag juampe/pihole-dot:latest .

