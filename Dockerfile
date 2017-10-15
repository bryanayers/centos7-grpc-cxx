FROM centos:7

RUN yum -y update; yum clean all
RUN yum -y install epel-release
RUN \
	yum -y install \
		autoconf \
		automake \
		curl \
		gcc \
		gcc-c++ \
		gflags-devel \
		git \
		glib2-devel \
		glibc-common \
		glibc-devel \
		gtest-devel \
		libtool \
		make \
		patch \
		unzip \
		wget \
		which \
		xz-devel \
		zlib-devel &&\
	yum clean all

# Build grpc
ENV GRPC_RELEASE_TAG v1.6.6

RUN git clone https://github.com/grpc/grpc.git /usr/local/src/grpc
RUN \
	cd /usr/local/src/grpc &&\
	git checkout tags/${GRPC_RELEASE_TAG} &&\
	git submodule update --init --recursive &&\

	cd /usr/local/src/grpc/third_party/protobuf &&\
	./autogen.sh &&\
	./configure --prefix=/usr &&\
	make && make check && make install && make clean &&\
	ldconfig &&\

	cd /usr/local/src/grpc &&\
	make &&\
	make install &&\
	cd /usr/local/src/ &&\
	rm -Rf grpc*

ENV PKG_CONFIG_PATH "/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig/:/usr/lib64/pkgconfig/"
