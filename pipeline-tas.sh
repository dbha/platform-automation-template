

#!/bin/bash

if [ -z $1 ] || [ -z $2 ] ; then
    echo "!!! please provide parameters"
	echo "${BASH_SOURCE[0]} [fly-target] [foundation]"
	exit
fi	
FLY_TARGET=$1
FOUNDATION=$2
#PIPELINE_NAME="${FOUNDATION}-tas"
PIPELINE_NAME="${FOUNDATION}-pks"
WORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## ytt from https://github.com/k14s/ytt/releases
./ytt template \
    -f pipeline-template/pipeline-tas.yml \
    -f pipeline-template/resource_types.lib.yml \
    -f pipeline-template/common_resources.lib.yml \
    -f pipeline-template/opsman_resources.lib.yml \
    -f pipeline-template/opsman_jobs.lib.yml \

    -f $WORK_DIR/pipeline-templates/pks_products_groups.lib.yml \
    -f $WORK_DIR/pipeline-templates/pks_products_resources.lib.yml \
    -f $WORK_DIR/pipeline-templates/pks_products_jobs.lib.yml \

    -f pipeline-template/tas_products_resources.lib.yml \
    -f pipeline-template/tas_products_jobs.lib.yml \
    --ignore-unknown-comments > ./pipeline-tas-generated.yml

fly -t ${FLY_TARGET} sp -p "${PIPELINE_NAME}" \
-c $WORK_DIR/${PIPELINE_YAML} \
-c ./pipeline-tas-generated.yml \
-v foundation=${FOUNDATION} \
-v pipeline_name="${PIPELINE_NAME}"  \
-l ./envs/${FOUNDATION}/pipeline-vars/params.yml
