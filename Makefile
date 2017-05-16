
build:
	docker build -t centos7-grpc-cxx:1.3.2 -f Dockerfile .
	docker tag centos7-grpc-cxx:1.3.2 centos7-grpc-cxx:latest
