if [ "$#" -eq 0 ] ; then
    echo 'Need argument 1 for tvm directory name.'
    exit 0
fi
export TVM_HOME="$PWD/$1" 
export PYTHONPATH="$TVM_HOME/python:$PYTHONPATH" 
export TVM_LIBRARY_PATH="$TVM_HOME/build/" 
export MYPYPATH="$TVM_HOME/python/:$MYPYPATH" 
echo "TVM_HOME = $TVM_HOME" > .env
echo "PYTHONPATH = $PYTHONPATH" >> .env
echo "TVM_LIBRARY_PATH = $TVM_LIBRARY_PATH" >> .env
echo "MYPYPATH = $MYPYPATH" >> .env
echo "Done"