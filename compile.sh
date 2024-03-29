if [ "$#" -eq 0 ] ; 
then
    echo 'compiling tvm'
    cd tvm
else
    echo 'compiling '$1
    cd $1
fi
rm -r build
mkdir build
cd build
cp ../cmake/config.cmake .
echo "set(USE_LLVM ON)" >> config.cmake
echo "set(USE_CUDA ON)" >> config.cmake
cmake ..
make -j24