docker: thingsboard-gateway.spec
	cp -rf ./docker/* ./
	ls -la
	docker build  -t sungyong/tb-gateway:latest -t sungyong/tb-gateway:v0.1 .

clean:
	rm -rf ./docker-compose.yml ./Dockerfile ./dist ./build ./thingsboard-gateway.egg-info
	touch thingsboard-gateway.spec