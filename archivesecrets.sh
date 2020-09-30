USER_FILTER=$1
if [ "$USER_FILTER" = "" ]; then
  export USER_FILTER=$USER
fi

SECRETS_FILE_PATH=$2
if [ "$SECRETS_FILE_PATH" = "" ]; then
  export SECRETS_FILE_PATH=$HOME/workspace/secrets
fi

export SECRETS_DIR=/run/secrets/$USER_FILTER
cd $SECRETS_DIR

echo $SECRETS_DIR to $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc

mv $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc $HOME/workspace/backup/$USER_FILTER-$(date +"%m_%d_%Y")

tar cz . | openssl enc -aes-256-cbc -md md5 -e -out $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc
