#!/bin/bash

# CLBの名前
CLB_NAME="sankawa-deploytest"

# インスタンスIDを取得
INSTANCE_ID=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" \
    -v http://169.254.169.254/latest/meta-data/instance-id/)

# AWS CLIを使ってインスタンスをCLBに登録
aws elb register-instances-with-load-balancer --load-balancer-name $CLB_NAME --instances $INSTANCE_ID
