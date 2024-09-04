#!/bin/bash

# CLBの名前
if [ "${DEPLOYMENT_GROUP_NAME}" == "web" ]; then
    CLB_NAME="sankawa-deploytest"
elif [ "${DEPLOYMENT_GROUP_NAME}" == "Training" ]; then
    CLB_NAME="training-load-balancer"
elif [ "${DEPLOYMENT_GROUP_NAME}" == "Production" ]; then
    CLB_NAME="production-load-balancer"
else
    echo "Unknown deployment group: ${DEPLOYMENT_GROUP_NAME}"
    exit 1
fi


# インスタンスIDを取得
INSTANCE_ID=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" \
    -v http://169.254.169.254/latest/meta-data/instance-id/)

# AWS CLIを使ってインスタンスをCLBから登録解除
aws elb deregister-instances-from-load-balancer --load-balancer-name $CLB_NAME --instances $INSTANCE_ID
