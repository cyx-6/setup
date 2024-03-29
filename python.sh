sudo apt install build-essential ccache
# https://apt.llvm.org/
sudo apt install clang lldb lld clang-format clang-tidy
# https://docs.conda.io/en/latest/miniconda.html
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
conda create -n python310 python=3.10
pip3 install cmake
conda install -c anaconda numpy scipy decorator pytest
conda install -c conda-forge psutil typing-extensions black

# llm
pip3 install transformers safetensors