# Clone SFML
git clone https://github.com/SFML/SFML.git SFML
cd SFML

mkdir -p build && cd build

# Platform targets
targets=(armeabi armeabi-v7a mips x86)

# If ANDROID_NDK not set, ask her location
if [ -z "$ANDROID_NDK" ]; then
    echo Path to Android NDK:
    read ANDROID_NDK
fi

# Install every target
for target in "${targets[@]}"
do
    mkdir -p $target && cd $target
    cmake -DANDROID_ABI=$target -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchains/android.toolchain.cmake ../..
    make && sudo make install
    cd ..
done
