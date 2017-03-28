#!/bin/sh
yum -y install git --skip-broken
yum -y install gcc-c++ uuid-devel libicu-devel icu libedit-devel libxml2-devel sqlite-devel swig python-devel ncurses-libs ncurses-devel pkgconfig libuuid-devel epel-release libbsd-devel --skip-broken
yum -y install epel-release --skip-broken
yum -y install clang --skip-broken
yum -y install cmake3 --skip-broken
ln -s /usr/bin/cmake3 /usr/bin/cmake
cd /usr/local/src/
mkdir swift
cd swift
git clone --branch swift-3.0-preview-1-branch https://github.com/apple/swift.git swift
git clone --branch release https://github.com/ninja-build/ninja.git
git clone https://github.com/apple/swift-cmark.git cmark
git clone https://github.com/apple/swift-llvm.git llvm
git clone https://github.com/apple/swift-clang.git clang
pwd
ls -la
cd swift/
utils/build-script -t -R
/usr/local/src/swift/build/Ninja-ReleaseAssert/swift-linux-x86_64/bin/swift -v
/usr/local/src/swift/build/Ninja-ReleaseAssert/swift-linux-x86_64/bin/swift -frontend -repl -target x86_64-unknown-linux-gnu -disable-objc-interop -color-diagnostics -module- name REPL
