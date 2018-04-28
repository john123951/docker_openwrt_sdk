# Openwrt SDK 交叉编译工具包
> 请自行修改CONFIG文件配置

### 使用方法
- [启动docker](#启动docker)
- [编译软件包](#编译软件包)
- [编译固件](#编译固件)

### 启动docker
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