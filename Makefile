NAME=nginx-mruby-vedis-virtualhosts
IMAGE=vidarh/${NAME}
VEDISCFG=`pwd`/config

build: Dockerfile
	docker build -t ${IMAGE} .

rundev: build
	-mkdir -p ${VEDISCFG}
	-docker kill ${NAME}
	-docker rm ${NAME}
	echo ${VEDISCFg}
	docker run --rm -p 8080:80 -v ${VEDISCFG}:/config --name ${NAME} ${IMAGE}

mirb:
	echo "NOTE: Requires running dev container"
	docker exec -t -i ${NAME} /usr/local/src/ngx_mruby/mruby/build/host/bin/mirb
