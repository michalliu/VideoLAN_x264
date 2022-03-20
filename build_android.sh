set -e
export NDK_HOME=/Users/leoliu/Library/Android/sdk/ndk-bundle

function build() {
   set -x
   ./configure --prefix=$PREFIX \
    --cross-prefix=$CROSS_COMPILE \
    --sysroot=$SYSROOT \
    --enable-static \
    --enable-shared \
    --enable-pic \
    --disable-asm \
    --host=$host
    make clean
    make -j8
    make install
}


#x86
ARCH=x86_64
CPU=x86_64
PREFIX=$(pwd)/android/$ARCH
TOOLCHAIN=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin
SYSROOT=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot
CROSS_COMPILE=${TOOLCHAIN}/x86_64-linux-android21-
export CC=${CROSS_COMPILE}clang
export STRIP=${TOOLCHAIN}llvm-strip
export STRINGS=$TOOLCHAIN/x86_64-linux-android-strings
export AR=$TOOLCHAIN/x86_64-linux-android-ar
export RANLIB=$TOOLCHAIN/x86_64-linux-android-ranlib
host="x86_64-linux"
build

#armv7a
ARCH=armv7a
CPU=armv7a
PREFIX=$(pwd)/android/$ARCH
TOOLCHAIN=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin
SYSROOT=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot
CROSS_COMPILE=${TOOLCHAIN}/armv7a-linux-androideabi21-
export CC=${CROSS_COMPILE}clang
export STRIP=${TOOLCHAIN}llvm-strip
export STRINGS=$TOOLCHAIN/arm-linux-androideabi-strings
export AR=$TOOLCHAIN/arm-linux-androideabi-ar
export RANLIB=$TOOLCHAIN/arm-linux-androideabi-ranlib
host="arm-linux"
build


#arm64
ARCH=arm64
CPU=arm64
PREFIX=$(pwd)/android/$ARCH
TOOLCHAIN=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin
SYSROOT=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot
CROSS_COMPILE=${TOOLCHAIN}/aarch64-linux-android21-
export CC=${CROSS_COMPILE}clang
export STRIP=${TOOLCHAIN}llvm-strip
export STRINGS=$TOOLCHAIN/aarch64-linux-android-strings
export AR=$TOOLCHAIN/aarch64-linux-android-ar
export RANLIB=$TOOLCHAIN/aarch64-linux-android-ranlib
host="arm64-linux"
build
