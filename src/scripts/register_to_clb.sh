#!/bin/bash

# CLBの名前
CLB_NAME="sankawa-deploytest"

# インスタンスIDを取得
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

# AWS CLIを使ってインスタンスをCLBに登録
aws elb register-instances-with-load-balancer --load-balancer-name $CLB_NAME --instances $INSTANCE_ID
