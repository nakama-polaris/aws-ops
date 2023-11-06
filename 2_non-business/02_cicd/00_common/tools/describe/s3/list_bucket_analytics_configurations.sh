#!/bin/bash
set -eu

BUCKET_NAME="${1}"

aws s3api list-bucket-analytics-configurations \
  --bucket "${BUCKET_NAME}" \
  --query 'AnalyticsConfigurationList[*].Id' \
  --output text
