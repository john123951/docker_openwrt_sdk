# Openwrt SDK 交叉编译工具包

### 使用方法
- [制作SDK镜像](#制作SDK镜像)
- [启动编译环境](#启动编译环境)
- [编译软件包](#编译软件包)
- [编译固件](#编译固件)


### 制作SDK镜像
```
# 修改CONFIG文件配置

# 修改为需要的版本
OPENWRT_VERSION=17.01.4

# 修改为SDK地址
# https://openwrt.org/docs/guide-developer/using_the_sdk
SDK_URL=https://downloads.openwrt.org/releases/17.01.4/targets/ar71xx/nand/lede-sdk-17.01.4-ar71xx-nand_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
```

### 启动编译环境
```
# 自行决定加 --rm 参数
docker run -it \
	-v $PWD:/output \
	john123951/openwrt_sdk:MT7621_15.05.1
```

### 编译软件包
```
# 进入sdk目录
cd /openwrt

# Clone 项目
git clone https://xxxxxx.git package/{PackageName}

# 选择要编译的包
make menuconfig

# 开始编译
make package/{PackageName}/compile V=99
```

### 编译固件
```
cd /openwrt
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make menuconfig
make download V=s
make -j3 V=s
```
