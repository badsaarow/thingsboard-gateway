compose: thingsboard-gateway.spec
	cp -rf ./docker/* ./
	docker-compose build .
	docker-compose up

docker: thingsboard-gateway.spec
	cp -rf ./docker/* ./
	mkdir -p .tb-gateway/config
	cp -rf thingsboard_gateway/config/* .tb-gateway/config/
	docker build  -t sungyong/tb-gateway:latest -t sungyong/tb-gateway:v0.1 .
	docker run --rm -it \
	-p 5000:5000 \
	-v "$(pwd)/.tb-gateway/config:/thingsboard_gateway/config" \
	-v "$(pwd)/.tb-gateway/config:/thingsboard_gateway/config" \
	-v "$(pwd)/.tb-gateway/config:/thingsboard_gateway/config" \
	sungyong/tb-gateway:latest
clean:
	docker-compose stop
	rm -rf ./docker-compose.yml ./Dockerfile ./dist ./build ./thingsboard-gateway.egg-info
	touch thingsboard-gateway.spec
