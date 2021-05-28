FROM ubuntu:focal

ENV DEBIAN_FRONTEND="noninteractive"

# Install custom uncrustify (Focal comes with 0.69 which is ancient)
ADD pkgs/uncrustify_0.72.0-1_focal_amd64.deb /
RUN dpkg -i uncrustify_0.72.0-1_focal_amd64.deb

# Install all other packages
# Note the ARG here: use with `--build-arg NO_APT_CACHE=$(date +%s)` to force Docker to skip the cached layers
ARG NO_APT_CACHE=0
RUN apt update -qy \
	&& apt install -qy --no-install-recommends \
		autoconf \
		automake \
		bzip2 \
		ca-certificates \
		clang-format \
		clang-tidy \
		cmake \
		cppcheck \
		curl \
		debhelper \
		dirmngr \
		doxygen \
		dpkg-dev \
		fakeroot \
		file \
		g++ \
		gcc \
		gcovr \
		git \
		gnupg \
		graphviz \
		imagemagick \
		lcov \
		libboost-system-dev \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libdb-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libglib2.0-dev \
		libgmp-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmaxminddb-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		mercurial \
		netbase \
		openssh-client \
		patch \
		procps \
		software-properties-common \
		subversion \
		unzip \
		wget \
		xz-utils \
		zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*
