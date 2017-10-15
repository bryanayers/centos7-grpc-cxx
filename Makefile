
build:
	docker build -t centos7-grpc-cxx:1.6.6 -f Dockerfile .
	docker tag centos7-grpc-cxx:1.6.6 centos7-grpc-cxx:latest
