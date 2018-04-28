FROM centos:7
MAINTAINER john123951 "john123951@126.com"

ARG WORK_PATH=/openwrt
ARG TMP_PATH=/tmp/openwrt_cross_toolchain

ADD ./CONFIG ${TMP_PATH}/CONFIG
ADD ./scripts ${TMP_PATH}/scripts

# install dependences
RUN yum install -y --nogpgcheck wget screen unzip bzip2 subversion git file which \
	libtool autoconf automake bison gcc binutils patch ccache flex make gettext gawk quilt asciidoc gcc-c++ ncurses-devel openssl* zlib* libssl* \
	&& yum clean all

# download openwrt sdk
RUN .${TMP_PATH}/scripts/downloader.sh \
	&& rm -rf ${TMP_PATH}

# compile & install libfastcommon

# compile & install fastdfs

# configuration

CMD ["/bin/bash"]
