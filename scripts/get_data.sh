
DATA_DIR='DATA'
FILENAME='DIV2K2017.zip'
FILEID='1soWZgpL_SSlKDNWcCAwESbjcNGXzugsY'

#
# prerequisite
#
echo "*** prerequisite  ****"
apt-get update
apt-get install wget unzip

#
# create a fresh DATA folder
#
echo "*** create a fresh DATA folder  ****"
if [ -d "$DATA_DIR" ]; then
   echo "'$DATA_DIR' found. I remove it now"
   rm -rf "$DATA_DIR"
fi

echo "creating data folder, please wait ..."
mkdir -p "$DATA_DIR"
if [ -d "$DATA_DIR" ]; then
   echo "folder '$DATA_DIR' created"
else
   echo "Warning: '$DATA_DIR' could not be created"
   exit 1
fi

echo "wget files ..."
wget \
    --load-cookies /tmp/cookies.txt \
    "https://docs.google.com/uc?export=download&confirm=$(wget \
        --quiet \
        --save-cookies /tmp/cookies.txt \
        --keep-session-cookies \
        --no-check-certificate \
        'https://docs.google.com/uc?export=download&id=1soWZgpL_SSlKDNWcCAwESbjcNGXzugsY' \
        -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1soWZgpL_SSlKDNWcCAwESbjcNGXzugsY" \
    -O "$FILENAME" && rm -rf /tmp/cookies.txt

echo "decompress..."
unzip -q $FILENAME -d $DATA_DIR

echo "remove zip file"
#rm $FILENAME