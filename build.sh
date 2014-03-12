#!/bin/bash

set +x

if [ ! -d ./.venv ]
then
	virtualenv ./.venv
fi

source ./.venv/bin/activate
pip install -r ./requirements.txt

if [ ! -f $HOME/.aws/config ]
then
	aws configure
fi

VIRTUALBOX_VERSION=`VBoxManage --version`
BOX_NAME="${BOX_PREFIX}pp-ubuntu-12.04-virtualbox-${VIRTUALBOX_VERSION}"
BOX_PATH="${BOX_NAME}.box"
BUCKET_NAME=gds-boxes

packer build \
    -var "build_name=${BOX_NAME}" \
    templates/vagrant.json

mv packer_${BOX_NAME}_virtualbox.box ${BOX_PATH}

aws --region=eu-west-1 --output=text s3 cp --acl=public-read "${BOX_PATH}" "s3://${BUCKET_NAME}/${BOX_PATH}"

deactivate
