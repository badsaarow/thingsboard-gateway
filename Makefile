docker: thingsboard-gateway.spec
	cp -rf ./docker/* ./
	ls -la
	docker build .

clean:
	rm -rf ./docker-compose.yml ./Dockerfile ./dist ./build ./thingsboard-gateway.egg-info
	touch thingsboard-gateway.spec