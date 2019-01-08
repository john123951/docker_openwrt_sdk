#!/bin/bash

Usage(){
    echo "usage: 2.self_compression.sh [--list] or [Source compressed file]"
    echo "       [Destination path]"
    echo "Self compression accroding to the file name suffix"
    exit
}

List(){
    # 提示支持的解压类型
    echo "Supported file types: zip tar tar.gz tar.bz2 tar.xz"
    exit
}

# 要解压的文件
filename=$1
# 解压到路径名
path=$2
# 获取文件名的后缀
ext="${filename##*.}"

if [ -z $filename ]; then
    # 判断用户是否输入了第一参数
    Usage;
elif [ $filename = '--list' ]; then
    # 显示支持的解压类型
    List;
elif [[ -n $filename && -n $path ]]; then
    # 解压
    case $ext in
        'tar')
            eval "tar xf $filename -C $path";;
        'gz')
            eval "tar xzf $filename -C $path";;
        'bz2')
            eval "tar xjf $filename -C $path";;
        'xz')
            eval "tar xJf $filename -C $path";;
        'zip')
            eval "unzip $filename -d $path";;
        *)
            echo 'error(101) This type is not supported(tar|gz|xz|bz2|zip)';;
    esac
    echo "decompress complete."
fi
