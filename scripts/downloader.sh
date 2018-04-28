#!/bin/bash

PWD_PATH=`dirname $0`
CONFIG_FILE=${PWD_PATH}/'../CONFIG'
DOWNLOAD_PATH=${PWD_PATH}/'../downloads'

OPENWRT_VERSION=`cat ${CONFIG_FILE}| sed -n "s/OPENWRT_VERSION=\(.*\)/\1/p"`
SDK_URL=`cat ${CONFIG_FILE}| sed -n "s/SDK_URL=\(.*\)/\1/p"`

echo 'downloading sdk......'
mkdir ${DOWNLOAD_PATH} -p
wget ${SDK_URL} --directory-prefix=${DOWNLOAD_PATH}

echo 'extract......'
FILE_NAME=${SDK_URL##*/}
tar xjf ${DOWNLOAD_PATH}/${FILE_NAME} --directory=${DOWNLOAD_PATH}

echo 'move folder......'
echo 'work directory: '$WORK_PATH
PATH_NAME=`ls -F ${DOWNLOAD_PATH} | grep '/$'`
mv ${DOWNLOAD_PATH}/${PATH_NAME} ${WORK_PATH}

echo 'clearing......'
rm -rf ${DOWNLOAD_PATH}

echo 'done'