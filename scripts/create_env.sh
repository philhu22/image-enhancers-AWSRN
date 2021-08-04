# usage:
# sudo -E ./scripts/create_env.sh

PROJDIR=`pwd`
ME=`ls -ld $PROJDIR | awk 'NR==1 {print $3}'`
MYGROUP=`ls -ld $PROJDIR | awk 'NR==1 {print $4}'`
echo "ME:$ME MYGROUP:$MYGROUP"
VENVDIR="venv"
ENVNAME="image-enhancer-awsrn"


#
# install python 5
#
echo "*** install python 3.5  ****"
if hash python3.5; then
    echo "Python 3.5 is already installed"
else
    apt-get update
    apt-get install build-essential checkinstall
    apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
    # download Python 3.5
    cd /usr/src
    wget https://www.python.org/ftp/python/3.5.9/Python-3.5.9.tgz
    tar xzf Python-3.5.9.tgz
    rm  Python-3.5.9.tgz
    # install Python on Linux
    cd Python-3.5.9
    sudo ./configure --enable-optimizations
    sudo make altinstall

    # check
    python3.5 -V
    which python3.5  # /usr/local/bin/python3.5
fi
cd "$PROJDIR"

#
# create a fresh python5 env
#
echo "*** create a fresh python5 env  ****"
if [ -d "$VENVDIR" ]; then
   echo "'$VENVDIR' found. I remove it now"
   rm -rf "$VENVDIR"
fi

echo "creating python environment, please wait ..."
mkdir -p "$VENVDIR"
if [ -d "$VENVDIR" ]; then
   echo "folder '$VENVDIR' created"
else
   echo "Warning: '$VENVDIR' could not be created"
   exit 1
fi

cd "$VENVDIR"
echo "create venv $ENVNAME"
python3.5 -m venv "$ENVNAME"
cd "$PROJDIR"

echo "change owner and group to '$ME:$MYGROUP'"
chown -hR $ME:$MYGROUP $VENVDIR

echo "activate new python environment"
. ./"$VENVDIR"/"$ENVNAME"/bin/activate
PIP=`which pip`
echo "$PIP"

#
# install requirements
#
echo "*** install requirements  ****"
$PIP install -r requirements.txt
