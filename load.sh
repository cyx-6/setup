export TVM_BACKTRACE=1

export TVM_HOME="$PWD/tvm" 
export PYTHONPATH="$TVM_HOME/python:$PYTHONPATH" 
export MYPYPATH="$TVM_HOME/python/:$MYPYPATH" 

export MLC_HOME="$PWD/mlc-llm" 
export PYTHONPATH="$MLC_HOME/python:$MLC_HOME:$PYTHONPATH" 
export MYPYPATH="$MLC_HOME/python/:$MYPYPATH" 


echo "TVM_HOME = $TVM_HOME" > .env
echo "PYTHONPATH = $PYTHONPATH" >> .env
echo "MYPYPATH = $MYPYPATH" >> .env
echo "Done"
