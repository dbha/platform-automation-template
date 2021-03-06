#!/usr/bin/env bash

set -eux

current_date="$( date +"%Y-%m-%d-%H-%M-%S" )"

WORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BOSH_ENVIRONMENT="1.1.1.1"
export BOSH_BBR_ACCOUNT=bbr
export BACKUP_FILE="${BOSH_ENVIRONMENT}_director-backup_${current_date}.tgz"

SCRIPT_NAME=$(basename ${BASH_SOURCE[0]})
TMP_DIR="$WORK_DIR/${SCRIPT_NAME}_${current_date}"
echo $TMP_DIR
mkdir -p $TMP_DIR
pushd $TMP_DIR

    echo "test" > $TMP_DIR/bbr-artifcat-test
    
popd

tar -zcvf $WORK_DIR/"$BACKUP_FILE" -C $TMP_DIR . --remove-files