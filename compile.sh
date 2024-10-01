TVM=0
MLC_LLM=0

for (( i=0; i<${#1}; i++ )); do
    option="${1:$i:1}"
    if [ $option = "t" ]; then
        TVM=1
    elif [ $option = "m" ]; then
        MLC_LLM=1
    fi
done

current_dir=$PWD

if [ $TVM -eq 1 ]; then
    echo "build tvm at $current_dir/tvm/"
    mkdir $current_dir/tvm/build -p
    cd $current_dir/tvm/build
    cp ../cmake/config.cmake .
    echo "set(USE_LLVM ON)" >> config.cmake
    echo "set(USE_CUDA ON)" >> config.cmake
    echo "set(USE_NVTX ON)" >> config.cmake
    echo "set(USE_GRAPH_EXECUTOR ON)" >> config.cmake
    echo "set(USE_GRAPH_EXECUTOR_CUDA_GRAPH ON)" >> config.cmake
    echo "set(USE_VLLM ON)" >> config.cmake
    echo "set(USE_THRUST ON)" >> config.cmake
    echo "set(USE_CUTLASS ON)" >> config.cmake
    echo "set(USE_CUBLAS ON)" >> config.cmake
    echo "set(USE_NCCL ON)" >> config.cmake
    echo "set(USE_FLASHINFER ON)" >> config.cmake
    echo "set(CMAKE_CUDA_ARCHITECTURES 90)" >> config.cmake
    echo "set(USE_NVSHMEM /opt/scratch/ycai/nvshmem/install/)" >> config.cmake
    cmake ..
    cmake --build . --parallel 90
fi


if [ $MLC_LLM -eq 1 ]; then
    echo "build mlc-llm at $current_dir/mlc-llm/"
    mkdir $current_dir/mlc-llm/build -p
    cd $current_dir/mlc-llm/build
    echo "set(TVM_SOURCE_DIR $current_dir/tvm)" > config.cmake
    echo "set(USE_LLVM ON)" >> config.cmake
    echo "set(USE_CUDA ON)" >> config.cmake
    echo "set(USE_NVTX ON)" >> config.cmake
    echo "set(USE_GRAPH_EXECUTOR ON)" >> config.cmake
    echo "set(USE_GRAPH_EXECUTOR_CUDA_GRAPH ON)" >> config.cmake
    echo "set(USE_VLLM ON)" >> config.cmake
    echo "set(USE_THRUST ON)" >> config.cmake
    echo "set(USE_CUTLASS ON)" >> config.cmake
    echo "set(USE_CUBLAS ON)" >> config.cmake
    echo "set(USE_NCCL ON)" >> config.cmake
    echo "set(USE_FLASHINFER ON)" >> config.cmake
    echo "set(CMAKE_CUDA_ARCHITECTURES 90)" >> config.cmake
    echo "set(USE_NVSHMEM /opt/scratch/ycai/nvshmem/install/)" >> config.cmake
    cmake ..
    cmake --build . --parallel 90
fi
