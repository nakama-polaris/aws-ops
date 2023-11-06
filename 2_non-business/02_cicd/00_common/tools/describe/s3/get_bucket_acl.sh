#!/bin/bash
set -eu

BUCKET_NAME="${1}"

aws s3api get-bucket-acl \
  --bucket "${BUCKET_NAME}"
