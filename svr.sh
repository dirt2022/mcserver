cfg() {
    echo Downloading databases...
    apt install wget dialog git -y
    cd ~
    mkdir ~/.server
    cd ~/.server && git clone https://hub.fastgit.xyz/dirt2022/mcserver .
    cat ENV.TAR.xz.1 ENV.TAR.xz.2 ENV.TAR.xz.3 > ENV.TAR.XZ
    rm ENV.TAR.xz.*
    echo Unpacking...
    sleep 1
    tar xvf ENV.TAR.XZ
    rm ENV.TAR.XZ
}

crepo() {
    sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
    apt update
    apt upgrade
}

echo Initializing...
if [ $(uname -m) == "aarch64" ];then
    if [ $(getprop ro.build.version.release) -gt "6" ];then
    #大于6 (release version more then 6)
        echo config...
        crepo
        cfg
            else
        echo less than Android 7
        echo 您设备至少需要安卓7或者更高版本
    fi
    else
        echo Not a arm64 device....
fi
